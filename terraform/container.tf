resource "docker_image" "cloudforge" {
  name         = "cloudforge-app:v1"
  keep_locally = true
}

resource "docker_container" "cloudforge_app" {
  name  = "cloudforge-app"
  image = docker_image.cloudforge.image_id

  ports {
    internal = 5000
    external = 8080
  }

  networks_advanced {
    name = docker_network.cloudforge.name
  }

  restart = "unless-stopped"

  healthcheck {
    test     = ["CMD", "python", "-c", "import urllib.request; urllib.request.urlopen('http://localhost:5000/health')"]
    interval = "30s"
    timeout  = "5s"
    retries  = 3
  }

  env = [
    "APP_VERSION=v1"
  ]

  labels {
    label = "project"
    value = "cloudforge"
  }
}
