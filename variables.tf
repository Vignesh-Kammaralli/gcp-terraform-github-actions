variable "region" {default="us-central1"}
variable "zone" {default="us-central1-a"}
variable "path" {default="new-proj-1234-372204-e588168221e5.json"}
variable "machine" {
    type=map
    default={
    "us-central1-a"="e2-micro"
    "us-east1-b"="e2-medium"
    }
}
variable "img" {default="ubuntu-os-cloud/ubuntu-1804-lts"}
variable "inst_count" {default=["myserver-1","myserver-2"]}
variable "environment" {
  default="production"
}

variable "tier" { default = "db-f1-micro" }
variable "name" { default = "testdb" }
variable "db_region" { default = "us-central1" }
variable "disk_size" { default = "20" }
variable "database_version" { default = "MYSQL_5_7" }
variable "user_host" { default = "%" }
variable "user_name" { default = "admin" }
variable "user_password" { default = "123456" }
variable "replication_type"  { default = "SYNCHRONOUS" }
variable "activation_policy" { default = "always" }