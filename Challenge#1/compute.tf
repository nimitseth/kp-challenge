# Create the instances and instance groups
resource "google_compute_instance_template" "web_instance_template" {
name_prefix = "web-instance-template-"

machine_type = var.web_machine_type
tags = ["http-server", "https-server"]

disk {
    source_image = "debian-cloud/debian-10"
    auto_delete  = true
    boot         = true
  }

network_interface {
subnetwork = google_compute_subnetwork.web_subnet.id
access_config {
nat_ip = google_compute_address.load_balancer_ip.address
}
}

metadata_startup_script = "echo 'Hello, World!' > /var/www/html/index.html"

lifecycle {
ignore_changes = [metadata_startup_script]
}
}


resource "google_compute_instance_group_manager" "web_instance_group_manager" {
  name               = "web-instance-group-manager"
  #instance_template =  google_compute_instance_template.web_instance_template.id
  base_instance_name = "web-instance"
  zone               = var.zone
  target_size = var.web_instance_count
  version {
    instance_template  = google_compute_instance_template.web_instance_template.id
  }
}

resource "google_compute_health_check" "http_health_check" {
name = var.http_health_check_name
check_interval_sec = 10
timeout_sec = 5

http_health_check {
port = 80
#request_method = "GET"
request_path = "/"
}
}

resource "google_compute_backend_service" "backend_service" {
name = "backend-service"
backend {
group = google_compute_instance_group_manager.web_instance_group_manager.id
}

health_checks = [google_compute_health_check.http_health_check.id]
protocol = "HTTP"
}

resource "google_compute_url_map" "url_map" {
name = "url-map"
default_service = google_compute_backend_service.backend_service.id
}

resource "google_compute_target_http_proxy" "http_proxy" {
name = "http-proxy"
url_map = google_compute_url_map.url_map.id
#proxy_header = "NONE"
}

resource "google_compute_global_forwarding_rule" "forwarding_rule" {
name = "forwarding-rule"
port_range = "80"
target = google_compute_target_http_proxy.http_proxy.id
}

resource "google_compute_address" "load_balancer_ip" {
name = "load-balancer-ip"
}