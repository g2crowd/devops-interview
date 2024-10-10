provider "kubernetes" {
  host                   = aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.eks.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = format("tf-%s-vpc",var.name)
  cidr = var.vpc_cidr

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = vpc_private_subnets
  public_subnets  = vpc_public_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Name = format("tf-%s-vpc",var.name)
  }
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = format("tf-%s-eks-cluster",var.name)
  cluster_version = "1.25"
  subnets         = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t3.medium"

      key_name = "devops-interview-key"
    }
  }
}

data "aws_eks_cluster_auth" "eks" {
  name = aws_eks_cluster.eks.id
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = format("tf-%s-nginx-deployment",var.name)
    namespace = "default"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:latest"

          ports {
            container_port = 80
          }

          volume_mount {
            name       = "html"
            mount_path = "/usr/share/nginx/html"
          }
        }

        volume {
          name = "html"

          config_map {
            name = kubernetes_config_map.nginx_html.metadata[0].name
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    name      = format("tf-%s-nginx-service",var.name)
    namespace = "default"
  }

  spec {
    selector = {
      app = "nginx"
    }

    type = "LoadBalancer"

    port {
      port        = 80
      target_port = 80
    }
  }
}

resource "kubernetes_config_map" "nginx_html" {
  metadata {
    name      = format("tf-%s-nginx-html",var.name)
    namespace = "default"
  }

  data = {
    index.html = <<EOF
      <!DOCTYPE html>
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome to G2</title>
      </head>
      <body>
        <h1>Welcome to G2</h1>
      </body>
      </html>
    EOF
  }
}