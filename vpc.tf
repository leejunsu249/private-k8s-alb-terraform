resource "aws_vpc" "main" {
    cidr_block = "192.168.0.0/16"
    enable_dns_hostnames             = "true"
    enable_dns_support               = "true"
    instance_tenancy                 = "default"

    tags = {
        Name = "eks-tf-vpc"
        "kubernetes.io/cluster/eksstart" = "shared"
    }
}