output "instance" {
  value = aws_instance.main
}


output "instance_profile_iam_role_arn" {
  value = aws_iam_role.instance_profile_iam_role.arn
}

output "instance_id" {
  value = aws_instance.main.id
}
