resource "kubernetes_service" "ms-devops-lb" {
  metadata {
    name = "ms-devops-lb"
	namespace = "devops"
	labels = {
		app = "ms-devops"
		tier = "devops"
	}
  }
  spec {
    type = "LoadBalancer"
    port {
      port = 80
	  name = "ms-sc-port-lb"
      target_port = 8080
    }
    selector = {
      app = "ms-devops"
	  tier = "devops"
    }
  }
}
