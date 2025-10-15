module "vpc" {
  source = "./modules/vpc"

  name                 = var.vpc_name
  cidr                 = var.vpc_cidr
  azs                  = var.azs
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
}

module "acm" {
  source = "./modules/acm"
  domain = var.domain_name
}

module "alb" {
  source             = "./modules/alb"
  vpc_id             = module.vpc.vpc_id
  public_subnets     = module.vpc.public_subnets
  certificate_arn    = module.acm.certificate_arn
}

module "iam" {
  source = "./modules/iam"
  name   = var.iam_name
}

module "ecr" {
  source = "./modules/ecr"

  repository_name         = var.ecr_repository_name
  enable_lifecycle_policy = var.ecr_enable_lifecycle_policy
  keep_last_images        = var.ecr_keep_last_images
  scan_on_push            = var.ecr_scan_on_push
  tags                    = var.tags
}

module "rds" {
  source = "./modules/rds"

  environment            = var.environment
  db_identifier          = var.db_identifier
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  port                   = var.db_port
  allocated_storage      = var.db_allocated_storage
  max_allocated_storage  = var.db_max_allocated_storage
  storage_type           = var.db_storage_type
  storage_encrypted      = var.db_storage_encrypted
  publicly_accessible    = false
  multi_az               = var.db_multi_az
  backup_retention_period = var.db_backup_retention
  deletion_protection    = var.db_deletion_protection
  vpc_security_group_ids = [module.alb.security_group_id]
  db_subnet_group_name   = null
  create_db_subnet_group = true
  subnet_ids             = module.vpc.private_subnets
  tags                   = var.tags
}

module "ecs" {
  source                = "./modules/ecs"
  vpc_id                = module.vpc.vpc_id
  private_subnet_ids    = module.vpc.private_subnets
  alb_target_group_arn  = module.alb.target_group_arn
  alb_security_group_id = module.alb.security_group_id
  container_image       = "${module.ecr.repository_url}:latest"
  execution_role_arn    = module.iam.execution_role_arn
  task_role_arn         = module.iam.task_role_arn

  depends_on = [module.alb, module.ecr, module.rds]
}

module "cloudflare" {
  source = "./modules/cloudflare"

  zone_id = var.cloudflare_zone_id
  domain  = var.domain_name
  alb_dns = module.alb.dns_name

  validation_records = {
    for dvo in module.acm.domain_validation_options : dvo.domain_name => {
      name  = dvo.resource_record_name
      type  = dvo.resource_record_type
      value = dvo.resource_record_value
    }
  }
}

module "acm_validation" {
  source = "./modules/acm_validation"

  certificate_arn         = module.acm.certificate_arn
  validation_record_fqdns = module.cloudflare_dns.validation_fqdns
}

module "s3" {
  source         = "./modules/s3"
  retention_days = var.retention_days
}
