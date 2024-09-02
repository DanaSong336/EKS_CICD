output "jenkins_public_ip" {
  value       = aws_instance.jenkins.public_ip
  description = "The public IP address of the Jenkins EC2 instance"
}

output "cluster_id" {
  value = aws_eks_cluster.example.id
}

output "cluster_endpoint" {
  value = aws_eks_cluster.example.endpoint
}

output "cluster_certificate_authority" {
  value = aws_eks_cluster.example.certificate_authority.0.data
}
