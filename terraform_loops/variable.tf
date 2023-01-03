
variable "user_names" {
  description = "IAM usernames count & for loop"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}

variable "users_for_each_set" {
  description = "IAM usernames for_each loop with set method"
  type        = set(string)
  default     = ["u1", "u2", "u3"]
}

variable "users_for_each_map" {
  description = "IAM usernames for_each loop with map method"
  type        = map(string)
  default     = {
    usr1      = "normal user"
    usr2  = "admin user"
    usr3 = "root user"
  }
}


