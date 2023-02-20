
# resource "google_sql_database_instance" "gcp_database" {
#     name = var.name
#     region = var.db_region
#     database_version = var.database_version
#     deletion_protection = false
#     settings {
#         tier = var.tier
#         disk_size = var.disk_size
#         activation_policy = var.activation_policy
#         ip_configuration {

#       dynamic "authorized_networks" {
#         for_each = google_compute_instance.default
#         iterator = default

#         content {
#           name  = default.value.name
#           value = default.value.network_interface.0.access_config.0.nat_ip
#         }
#       }
#     }
    
#     }
# }


# resource "google_sql_user" "admin" {
#     count = 1 
#     name = var.user_name
#     host = var.user_host
#     password = var.user_password
#     instance = google_sql_database_instance.gcp_database.name
# }