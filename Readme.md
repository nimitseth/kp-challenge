KPMG Code Challenges

README.md for explaining my approach and possible solution for given challenges.

Challenge#1

A VPC network is created using the google_compute_network resource, with the name specified in the var.network_name variable. The auto_create_subnetworks parameter is set to false, which means that no subnetworks will be created automatically.

Three subnetworks are created using the google_compute_subnetwork resource. The first subnet is named web-subnet and is assigned the ip_cidr_range specified in the var.subnet_cidr_web variable. The network parameter is set to the ID of the VPC network created in the previous step.

The second subnet is named app-subnet and is assigned the ip_cidr_range specified in the var.subnet_cidr_app variable. The network parameter is again set to the ID of the VPC network created in the first step. This subnet also has a secondary IP range specified with the secondary_ip_range block.

The third subnet is named db-subnet and is assigned the ip_cidr_range specified in the var.subnet_cidr_db variable. The network parameter is set to the ID of the VPC network created in the first step.

An instance template is created using the google_compute_instance_template resource. This template is used to create instances that will run a web server. The name_prefix parameter specifies a prefix that will be added to the name of each instance created from this template. The machine_type parameter specifies the type of machine that will be used for these instances. The disk parameter specifies the disk that will be used for the instances, with the source_image parameter set to debian-cloud/debian-10. The network_interface parameter specifies that the instances will use the web_subnet subnetwork, and that they will be assigned an external IP address. The metadata_startup_script parameter specifies a startup script that will run when the instances are created.

An instance group manager is created using the google_compute_instance_group_manager resource. This manager is used to manage a group of instances created from the template created in the previous step. The name parameter specifies a name for the group manager. The base_instance_name parameter specifies a prefix that will be added to the name of each instance created by the manager. The zone parameter specifies the zone in which the instances will be created. The target_size parameter specifies the number of instances that should be running in the group. The version parameter specifies the version of the instance template that should be used.

A health check is created using the google_compute_health_check resource. This health check is used to check the health of the instances in the instance group created in the previous step. The name parameter specifies a name for the health check. The check_interval_sec parameter specifies the interval at which the health check should be performed. The timeout_sec parameter specifies the timeout for the health check. The http_health_check block specifies the port and request path that should be used for the health check.

A backend service is created using the google_compute_backend_service resource. This backend service is used to distribute traffic to the instances in the instance group created in step 6. The name parameter specifies a name for the backend service. The backend parameter specifies the instance group that should be used as the backend. The health_checks parameter specifies the health check that should be used for the backend service. The protocol parameter

Challenge#2

Challenge#3
