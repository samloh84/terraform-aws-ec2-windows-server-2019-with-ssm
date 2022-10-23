locals {

  cloudwatch_agent_config_windows = {
    "agent" = {
      "region"  = data.aws_region.current.name
      "logfile" = "C:\\ProgramData\\Amazon\\AmazonCloudWatchAgent\\Logs\\amazon-cloudwatch-agent.log"
    }
    "logs" : {
      "logs_collected" = {
        "files" = {
          "collect_list" = [
            {
              "file_path"       = "C:\\ProgramData\\Amazon\\AmazonCloudWatchAgent\\Logs\\amazon-cloudwatch-agent.log"
              "log_group_name"  = var.cloudwatch_log_group_ec2_logs
              "log_stream_name" = "{instance_id}_cloudwatch-agent"
              "timezone"        = "Local"
            }
          ]
        }
        "windows_events" = {
          "collect_list" = [
            {
              "event_name" = "System"
              "event_levels" = [
                "INFORMATION",
                "ERROR"
              ]
              "log_group_name"  = var.cloudwatch_log_group_ec2_logs
              "log_stream_name" = "{instance_id}_Windows-System"
              "event_format"    = "xml"
            },
            {
              "event_name" = "Security"
              "event_levels" = [
                "INFORMATION",
                "ERROR"
              ]
              "log_group_name"  = var.cloudwatch_log_group_ec2_logs
              "log_stream_name" = "{instance_id}_Windows-Security"
              "event_format"    = "xml"
            },
            {
              "event_name" = "Microsoft-Windows-TerminalServices-RemoteConnectionManager/Operational"
              "event_levels" = [
                "INFORMATION",
                "ERROR"
              ]
              "log_group_name"  = var.cloudwatch_log_group_ec2_logs
              "log_stream_name" = "{instance_id}_Windows-TerminalServices-RemoteConnectionManager-Operational"
              "event_format"    = "xml"
            }
          ]
        }
      }
    }
  }


  cloudwatch_agent_config_windows_json = jsonencode(local.cloudwatch_agent_config_windows)

}