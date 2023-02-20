resource "google_compute_network" "vpc_network" {
  name                    = "new-networks"
  auto_create_subnetworks = false
  
}

resource "google_compute_subnetwork" "subnet-instance" {
  name          = "new-subnet"
  ip_cidr_range = "172.29.34.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.id
  
}

resource "google_compute_firewall" "allow_http" {
  name="allow-http-new"
  network=google_compute_network.vpc_network.name
  allow{
    protocol = "tcp"
    ports = ["80"]
  }
 
  source_ranges = [ "0.0.0.0/0" ]
}
resource "google_compute_firewall" "allow_ssh" {
  name="allow-ssh-new"
  network=google_compute_network.vpc_network.name
  allow{
    protocol = "tcp"
    ports = ["22"]
  }

  source_ranges = [ "0.0.0.0/0" ]
}