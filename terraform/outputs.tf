#######################################
# VPC
#######################################
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnets
}

#######################################
# ALB
#######################################
output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.alb.dns_name
}

#######################################
# ECR
#######################################
output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = module.ecr.repository_url
}

output "ecr_repository_arn" {
  description = "ARN of the ECR repository"
  value       = module.ecr.repository_arn
}

#######################################
# RDS
#######################################
output "rds_endpoint" {
  description = "RDS database endpoint"
  value       = module.rds.endpoint
}

output "rds_port" {
  description = "RDS database port"
  value       = module.rds.port
}

output "rds_db_name" {
  description = "RDS database name"
  value       = module.rds.db_name
}

#######################################
# ECS
#######################################
output "ecs_cluster_name" {
  description = "ECS cluster name"
  value       = module.ecs.cluster_name
}

output "ecs_service_name" {
  description = "ECS service name"
  value       = module.ecs.service_name
}

#######################################
# Cloudflare / ACM
#######################################
output "cloudflare_records" {
  description = "Cloudflare DNS validation records"
  value       = module.cloudflare.validation_fqdns
}

output "certificate_arn" {
  description = "ACM certificate ARN"
  value       = module.acm.certificate_arn
}

#######################################
# S3
#######################################
output "s3_bucket_name" {
  description = "S3 bucket used for backend/logs"
  value       = module.s3.bucket_name
}
