# Create the Cloud SQL instance and database
resource "google_sql_database_instance" "db_instance" {
name = "my-db-instance"
database_version = "MYSQL_5_7"

settings {
tier = var.db_tier
}

deletion_protection = false

depends_on = [google_compute_network.vpc_network, google_compute_subnetwork.db_subnet]
}

resource "google_sql_database" "db_database" {
name = "my-db"
instance = google_sql_database_instance.db_instance.name

depends_on = [google_sql_database_instance.db_instance]
}

resource "google_sql_user" "db_user" {
name = "my-db-user"
instance = google_sql_database_instance.db_instance.name
password = "my-db-password"

depends_on = [google_sql_database_instance.db_instance]
}