provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_network" "custom_vpc" {
  name                    = "bauhaus-custom-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_1" {
  name          = "subnet-1"
  ip_cidr_range = "10.10.0.0/24"
  region        = var.region
  network       = google_compute_network.custom_vpc.id
}

resource "google_compute_subnetwork" "subnet_2" {
  name          = "subnet-2"
  ip_cidr_range = "10.20.0.0/24"
  region        = var.secondary_region
  network       = google_compute_network.custom_vpc.id
}

resource "google_compute_firewall" "allow-http-https" {
  name    = "allow-http-https"
  network = google_compute_network.custom_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.custom_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
}
