terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {
  # Configuration options
}

# Download the latest Ghost Image
resource "docker_image" "image_id" {
  name = "ghost:latest"
}

# Start the Container
resource "docker_container" "container_id" {
  name  = "test-container"
  image = docker_image.image_id.id
  ports {
    internal = "2368"
    external = "80"
  }
}