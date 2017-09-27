provider "scaleway" {
  region = "${var.region}"
}

// Rancher bootscripts works better than the Docker bootscript.
data "scaleway_bootscript" "rancher" {
  architecture = "x86_64"
  name = "x86_64 mainline 4.9.49 rev1"
}

data "scaleway_image" "xenial" {
  architecture = "x86_64"
  name         = "Ubuntu Xenial"
}

data "template_file" "docker_conf" {
  template = "${file("conf/docker.tpl")}"

  vars {
    ip = "${var.docker_api_ip}"
  }
}