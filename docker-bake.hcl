target "docker-metadata-action" {}

group "default" {
  targets = ["image-local"]
}

target "image" {
  inherits = ["docker-metadata-action"]
}

target "image-local" {
  inherits = ["image"]
  output = ["type=docker"]
}

target "amd64" {
  inherits = ["image"]
  dockerfile = "Dockerfile"
  platforms = [
    "linux/amd64"
  ]
}

target "arm64v8" {
  inherits = ["image"]
  dockerfile = "Dockerfile.aarch64"
  platforms = [
    "linux/arm64"
  ]
}

target "arm32v7" {
  inherits = ["image"]
  dockerfile = "Dockerfile.armhf"
  platforms = [
    "linux/arm/v7"
  ]
}

target "64" {
  inherits = ["image"]
  platforms = [
    "linux/amd64",
    "linux/arm64"
  ]
}

target "arm" {
  inherits = ["image"]
  platforms = [
    "linux/arm64",
    "linux/arm/v7"
  ]
}

target "all" {
  inherits = ["image"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
    "linux/arm/v7"
  ]
}
