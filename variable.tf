variable "key_pair" {
    default = ""
}
variable "username" {
  # If you don't fill this in, you will be prompted for it
  default = ""
}

variable "password" {
  # If you don't fill this in, you will be prompted for it
  default = ""
}

variable "domain_name" {
  # If you don't fill this in, you will be prompted for it
  default = ""
}

variable "tenant_name" {
  default = ""
}

variable "auth_url" {
  default = "https://iam.eu-west-0.prod-cloud-ocb.orange-business.com/v3"
}