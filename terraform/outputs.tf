output "front_ip" {
  value       = module.aws-ec2.front_ip
  description = "IP of the front EC2 server."
}
