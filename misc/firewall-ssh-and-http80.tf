# Firewall rule to allow SSH (port 22) - Ingress
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.name
  direction = "INGRESS"  # Incoming traffic

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]  # Allows SSH access from anywhere (Restrict in production)
  target_tags   = ["ssh-access"] # Only instances with this tag can use this rule
}

# Firewall rule to allow HTTP (port 80) - Ingress
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.vpc_network.name
  direction = "INGRESS"  # Incoming traffic

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]  # Allows HTTP access from anywhere
  target_tags   = ["http-server"] # Only instances with this tag can use this rule
}

/* 
Firewall Rule	 Port	  Direction	  Target Tags	  Purpose
allow-ssh	     22	    INGRESS	    ssh-access	  Allows SSH access to tagged instances
allow-http     80	    INGRESS	    http-server	  Allows HTTP traffic to tagged instances

*/

#source : https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
