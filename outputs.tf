output "machine_type" { value=google_compute_instance.default.*.machine_type}
output "name" {
  value = google_compute_instance.default.*.name
}
output "zone" {
  value= google_compute_instance.default.*.zone
}
output "pub_ip" {
  value = google_compute_instance.default.*.network_interface.0.access_config[0]
}
output "instance_id" {
  value = join(",",google_compute_instance.default.*.id)  
}