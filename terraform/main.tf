
resource "null_resource" "remove_sc" {
  provisioner "local-exec" {
    command = "kubectl get sc -o yaml > ~/sc.yaml && kubectl delete -f ~/sc.yaml"
  }
}

resource "helm_release" "longhorn_release" {
  name       = "longhorn"
  repository = "https://charts.longhorn.io"
  chart      = "longhorn"
  version    = "1.3.1"
  namespace  = "longhorn-system"
  create_namespace = true

  values = [
    "${file("../kubernetes/longhorn/values.yaml")}"
  ]
  depends_on = [null_resource.remove_sc]
}