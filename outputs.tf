output "master_server_public_ip" {
  value = aws_instance.master.public_ip
}
output "replica_server_public_ip" {
  value = aws_instance.replica.public_ip
}
output "master_server_private_ip" {
  value = aws_instance.master.private_ip
}
output "replica_server_private_ip" {
  value = aws_instance.replica.private_ip
}