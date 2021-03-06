resource "aws_route53_zone" "r53-private" {
  name          = var.private_domain_name
  comment       = "VPC Private DNS for ${var.private_domain_name}"
  force_destroy = true

  vpc {
    vpc_id = data.aws_vpc.vpc-id.id
  }

  tags = {
    Name = var.private_domain_name
  }
}

# 참조
#resource "aws_route53_zone_association" "r53-private" {
#  zone_id = aws_route53_zone.r53-private-awx.id
#  vpc_id  = aws_vpc.vpc-awx.id
#}
