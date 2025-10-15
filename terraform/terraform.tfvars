environment = "prod"

tags = {
  Project = "snipeit"
  Owner   = "Mustafa"
}

vpc_name                 = "snipeit-vpc"
vpc_cidr                 = "10.0.0.0/16"
azs                      = ["us-east-1a", "us-east-1b"]  # list of availability zones
private_subnet_cidrs     = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnet_cidrs      = ["10.0.101.0/24", "10.0.102.0/24"]

#######################################
# ACM / Domain
#######################################
domain = "nicco.uk"  # your domain name

#######################################
# IAM
#######################################
iam_name = "snipeit-iam"

#######################################
# ECR
#######################################
ecr_repository_name        = "snipeit"
ecr_enable_lifecycle_policy = true
ecr_keep_last_images        = 10
ecr_scan_on_push            = true

#######################################
# RDS
#######################################
db_identifier            = "snipeit-prod-db"
db_name                  = "snipeit"
db_username              = "admin"
db_password              = "SuperSecurePassword123!"
db_port                  = 3306
db_allocated_storage     = 20
db_max_allocated_storage = 100
db_storage_type          = "gp3"
db_storage_encrypted     = true
db_multi_az              = true
db_backup_retention      = 7
db_deletion_protection   = true

#######################################
# Cloudflare
#######################################
cloudflare_zone_id = "88a7a3ebd8e8b9bfaa735dcd0a31c7fa"

#######################################
# ECS
#######################################
container_image = ""  # leave empty to use ECR image

#######################################
# S3 / Logs / Backend
#######################################
retention_days = 30
