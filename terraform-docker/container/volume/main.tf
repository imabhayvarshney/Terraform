resource "docker_volume" "container_volume" {
  #count = var.count_in
  count = var.volume_count
  name  = "${var.volume_name}-${count.index}"
  #name  = "${var.name_in}-${count.index}-volume" 
  #name  = "${var.name_in}-${random_string.random[count.index].result}-volume"
  #name = "${docker_container.nodered_container.name}-volume"

  lifecycle {
    prevent_destroy = false
  }
  provisioner "local-exec" {
    when       = destroy
    command    = "mkdir ${path.cwd}/../backup/"
    on_failure = continue
  }
  provisioner "local-exec" {
    when       = destroy
    command    = "sudo tar -czvf ${path.cwd}/../backup/${self.name}.tar.gz ${self.mountpoint}/"
    on_failure = fail
  }

}