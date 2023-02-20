terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "vignesh-ks-org"

    workspaces {
      name = "gcpterra"
    }
  }
}



provider "google" {
    project="new-proj-1234-372204"
    region ="us-central1-a"
    //credentials=file(var.path)
}