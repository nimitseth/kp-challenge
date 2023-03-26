# Output the load balancer IP address and the database connection name
output "load_balancer_ip" {
value = google_compute_address.load_balancer_ip.address
}

output "db_connection_name" {
value = google_sql_database_instance.db_instance.connection_name
}
