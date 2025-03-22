# Firewall rule to allow SSH (port 22)
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]  # Allows SSH access from anywhere (Restrict in production)
}

# Firewall rule to allow HTTP (port 80)
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]  # Allows HTTP access from anywhere
}

#source : https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
