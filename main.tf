provider "google" {
#   version = "= 3.55.0"
  credentials = var.sa_key
  project = "parabolic-base-409505"
}
 
variable "sa_key" {
  default =  ""
}

resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = "europe-west3"
  initial_node_count       = 1
 # enable_autopilot   = true
  networking_mode = "ROUTES"

    monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS"]
    managed_prometheus {
      enabled = true
    }
  }

}
