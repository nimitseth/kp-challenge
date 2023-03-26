# google_compute_network: This resource creates a VPC network with a specified name.
# google_compute_subnetwork (web_subnet): This resource creates a subnet for the web tier with a specified name and IP address range.
# google_compute_subnetwork (app_subnet): This resource creates a subnet for the application tier with a specified name, IP address range, and secondary IP range for pods.
# google_compute_subnetwork (db_subnet): This resource creates a subnet for the database tier with a specified name and IP address range.
# google_compute_instance_template: This resource creates an instance template for the web tier with a specified machine type, tags, and boot disk. It also defines a network interface that connects the instance to the web subnet and associates it with a startup script.
# google_compute_instance_group_manager: This resource creates an instance group manager for the web tier with a specified name, base instance name, and target size. It also associates it with an instance template.
# google_compute_health_check: This resource creates a health check for the load balancer with a specified name, check interval, and timeout. It also defines an HTTP health check that sends a request to the web server's root directory.
# google_compute_backend_service: This resource creates a backend service for the load balancer with a specified name, instance group, and health check. It also specifies the protocol used for the backend service.
# google_compute_url_map: This resource creates a URL map for the load balancer with a specified name and default backend service.
# google_compute_target_http_proxy: This resource creates an HTTP proxy for the load balancer with a specified name and URL map.
# google_compute_global_forwarding_rule: This resource creates a forwarding rule for the load balancer with a specified name, port range, and target HTTP proxy.
# google_compute_address: This resource creates a static IP address for the load balancer with a specified name.
# google_sql_database_instance: This resource creates a Cloud SQL instance with a specified name and database version. It also specifies the tier for the instance and enables deletion protection.
# google_sql_database: This resource creates a database for the Cloud SQL instance with a specified name and associates it with the Cloud SQL instance.
# google_sql_user: This resource creates a user for the Cloud SQL instance with a specified name and password. It also associates it with the Cloud SQL instance.
# google_compute_instance: This resource creates an instance for the application tier with a specified name, machine type, and boot disk. It also defines a network interface that connects the instance to the web subnet and associates it with a startup script.
# Additionally, there are two output variables defined at the end of the code that output the load balancer IP address and the database connection name.