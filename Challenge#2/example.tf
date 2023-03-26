# This command retrieves metadata about a Google Compute Engine instance using the gcloud command-line tool, curl, and the jq command-line tool, and saves the resulting JSON output to a file named "instance_metadata.json".

resource "null_resource" "instance_metadata" {
  provisioner "local-exec" {
    command = "gcloud compute ssh --zone=${var.zone} ${google_compute_instance.instance.name} --command='curl \"http://metadata.google.internal/computeMetadata/v1/instance/?recursive=true\" -H \"Metadata-Flavor: Google\"' | jq . > instance_metadata.json"
  }
}
