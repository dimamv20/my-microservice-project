resource "helm_release" "jenkins" {
  name       = "jenkins"
  namespace  = "jenkins"
  create_namespace = true
  
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version = "5.9.18"

  values = [file("${path.module}/values.yaml")]
  timeout = 600
  wait = false
}