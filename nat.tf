resource "aws_eip" "test-eastic-ip" {
    network_border_group = "ap-northeast-2"
    public_ipv4_pool = "amazon"
    vpc = true

      tags = {
      Name        = "test-elastic-ip"
    }
  
}

resource "aws_nat_gateway" "test-nat-gateway" {
    depends_on = [
      aws_eip.test-eastic-ip
    ]
    allocation_id = aws_eip.test-eastic-ip.id
    subnet_id = aws_subnet.public-c.id
    connectivity_type = "public"

    tags = {
        Name        =   "test-nat-gateway"
    }
}