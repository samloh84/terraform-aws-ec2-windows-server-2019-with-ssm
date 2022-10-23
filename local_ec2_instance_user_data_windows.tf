locals {
  user_data_windows = join("\n", [
    "<powershell>",
    templatefile("${path.module}/install-ssm-agent.ps1.tftpl", {
      aws_region_current = data.aws_region.current.name
    }),
    templatefile("${path.module}/install-cloudwatch-agent.ps1.tftpl", {
      aws_region_current    = data.aws_region.current.name
      cloudwatch_agent_json = local.cloudwatch_agent_config_windows_json
    }),
    "</powershell>"
  ])

  user_data_windows_base64 = base64encode(local.user_data_windows)
}
