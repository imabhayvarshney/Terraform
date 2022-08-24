/*
output "container-name" {
  value       = module.container[*].container-name
  description = "The Name of the container"
}

output "ip-address" {
  #value = join(":",flatten( [docker_container.nodered_container[*].ip_address,docker_container.nodered_container[*].ports[0].external]))
  value       = flatten(module.container[*].ip-address)
  description = "The IP Address & external port of the container"
}

*/

output "application_access" {
  value       = [for x in module.container[*] : x]
  description = "The name and socket for each application."
}