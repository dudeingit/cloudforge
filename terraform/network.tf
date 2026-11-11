resource "docker_network" "cloudforge" {
  name   = "cloudforge-network"
  driver = "bridge"

  labels {
    label = "project"
    value = "cloudforge"
  }

  labels {
    label = "environment"
    value = "dev"
  }
}
