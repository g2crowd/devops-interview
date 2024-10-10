variable "name" {
    type        = string
    description = "Name of EKS infrastructure"
    default     = ""
}

variable "vpc_cidr" {
    type        = string
    description = "Cidr block for VPC'
    default     = "10.0.0.0/16"
}
variable "azs" {
    type        = list(string)
    description = "AZs in which you prefer"
    default     = []
}
variable "vpc_private_subnets" {
    type        = list(string)
    description = " Private subnet IP cidr"
    default     = []
}

variable "vpc_public_subnets" {
    type        = list(string)
    description = " public subnet IP cidr"
    default     = []
}