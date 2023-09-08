resource "aws_vpc" "test_vpc" {
  cidr_block  = "192.168.0.0/16"
  enable_dns_hostnames = true # ec2에 dns 주소 부여
  enable_dns_support = true
  instance_tenancy = "default"

  tags = {
    Name = "test-vpc"
  }
}

data "aws_availability_zones" "available" {
  state = "available" # 리전의 가용영역 중 사용 가능한 영역의 정보를 가져온다
}

resource "aws_subnet" "test-pub_2a" { # resource type # resource name
  vpc_id = aws_vpc.test_vpc.id
  cidr_block = "192.168.0.0/20"
  map_public_ip_on_launch = true # 퍼블릭 IP 할당 여부
  availability_zone = data.aws_availability_zones.available.names[0] # 가용 영역의 이름을 가져온다(ap-northeast-2a)
  tags = {
    Name = "test-pub-2a"
  }
}

resource "aws_subnet" "test-pub_2b" {
  vpc_id = aws_vpc.test_vpc.id
  cidr_block = "192.168.16.0/20"
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "test-pub-2b"
  }
}

resource "aws_subnet" "test-pub_2c" {
  vpc_id = aws_vpc.test_vpc.id
  cidr_block = "192.168.32.0/20"
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[2]
  tags = {
    Name = "test-pub-2c"
  }
}

resource "aws_subnet" "test-pub_2d" {
  vpc_id = aws_vpc.test_vpc.id
  cidr_block = "192.168.48.0/20"
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[3] 
  tags = {
    Name = "test-pub-2d"
  }
}

resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.test_vpc.id
  tags = {
    Name = "test-igw"
  }
}

resource "aws_subnet" "test-pvt_2a" {
  vpc_id = aws_vpc.test_vpc.id
  cidr_block = "192.168.64.0/20"
  map_public_ip_on_launch = false
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "test-pvt-2a"
  }
}

resource "aws_subnet" "test-pvt_2b" {
  vpc_id = aws_vpc.test_vpc.id
  cidr_block = "192.168.80.0/20"
  map_public_ip_on_launch = false
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "test-pvt-2b"
  }
}

resource "aws_subnet" "test-pvt_2c" {
  vpc_id = aws_vpc.test_vpc.id
  cidr_block = "192.168.96.0/20"
  map_public_ip_on_launch = false
  availability_zone = data.aws_availability_zones.available.names[2]
  tags = {
    Name = "test-pvt-2c"
  }
}

resource "aws_subnet" "test-pvt_2d" {
  vpc_id = aws_vpc.test_vpc.id
  cidr_block = "192.168.112.0/20"
  map_public_ip_on_launch = false
  availability_zone = data.aws_availability_zones.available.names[3]
  tags = {
    Name = "test-pvt-2d"
  }
}

resource "aws_route_table_association" "test-pub_2a_association" {
  subnet_id = aws_subnet.test-pub_2a.id
  route_table_id = aws_route_table.test_pub_rtb.id
}

resource "aws_route_table_association" "test-pub_2b_association" {
  subnet_id = aws_subnet.test-pub_2b.id
  route_table_id = aws_route_table.test_pub_rtb.id
}

resource "aws_route_table_association" "test-pub_2c_association" {
  subnet_id = aws_subnet.test-pub_2c.id
  route_table_id = aws_route_table.test_pub_rtb.id
}

resource "aws_route_table_association" "test-pub_2d_association" {
  subnet_id = aws_subnet.test-pub_2d.id
  route_table_id = aws_route_table.test_pub_rtb.id
}

resource "aws_route_table_association" "test-pvt_2a_association" {
  subnet_id = aws_subnet.test-pvt_2a.id
  route_table_id = aws_route_table.test_pvt_rtb.id
}

resource "aws_route_table_association" "test-pvt_2b_association" {
  subnet_id = aws_subnet.test-pvt_2b.id
  route_table_id = aws_route_table.test_pvt_rtb.id
}

resource "aws_route_table_association" "test-pvt_2c_association" {
  subnet_id = aws_subnet.test-pvt_2c.id
  route_table_id = aws_route_table.test_pvt_rtb.id
}

resource "aws_route_table_association" "test-pvt_2d_association" {
  subnet_id = aws_subnet.test-pvt_2d.id
  route_table_id = aws_route_table.test_pvt_rtb.id
}
