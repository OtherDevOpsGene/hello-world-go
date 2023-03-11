terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "hello-world-go" {
  name         = "otherdevopsgene/hello-world-go:latest"
  keep_locally = false
}

resource "docker_container" "hello-world-go" {
  image    = docker_image.hello-world-go.image_id
  name     = "hello-world-go"
  must_run = false
  rm       = false
}
