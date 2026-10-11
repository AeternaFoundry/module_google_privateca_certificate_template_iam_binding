variable "privateca_certificate_template_iam_bindings" {
  description = <<EOT
Map of privateca_certificate_template_iam_bindings, attributes below
Required:
    - certificate_template
    - members
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    certificate_template = string
    members              = set(string)
    role                 = string
    location             = optional(string)
    project              = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

