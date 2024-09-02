resource "local_file" "dependency" {
  filename = "dependency.txt"
  content = "Hi"
}

resource "random_string" "name" {
  length = 7
}