# ec2-instance resouce 권한 매핑
resource "aws_iam_instance_profile" "test-ec2-instance-profile" {
  name = "test-ec2-instance-profile"
  path = "/"
  role = "test-iam-ec2-instance-bastion"
}