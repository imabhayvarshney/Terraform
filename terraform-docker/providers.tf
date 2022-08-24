terraform {
  required_providers {
    docker = {
      #source = "terraform-providers/docker"
      source = "kreuzwerker/docker"
      #version = "~> 2.0"
    }
  }
}

provider "docker" {}

