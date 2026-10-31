resource "docker_image" "nginx" {
  name  = "nginx:latest"
}

resource "docker_image" "apache" {
  name  = "httpd:latest"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "nginx"
  ports {
    internal = 80
    external = 9000
  }
}

resource "docker_container" "apache" {
  image = docker_image.apache.image_id
  name  = "apache"
  ports {
    internal = 80
    external = 9001
  }
}