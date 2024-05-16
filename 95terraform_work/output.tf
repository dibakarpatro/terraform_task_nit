output "public_ip" {
    value = aws_instance.ec2.public_ip
}
output "private_ip" {
  value = aws_instance.ec2.private_ip
  sensitive = true
}
output "cpu_core_count" {
  value = aws_instance.ec2.cpu_core_count
}
output "availability_zone" {
  value = aws_instance.ec2.availability_zone
}
output "resource" {
  value = aws_instance.ec2.host_id
}
output "iuui" {
  value = aws_s3_bucket.s3_bucket.bucket
}