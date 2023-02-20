resource "google_compute_instance" "default"{
    depends_on = [
      google_compute_subnetwork.subnet-instance
    ]
    count = length(var.inst_count)
    name= var.environment=="development" ? "mymachine-dev-${count.index+1}" : "mymachine-prod-${count.index+1}" 
    machine_type=var.machine[var.zone]
    zone=var.zone

    boot_disk{
        initialize_params {
          image=var.img
        }
    }
    
    allow_stopping_for_update = true
    desired_status = "RUNNING"
    network_interface {
      network=google_compute_network.vpc_network.id
      subnetwork = google_compute_subnetwork.subnet-instance.id
      
      access_config {

      }
    }
    metadata_startup_script = "sudo apt install apache2 -y"

    tags = ["http-server"]
}

resource "google_compute_disk" "test" {
  name="test-disk"
  type="pd-ssd"
  zone="us-central1-a"
  size="10"
}

resource "google_compute_attached_disk" "tattach" {
  depends_on = [
    google_compute_instance.default
  ]
  disk=google_compute_disk.test.id
  instance = "mymachine-prod-1"
  zone="us-central1-a"
}