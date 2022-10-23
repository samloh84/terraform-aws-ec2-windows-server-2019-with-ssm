Invoke-WebRequest `
    https://s3.${aws_region_current}.amazonaws.com/amazoncloudwatch-agent-${aws_region_current}/windows/amd64/latest/amazon-cloudwatch-agent.msi `
    -OutFile $env:USERPROFILE\Desktop\amazon-cloudwatch-agent.msi

Start-Process `
    -FilePath "$env:systemroot\system32\msiexec.exe" `
    -ArgumentList "/i `"$env:USERPROFILE\Desktop\amazon-cloudwatch-agent.msi`"" `
    -Wait

Remove-Item -Force $env:USERPROFILE\Desktop\amazon-cloudwatch-agent.msi

$CloudWatchAgentJson = @"
${cloudwatch_agent_json}
"@

$CloudWatchAgentJson | Out-File -Encoding ASCII -FilePath $Env:ProgramData\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent.json

& "$Env:ProgramFiles\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-ctl.ps1" -a fetch-config -m ec2 -s -c file:$Env:ProgramData\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent.json
