output "change_id" {
  value = null_resource.changes.id
}

output "name" {
  value = local.name
}

output "type" {
  value = var.type
}

output "fields" {
  value = var.fields
}

output "rendered" {
  value = local.rendered
}
