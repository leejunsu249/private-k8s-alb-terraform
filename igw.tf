resource "aws_internet_gateway" "eks-igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "eks-tf-igw"
    }
}