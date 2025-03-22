provider "google" {
  project = "my-gcp-project"
  region  = "us-central1"
}

# Create a VPC Network
resource "google_compute_network" "vpc_network" {
  name                    = "my-vpc"
  auto_create_subnetworks = false  # Set to false to manually create subnets
}

# Create a Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "my-subnet"
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = "10.1.0.0/16"
  region        = "us-central1"
}

# source : https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network 
