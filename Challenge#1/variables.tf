variable "project_id" {
  description = "The ID of the GCP project"
}

variable "region" {
  description = "The region to deploy the resources in"
}

variable "zone" {
  description = "The region to deploy the resources in"
}


variable "network_name" {
  description = "The name of the VPC network"
}

variable "subnet_cidr_web" {
  description = "The CIDR block for the web subnet"
}

variable "subnet_cidr_app" {
  description = "The CIDR block for the app subnet"
}

variable "subnet_cidr_db" {
  description = "The CIDR block for the database subnet"
}

variable "web_instance_count" {
  description = "The number of instances in the web instance group"
  default     = 2
}

variable "web_machine_type" {
  description = "The machine type for the web instances"
  default     = "f1-micro"
}

variable "app_machine_type" {
  description = "The machine type for the app instance"
  default     = "f1-micro"
}

variable "db_tier" {
  description = "The machine type for the database instance"
  default     = "db-f1-micro"
}

variable "app_startup_script" {
  description = "The startup script for the app instance"
}

variable "app_bucket_name" {
  description = "The name of the Cloud Storage bucket for the app"
}

variable "app_dns_zone_name" {
  description = "The name of the DNS zone for the app"
}

variable "app_dns_name" {
  description = "The domain name for the app"
}

variable "http_health_check_name" {
  description = "The name of the HTTP health check for the web tier"
  default     = "http-health-check"
}
