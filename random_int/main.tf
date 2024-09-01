resource "random_integer" "random_int_generator" {
    min= 5
    max= 100
}

output "print_result" {
    value = random_integer.random_int_generator.result
    
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer

resource "random_shuffle" "zones" {
  input        = ["us-west-1a", "us-west-1c", "us-west-1d", "us-west-1e"]
  result_count = 2
}
output "print_zones" {
    value = random_shuffle.zones.result
  
}



