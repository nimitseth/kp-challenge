# Create the VPC network and subnetworks
resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "web_subnet" {
  name          = "web-subnet"
  ip_cidr_range = var.subnet_cidr_web
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "app_subnet" {
  name          = "app-subnet"
  ip_cidr_range = var.subnet_cidr_app
  network       = google_compute_network.vpc_network.id
  secondary_ip_range {
    range_name = "pods"
    ip_cidr_range = "10.128.0.0/16"
}
}

resource "google_compute_subnetwork" "db_subnet" {
name = "db-subnet"
ip_cidr_range = var.subnet_cidr_db
network = google_compute_network.vpc_network.id
}