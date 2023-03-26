resource "null_resource" "instance_metadata" {
  provisioner "local-exec" {
    command = "gcloud compute ssh --zone=${var.zone} ${google_compute_instance.instance.name} --command='curl \"http://metadata.google.internal/computeMetadata/v1/instance/?recursive=true\" -H \"Metadata-Flavor: Google\"' | jq . > instance_metadata.json"
  }
}