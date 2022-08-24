/*
output "container-name"{
    value = docker_container.nodered_container.name
    description = "The Name of the container"
}
output "ip-address"{
    #value = join(":",flatten( [docker_container.nodered_container[*].ip_address,docker_container.nodered_container[*].ports[0].external]))
    value = [for i in docker_container.nodered_container[*]: join(":", [i.ip_address],i.ports[*]["external"])]
    description = "The IP Address & external port of the container"
}

*/

output "application_access" {
  value = { for x in docker_container.app_container[*] : x.name => join(":", [x.ip_address], x.ports[*]["external"]) }
}