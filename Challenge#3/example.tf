# Define two JSON objects using jsondecode and a locals block
locals {
  object1 = jsondecode('{"a":{"b":{"c":"d"}}}')
  object2 = jsondecode('{"x":{"y":{"z":"a"}}}')
}

# Output the nested value of object1
output "nested_value1" {
  # Use the element function to access the nested value of object1
  value = element(element(element(local.object1, "a"), "b"), "c")
}

# Output the nested value of object2
output "nested_value2" {
  # Use the element function to access the nested value of object2
  value = element(element(element(local.object2, "x"), "y"), "z")
}
