terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "google" {
  credentials = file("key.json")
  project     = "project-akintade"
  region      = "us-central1"
}
