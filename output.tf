output "change_id" {
  value = null_resource.changes.id
}

output "name" {
  value = var.name
}

output "rendered" {
  value = local.rendered
}
