variable "project_id" {
  description = "project-akintade"
  type        = string
}

variable "region" {
  description = "Default region"
  type        = string
}

variable "zone_1" {
  description = "Zone for VM 1"
  type        = string
  default     = "us-central1-a"
}

variable "zone_2" {
  description = "Zone for VM 2"
  type        = string
  default     = "europe-west1-b"
}

variable "vpc_name" {
  description = "bauhaus-custom-vpc"
  type        = string
}

variable "subnet_1" {
  description = "subnet-1"
  type        = string
}

variable "subnet_2" {
  description = "subnet-2"
  type        = string
}
