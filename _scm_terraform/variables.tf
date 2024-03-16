variable "mapping" {
  type = map(object({
    project_name         = string
    environment          = string
    my_public_ip         = string
    public_subnet_cidrs  = map(string)
    private_subnet_cidrs = map(string)
    general_tags         = map(string)
    instance_type        = string
    ami_id               = string
  }))
}
# variable "vpc_name" {
#   type        = string
#   description = "vpc name"
#   default     = "terraform-labs"
# }

# variable "project_name" {
#   type        = string
#   description = "vpc name"
# }

# variable "environment" {
#   type        = string
#   description = "environment"
# }

# variable "public_subnet_cidrs" {
#   type        = list(string)
#   description = "Public Subnet CIDR values"
# }

# variable "private_subnet_cidrs" {
#   type        = list(string)
#   description = "Private Subnet CIDR values"
# }

# variable "azs" {
#   type        = list(string)
#   description = "Availability Zones"
#   default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
# }
