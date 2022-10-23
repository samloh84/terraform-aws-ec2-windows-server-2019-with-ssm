<!-- BEGIN_TF_DOCS -->
# AWS EC2 Windows Server 2019 with SSM

This Terraform module creates a Windows Server 2019 EC2 instance with AWS Systems Manager enabled.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.36 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.36 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.ssm_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.ssm_instance_profile_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.instance_profile_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ssm_instance_profile_iam_role_cloudwatch_agent_server_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ssm_instance_profile_iam_role_ssm_instance_profile_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ssm_instance_profile_iam_role_ssm_managed_instance_core_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.ssm_instance_profile_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ssm_instance_profile_iam_role_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_ssm_parameter.windows_server_2019_latest_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Associate Public IP Address | `bool` | `true` | no |
| <a name="input_cloudwatch_log_group_ec2_logs"></a> [cloudwatch\_log\_group\_ec2\_logs](#input\_cloudwatch\_log\_group\_ec2\_logs) | Cloudwatch Log Group Name for EC2 logs | `string` | n/a | yes |
| <a name="input_cloudwatch_log_group_ssm_logs"></a> [cloudwatch\_log\_group\_ssm\_logs](#input\_cloudwatch\_log\_group\_ssm\_logs) | Cloudwatch Log Group Name for SSM logs | `string` | n/a | yes |
| <a name="input_ec2_password_hash"></a> [ec2\_password\_hash](#input\_ec2\_password\_hash) | Set password for additional EC2 user | `string` | `null` | no |
| <a name="input_ec2_username"></a> [ec2\_username](#input\_ec2\_username) | Add an additional EC2 username | `string` | `null` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance Type | `string` | `"t3.small"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | EC2 Key Pair Name | `string` | n/a | yes |
| <a name="input_kms_key_cloudwatch_log_group_ssm_logs"></a> [kms\_key\_cloudwatch\_log\_group\_ssm\_logs](#input\_kms\_key\_cloudwatch\_log\_group\_ssm\_logs) | KMS Key for encrypting SSM logs | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of VPC. Resources will be tagged with this Name. | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Name of Owner. Resources will be tagged with this Owner. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Name of Project. Resources will be tagged with this Project. | `string` | n/a | yes |
| <a name="input_s3_bucket_ssm_logs"></a> [s3\_bucket\_ssm\_logs](#input\_s3\_bucket\_ssm\_logs) | S3 Bucket Name for SSM logs | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID | `string` | n/a | yes |
| <a name="input_unlimited_cpu_credits"></a> [unlimited\_cpu\_credits](#input\_unlimited\_cpu\_credits) | Enable Unlimited CPU Credits for t2 and t3 instances | `bool` | `true` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | IDs of VPC Security Groups to attach EC2 to | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance"></a> [instance](#output\_instance) | n/a |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | n/a |
| <a name="output_instance_profile_iam_role_arn"></a> [instance\_profile\_iam\_role\_arn](#output\_instance\_profile\_iam\_role\_arn) | n/a |
<!-- END_TF_DOCS -->