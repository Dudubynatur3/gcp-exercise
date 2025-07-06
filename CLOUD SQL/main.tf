provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_sql_database_instance" "mysql_instance" {
  name             = "bauhaus-mysql-instance"
  database_version = "MYSQL_8_0"
  region           = var.region

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled    = true
      authorized_networks {
        name  = "all"
        value = "0.0.0.0/0"
      }
    }
  }
}

output "instance_connection_name" {
  value = google_sql_database_instance.mysql_instance.connection_name
}
