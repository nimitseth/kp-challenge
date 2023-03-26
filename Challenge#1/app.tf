# Create the Compute Engine instance for the app tier
resource "google_compute_instance" "app_instance" {
name = "app-instance"
machine_type = var.app_machine_type
tags = ["http-server", "https-server"]

boot_disk {
initialize_params {
image = "debian-cloud/debian-10"
}
}

network_interface {
subnetwork = google_compute_subnetwork.web_subnet.id
}

metadata_startup_script = "#!/bin/bash\necho 'Hello, World!' > /var/www/html/index.html\nsudo apt-get update\nsudo apt-get -y install apache2\nsudo apt-get -y install php7.0\nsudo apt-get -y install php7.0-mysql"

lifecycle {
ignore_changes = [metadata_startup_script]
}

depends_on = [google_compute_subnetwork.web_subnet, google_sql_database_instance.db_instance]
}