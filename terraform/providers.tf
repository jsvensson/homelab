locals {
  # Location of the kubeconfig file
  kubeconfig = "~/.kube/config"
}

terraform {
  required_version = ">= 1.6.2"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.27.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
  }

}

provider "kubernetes" {
  config_path    = local.kubeconfig
  config_context = "mirage"
}

provider "helm" {
  kubernetes {
    config_path = local.kubeconfig
  }
}
