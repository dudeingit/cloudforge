output "network_name" {
  value = docker_network.cloudforge.name
}

output "container_name" {
  value = docker_container.cloudforge_app.name
}

output "application_url" {
  value = "http://localhost:8080"
}
