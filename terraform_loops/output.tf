output "print_the_names" {
  value = [for name in var.users_for_each_set : name]
}

output "user_with_roles" {
  value = [for name, role in var.users_for_each_map : "${name} is the ${role}"]
}
