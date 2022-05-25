resource "kubernetes_deployment" "ms-devops" {
  metadata {
    name = "ms-devops"
	namespace = "devops"
    labels = {
      	app = "ms-devops"
	tier = "devops"	  
    }
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
		app = "ms-devops"
		tier = "devops"
      }
    }
    template {
      metadata {
        labels = {
		app = "ms-devops"
		tier = "devops"
        }
      }
      spec {
	restart_policy = "Always"
        container {
          image = "josezumba/devops"
	  image_pull_policy = "Always"
          name  = "ms-devops"
          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
	  port {
		container_port = 8080
		name = "ms-devops-port"
       	     	protocol = "TCP"
	  }		  
          
        }
      }
    }
  }
}

resource "kubernetes_service" "ms-devops" {
	metadata {
		name = "ms-devops"
		namespace = "devops"
		labels = {
			app     = "ms-devops"
			tier    = "devops"
		}
	}
	spec {
		selector = {
		app = "ms-devops"
		tier = "devops"
        	}
		port {
			port = 8080
			name = "ms-sc-port"
			target_port = 8080
		}
	}
}
