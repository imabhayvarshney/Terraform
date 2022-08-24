module "image" {
  source   = "./image"
  for_each = local.deployment
  image_in = each.value.image
}


/*module "influxdb_image" {
  source   = "./image"
  image_in = var.image["influxdb"][terraform.workspace]
}*/


module "container" {
  source   = "./container"
  count_in = each.value.container_count
  for_each = local.deployment
  #name_in           = join("-", [each.key , terraform.workspace, random_string.random[each.key].result])
  name_in     = each.key
  image_in    = module.image[each.key].image_out
  int_port_in = each.value.int
  ext_port_in = each.value.ext
  #container_path_in = each.value.container_path
  #host_path_in = "${path.cwd}/noderedvol"
  volumes_in = each.value.volumes

}



#output "IP-Address2"{
#   value = join(":",[docker_container.nodered_container[1].ip_address,docker_container.nodered_container[1].ports[0].external])
#   description = "The IP Address & external port of the container"
#}