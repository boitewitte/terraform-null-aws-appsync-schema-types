terraform {
  required_version = ">= 0.12"
}

locals {
  replace_empty_value = "@_-@^&@%@#"

  fields = {
    for name, field in var.fields :
      name => {
        arguments = (
          field.arguments != null
            ? join(", ",
                [
                      for arg_name, arg_type in field.arguments:
                        "${arg_name}: ${templatefile("${path.module}/template/field.tmpl", arg_type)}"
                ]
              )
            : local.replace_empty_value
        ),
        rendered = templatefile("${path.module}/template/field.tmpl", field)
      }
  }

  rendered_fields = [
    for name, field in local.fields:
      {
        name = "${name}${ field.arguments != local.replace_empty_value ? "(${field.arguments})" : ""}",
        arguments = field.arguments,
        type = field.rendered
      }
  ]

  rendered = templatefile("${path.module}/template/type.tmpl", { name = var.name, type = var.type, fields = local.rendered_fields })
}

resource "null_resource" "changes" {
  triggers = {
    rendered = local.rendered
  }
}
