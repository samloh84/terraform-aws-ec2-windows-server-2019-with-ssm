Invoke-WebRequest `
    https://amazon-ssm-${aws_region_current}.s3.ap-southeast-1.amazonaws.com/latest/windows_amd64/AmazonSSMAgentSetup.exe `
    -OutFile $env:USERPROFILE\Desktop\SSMAgent_latest.exe
Start-Process `
    -FilePath $env:USERPROFILE\Desktop\SSMAgent_latest.exe `
    -ArgumentList "/S" `
    -Wait

Remove-Item -Force $env:USERPROFILE\Desktop\SSMAgent_latest.exe

Restart-Service AmazonSSMAgent

