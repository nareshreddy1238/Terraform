variable instance_type {
  type        = string
  default     = "t2.micro"
  description = "t2.micro instance type selected"

  validation {
    condition = can(regex("^[Tt][2-3].(nano|micro|small)",var.instance_type))
    error_message = "Invalid Instance Type Name. you can only choose the-t2.nano,t2.micro,t2.small"
  }
}
