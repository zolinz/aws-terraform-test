

variable "vm_name" {
  description = "name of the vm"
  type = string
}


variable "subnet_id" {
  description = "subnet id"
  type = string
}


variable "my_sec_group" {
  type = list(string)
}
