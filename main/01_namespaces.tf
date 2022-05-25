provider "kubernetes" {
	config_path = "${local_file.kubeconfig.filename}"
}

resource "kubernetes_namespace" "devops" {
	metadata {
		name = "devops"
	}
}
