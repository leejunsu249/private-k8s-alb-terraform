############ public subnet ############################
resource "aws_subnet" "public-a" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.1.0/24"
    availability_zone = "ap-northeast-2a"
    map_public_ip_on_launch = true
    private_dns_hostname_type_on_launch   = "ip-name"

    tags = {
        "Name"                            = "public-a"
        "kubernetes.io/cluster/eksstart"  = "shared"
        "kubernetes.io/role/elb"          = 1
    }
}

resource "aws_subnet" "public-c" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.2.0/24"
    availability_zone = "ap-northeast-2c"
    map_public_ip_on_launch = true
    private_dns_hostname_type_on_launch   = "ip-name"

    tags = {
        "Name"                            = "public-c"
        "kubernetes.io/cluster/eksstart"  = "shared"
        "kubernetes.io/role/elb"          = 1
    }
}

############ private subnet ############################
resource "aws_subnet" "private-a" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.3.0/24"
    availability_zone = "ap-northeast-2a"
    private_dns_hostname_type_on_launch   = "ip-name"

    tags = {
        "Name"                            = "private-a"
        "kubernetes.io/cluster/eksstart"  = "shared"
    }
}

resource "aws_subnet" "private-c" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.4.0/24"
    availability_zone = "ap-northeast-2c"
    private_dns_hostname_type_on_launch   = "ip-name"

    tags = {
        "Name"                            = "private-c"
        "kubernetes.io/cluster/eksstart"  = "shared"
    }
}

