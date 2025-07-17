resource "google_container_cluster" "primary" {
  name     = "standard-cluster"
  location = "us-central1-a"

  initial_node_count = 1  

  node_config {
    machine_type = "e2-small"  
    disk_size_gb = 20          
    disk_type    = "pd-standard"  
  }
}