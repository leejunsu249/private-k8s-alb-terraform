# ec2-instance resouce ๊ถํ ๋งคํ
resource "aws_iam_instance_profile" "test-ec2-instance-profile" {
  name = "test-ec2-instance-profile"
  path = "/"
  role = "test-iam-ec2-instance-bastion"
}