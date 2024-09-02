variable "key_name" {
  description = "Name of the AWS EC2 Key Pair"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for Jenkins"
  default     = "t3.medium"
}
