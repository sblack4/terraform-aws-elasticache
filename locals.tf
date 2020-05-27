
locals {
  create_ingress_cidr_sg_rule            = length(var.ingress_rule_cidr_blocks) > 0
  create_route_53_cname_record           = var.route53_zone_id != "" ? true : false
  egress_security_group_rule_description = var.egress_security_group_rule_description
  ingress_cidr_sg_rule_description       = var.ingress_cidr_sg_rule_description
  ingress_sg_sg_rule_description         = var.ingress_sg_sg_rule_description
  name                                   = var.name
  replication_group_description          = coalesce(var.replication_group_description, "Replication group for ${local.name}, managed by terraform")
  route53_record_name                    = "${local.name}-CNAME"
  route53_record_entry                   = "${local.name}.${replace(data.aws_route53_zone.selected.name, "/[.]$/", "")}"
  security_group_name                    = "${local.name}-SG"
  subnet_group_name                      = "${local.name}-NET"
  tags                                   = var.tags
}
