variable "name" {
  type        = string
  description = "Name of VPC. Resources will be tagged with this Name."
}

variable "project" {
  type        = string
  description = "Name of Project. Resources will be tagged with this Project."
}

variable "owner" {
  type        = string
  description = "Name of Owner. Resources will be tagged with this Owner."
}

variable "associate_public_ip_address" {
  type        = bool
  default     = true
  description = "Associate Public IP Address"
}

variable "key_name" {
  type        = string
  description = "EC2 Key Pair Name"

}
variable "subnet_id" {
  type = string

  description = "Subnet ID"

}
variable "instance_type" {
  type = string

  default     = "t3.small"
  description = "Instance Type"

}

variable "vpc_security_group_ids" {
  type = list(string)

  default     = null
  description = "IDs of VPC Security Groups to attach EC2 to"
}

variable "ec2_username" {
  type = string

  default     = null
  description = "Add an additional EC2 username"
}
variable "ec2_password_hash" {
  type        = string
  default     = null
  sensitive   = true
  description = "Set password for additional EC2 user"
}

variable "unlimited_cpu_credits" {
  type        = bool
  default     = true
  description = "Enable Unlimited CPU Credits for t2 and t3 instances"
}

variable "cloudwatch_log_group_ec2_logs" {
  type = string
  description = "Cloudwatch Log Group Name for EC2 logs"
}
variable "cloudwatch_log_group_ssm_logs" {
  type = string
  description = "Cloudwatch Log Group Name for SSM logs"
}
variable "kms_key_cloudwatch_log_group_ssm_logs" {
  type = string
  description = "KMS Key for encrypting SSM logs"
}

variable "s3_bucket_ssm_logs" {
  type = string
  description = "S3 Bucket Name for SSM logs"
}