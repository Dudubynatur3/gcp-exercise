provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone_1
}

resource "google_compute_instance" "vm_1" {
  name         = "vm-instance-1"
  machine_type = "e2-micro"
  zone         = var.zone_1

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet_1
    access_config {} # Enables external IP
  }

  metadata_startup_script = file("startup.sh")
}

resource "google_compute_instance" "vm_2" {
  name         = "vm-instance-2"
  machine_type = "e2-micro"
  zone         = var.zone_2

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet_2
    access_config {}
  }

  metadata_startup_script = file("startup.sh")
}
