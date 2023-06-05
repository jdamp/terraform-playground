variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "instance_ami" {
  description = "AMI used for the EC2 instances"
  type        = string
  default     = "ami-04e601abe3e1a910f"
}

variable "key_pair_name" {
  type    = string
  default = "demo-key-pair"
}
variable "public_key" {
  description = "Public Key for ssh access"
  type        = string
}