variable "environment" {
  description = "Environment name (e.g. dev, staging, prod)"
  type        = string
}

variable "tags" {
  description = "Additional tags for the RDS resources"
  type        = map(string)
  default     = {}
}

variable "db_identifier" {
  description = "The RDS instance identifier"
  type        = string
}

variable "engine" {
  description = "The database engine to use (e.g., mysql, postgres, mariadb)"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Version of the database engine"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "Instance type for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Initial database name"
  type        = string
}

variable "username" {
  description = "Master username for the database"
  type        = string
}

variable "password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "port" {
  description = "Port the DB listens on"
  type        = number
  default     = 3306
}

variable "allocated_storage" {
  description = "The amount of storage (in GB)"
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Max storage (in GB) for autoscaling"
  type        = number
  default     = 100
}

variable "storage_type" {
  description = "The storage type (gp3, gp2, io1)"
  type        = string
  default     = "gp3"
}

variable "storage_encrypted" {
  description = "Whether to enable storage encryption"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "Optional KMS key for encryption"
  type        = string
  default     = null
}

variable "publicly_accessible" {
  description = "Whether the DB instance is publicly accessible"
  type        = bool
  default     = false
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
  default     = []
}

variable "db_subnet_group_name" {
  description = "Existing DB subnet group name"
  type        = string
  default     = null
}

variable "create_db_subnet_group" {
  description = "Whether to create a new DB subnet group"
  type        = bool
  default     = false
}

variable "subnet_ids" {
  description = "List of subnet IDs for new subnet group"
  type        = list(string)
  default     = []
}

variable "availability_zone" {
  description = "Optional AZ to launch in"
  type        = string
  default     = null
}

variable "backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "Preferred backup window"
  type        = string
  default     = "03:00-04:00"
}

variable "maintenance_window" {
  description = "Preferred maintenance window"
  type        = string
  default     = "Mon:05:00-Mon:06:00"
}

variable "auto_minor_version_upgrade" {
  description = "Enable auto minor version upgrade"
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Prevent accidental deletion"
  type        = bool
  default     = true
}

variable "skip_final_snapshot" {
  description = "Skip snapshot before deletion"
  type        = bool
  default     = false
}

variable "multi_az" {
  description = "Whether to deploy a Multi-AZ instance"
  type        = bool
  default     = false
}

variable "create_parameter_group" {
  description = "Whether to create a custom parameter group"
  type        = bool
  default     = false
}

variable "parameter_group_name" {
  description = "Existing parameter group name (if not created)"
  type        = string
  default     = null
}

variable "parameter_group_family" {
  description = "DB parameter group family (e.g. mysql8.0)"
  type        = string
  default     = "mysql8.0"
}

variable "parameters" {
  description = "List of DB parameters (name/value)"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}
