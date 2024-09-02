data "local_file" "name1" {
  filename = "source.txt"
}

output "name3" {
    value = data.local_file.name1.content
}

resource "local_file" "hello_world" {
  filename = "destination.txt"
  content = data.local_file.name1.content
}