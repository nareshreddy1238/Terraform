output "user_arn" {
  value = aws_iam_user.newusers.*.arn
}
