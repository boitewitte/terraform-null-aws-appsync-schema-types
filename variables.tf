variable "name" {
  type = string
  description = "Name"
}

variable "fields" {
  type = map(
    object({
      type = string,
      required = bool,
      default = string,
      arguments = map(object({
        type = string,
        required = bool,
        default = string
      }))
    })
  )
}

variable "type" {
  type = string
  description = "The type: type, interface, input"
  default = "type"
}

variable "implements" {
  type = string
  description = "Name of the interface to be implemented"
  default = null
}
