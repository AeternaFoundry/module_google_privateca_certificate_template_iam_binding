resource "google_privateca_certificate_template_iam_binding" "privateca_certificate_template_iam_bindings" {
  for_each = var.privateca_certificate_template_iam_bindings

  certificate_template = each.value.certificate_template
  members              = each.value.members
  role                 = each.value.role
  location             = each.value.location
  project              = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

