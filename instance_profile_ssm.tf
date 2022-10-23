resource "aws_iam_role" "instance_profile_iam_role" {
  name               = "${var.name}-instance-profile"
  assume_role_policy = data.aws_iam_policy_document.ssm_instance_profile_iam_role_assume_role_policy.json
}

resource "aws_iam_instance_profile" "ssm_instance_profile" {
  name = "ssm_instance_profile"
  role = aws_iam_role.instance_profile_iam_role.name
}


resource "aws_iam_role_policy_attachment" "ssm_instance_profile_iam_role_ssm_managed_instance_core_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.instance_profile_iam_role.name
}
resource "aws_iam_role_policy_attachment" "ssm_instance_profile_iam_role_cloudwatch_agent_server_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  role       = aws_iam_role.instance_profile_iam_role.name
}

resource "aws_iam_role_policy_attachment" "ssm_instance_profile_iam_role_ssm_instance_profile_iam_policy" {
  policy_arn = aws_iam_policy.ssm_instance_profile_iam_policy.arn
  role       = aws_iam_role.instance_profile_iam_role.name
}

// https://docs.aws.amazon.com/systems-manager/latest/userguide/setup-instance-profile.html
// https://docs.aws.amazon.com/systems-manager/latest/userguide/getting-started-create-iam-instance-profile.html#create-iam-instance-profile-ssn-logging
data "aws_iam_policy_document" "ssm_instance_profile_iam_policy" {
  statement {
    sid    = "AllowDownloadFromSsmS3Buckets"
    effect = "Allow"
    actions = [
      "s3:GetObject"
    ]
    resources = [
      "arn:aws:s3:::aws-ssm-${data.aws_region.current.name}/*",
      "arn:aws:s3:::aws-windows-downloads-${data.aws_region.current.name}/*",
      "arn:aws:s3:::amazon-ssm-${data.aws_region.current.name}/*",
      "arn:aws:s3:::amazon-ssm-packages-${data.aws_region.current.name}/*",
      "arn:aws:s3:::${data.aws_region.current.name}-birdwatcher-prod/*",
      "arn:aws:s3:::aws-ssm-distributor-file-${data.aws_region.current.name}/*",
      "arn:aws:s3:::aws-ssm-document-attachments-${data.aws_region.current.name}/*",
      "arn:aws:s3:::patch-baseline-snapshot-${data.aws_region.current.name}/*",
      "arn:aws:s3:::amazoncloudwatch-agent-${data.aws_region.current.name}/*"
    ]
  }

  statement {
    sid    = "AllowLoggingToCloudWatchLogGroup"
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams"
    ]
    resources = [
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:${var.cloudwatch_log_group_ssm_logs}:*",
      "arn:aws:logs:*:*:log-group:${var.cloudwatch_log_group_ec2_logs}:*"
    ]
  }

  statement {
    sid    = "AllowLoggingToS3Bucket"
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:GetEncryptionConfiguration"
    ]
    resources = [
      "arn:aws:s3:::${var.s3_bucket_ssm_logs}",
    "arn:aws:s3:::${var.s3_bucket_ssm_logs}/*"]
  }


  statement {
    sid    = "AllowAccessToKmsKeyForSsmLogging"
    effect = "Allow"
    actions = [
      "kms:Decrypt"
    ]
    resources = [
      var.kms_key_cloudwatch_log_group_ssm_logs
    ]
  }

}

data "aws_iam_policy_document" "ssm_instance_profile_iam_role_assume_role_policy" {
  statement {
    effect = "Allow"
    principals {
      identifiers = [
        "ec2.amazonaws.com"
      ]
      type = "Service"
    }
    actions = [
      "sts:AssumeRole"
    ]
  }
}


resource "aws_iam_policy" "ssm_instance_profile_iam_policy" {
  name   = "ssm_instance_profile_iam_policy"
  policy = data.aws_iam_policy_document.ssm_instance_profile_iam_policy.json
}

