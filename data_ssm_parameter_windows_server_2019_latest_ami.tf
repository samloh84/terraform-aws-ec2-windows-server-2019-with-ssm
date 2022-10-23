data "aws_ssm_parameter" "windows_server_2019_latest_ami" {
  name = "/aws/service/ami-windows-latest/Windows_Server-2019-English-Full-Base"
}
