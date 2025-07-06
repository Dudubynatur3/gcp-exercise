variable "project_id" {
  description = "project-akintade"
  type        = string
}

variable "region" {
  description = "The primary region for subnet 1"
  type        = string
  default     = "us-central1"
}

variable "secondary_region" {
  description = "The secondary region for subnet 2"
  type        = string
  default     = "europe-west1"
}
