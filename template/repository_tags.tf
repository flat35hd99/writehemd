variable "github_repo_owner" {
  description = "GitHub repository owner"
  default = "flat35hd99"
  type        = string
}

variable "github_repo_name" {
  description = "GitHub repository name"
  default = "writehemd"
  type        = string
}

data "http" "github_tags" {
  url = "https://api.github.com/repos/${var.github_repo_owner}/${var.github_repo_name}/tags"
}

locals {
  github_tags = jsondecode(data.http.github_tags.body)
}
