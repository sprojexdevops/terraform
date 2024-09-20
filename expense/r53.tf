resource "aws_route53_record" "expense" {
  count           = length(var.instance_name)
  zone_id         = var.zone_id
  name            = "${var.instance_name[count.index]}.${var.domain_name}"
  type            = "A"
  ttl             = 10
  records         = [aws_instance.expense[count.index].private_ip]
  allow_overwrite = true
}