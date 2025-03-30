variable "env" {
    description = "This is the environment name, eg.dev/stg/prd"
    type = string
}

variable "instance_type" {
    description = "This is instance type of ec2 instances"
    type = string
}

variable "instance_count" {
  description = "This is count of no of instances that i need"
  type = number
}

variable "ami" {
  description = "this is ami id for ec2 instance"
  type = string
}

variable "volume_size" {
  description = "This is the size of volume"
  type = number
}