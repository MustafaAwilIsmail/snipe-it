#######################################
# Global
#######################################
variable "environment" {
  description = "Environment name (e.g. dev, staging, prod)"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}

#######################################
# VPC
#######################################
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

#######################################
# ACM / Domain
#######################################
variable "domain_name" {
  description = "Root domain name for ACM and Cloudflare"
  type        = string
}

#######################################
# IAM
#######################################
variable "iam_name" {
  description = "Base name for IAM roles"
  type        = string
}

#######################################
# ECR
#######################################
variable "ecr_repository_name" {
  description = "ECR repository name"
  type        = string
}

variable "ecr_enable_lifecycle_policy" {
  description = "Enable ECR lifecycle policy"
  type        = bool
  default     = true
}

variable "ecr_keep_last_images" {
  description = "Number of images to keep in ECR"
  type        = number
  default     = 10
}

variable "ecr_scan_on_push" {
  description = "Enable ECR image scanning on push"
  type        = bool
  default     = true
}

#######################################
# RDS
#######################################
variable "db_identifier" {
  description = "RDS instance identifier"
  type        = string
}

variable "db_engine" {
  description = "Database engine (e.g. mysql, postgres)"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "Version of the RDS database engine"
  type        = string
  default     = "8.0"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_username" {
  description = "Database admin username"
  type        = string
}

variable "db_password" {
  description = "Database admin password"
  type        = string
  sensitive   = true
}

variable "db_port" {
  description = "Database port"
  type        = number
  default     = 3306
}

variable "db_allocated_storage" {
  description = "Initial storage size in GB"
  type        = number
  default     = 20
}

variable "db_max_allocated_storage" {
  description = "Maximum allocated storage in GB"
  type        = number
  default     = 100
}

variable "db_storage_type" {
  description = "Type of RDS storage (gp3, gp2, io1, etc.)"
  type        = string
  default     = "gp3"
}

variable "db_storage_encrypted" {
  description = "Enable encryption for RDS storage"
  type        = bool
  default     = true
}

variable "db_multi_az" {
  description = "Enable Multi-AZ deployment"
  type        = bool
  default     = false
}

variable "db_backup_retention" {
  description = "Backup retention period in days"
  type        = number
  default     = 7
}

variable "db_deletion_protection" {
  description = "Enable deletion protection for RDS"
  type        = bool
  default     = true
}

#######################################
# Cloudflare
#######################################
variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

#######################################
# ECS
#######################################
variable "container_image" {
  description = "Optional container image override (ECR image used if omitted)"
  type        = string
  default     = ""
}

#######################################
# S3 / Logs / Backend
#######################################
variable "retention_days" {
  description = "Retention days for S3 backend or logs"
  type        = number
  default     = 30
}
