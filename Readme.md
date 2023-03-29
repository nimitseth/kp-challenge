
**KPMG Code Solutions**

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
**Challenge#1** : Three-Tier App 

1. A VPC network is created using the google_compute_network resource, with the name specified in the var.network_name variable. The auto_create_subnetworks parameter is set to false, which means that no subnetworks will be created automatically.

2. Three subnetworks are created using the google_compute_subnetwork resource. The first subnet is named web-subnet and is assigned the ip_cidr_range specified in the var.subnet_cidr_web variable. The network parameter is set to the ID of the VPC network created in the previous step.

3. The second subnet is named app-subnet and is assigned the ip_cidr_range specified in the var.subnet_cidr_app variable. The network parameter is again set to the ID of the VPC network created in the first step. This subnet also has a secondary IP range specified with the secondary_ip_range block.

4. The third subnet is named db-subnet and is assigned the ip_cidr_range specified in the var.subnet_cidr_db variable. The network parameter is set to the ID of the VPC network created in the first step.

5. An instance template is created using the google_compute_instance_template resource. This template is used to create instances that will run a web server. The name_prefix parameter specifies a prefix that will be added to the name of each instance created from this template. The machine_type parameter specifies the type of machine that will be used for these instances. The disk parameter specifies the disk that will be used for the instances, with the source_image parameter set to debian-cloud/debian-10. The network_interface parameter specifies that the instances will use the web_subnet subnetwork, and that they will be assigned an external IP address. The metadata_startup_script parameter specifies a startup script that will run when the instances are created.

6. An instance group manager is created using the google_compute_instance_group_manager resource. This manager is used to manage a group of instances created from the template created in the previous step. The name parameter specifies a name for the group manager. The base_instance_name parameter specifies a prefix that will be added to the name of each instance created by the manager. The zone parameter specifies the zone in which the instances will be created. The target_size parameter specifies the number of instances that should be running in the group. The version parameter specifies the version of the instance template that should be used.

7. A health check is created using the google_compute_health_check resource. This health check is used to check the health of the instances in the instance group created in the previous step. The name parameter specifies a name for the health check. The check_interval_sec parameter specifies the interval at which the health check should be performed. The timeout_sec parameter specifies the timeout for the health check. The http_health_check block specifies the port and request path that should be used for the health check.

8. A backend service is created using the google_compute_backend_service resource. This backend service is used to distribute traffic to the instances in the instance group created in step 6. The name parameter specifies a name for the backend service. The backend parameter specifies the instance group that should be used as the backend. The health_checks parameter specifies the health check that should be used for the backend service. The protocol parameter

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

**Challenge#2** : MetaData

This Terraform code creates a null resource named "instance_metadata" with a local-exec provisioner that executes a command. 

The command uses the gcloud command to SSH into a Google Compute Engine instance in a specific zone, and then runs a curl command to retrieve the metadata for that instance from the Google Compute Engine metadata server. The metadata is then piped to the jq command, which filters and formats the output in JSON format. 

Finally, the metadata is redirected to a file named "instance_metadata.json".
The purpose of this code is to retrieve metadata for a Google Compute Engine instance and save it in a file for further use.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

**Challenge#3** : Nested Values

This code defines two local variables, object1 and object2, which are JSON objects. The objects have nested values that are accessed using the element function, which is used to retrieve values from nested objects.

The output statements then use the element function to access the nested values of object1 and object2. The value of nested_value1 is set to "d", which is the value of the "c" key inside the "b" key inside the "a" key of object1. The value of nested_value2 is set to "a", which is the value of the "z" key inside the "y" key inside the "x" key of object2.

Overall, the code demonstrates how to access nested values in JSON objects using the element function in Terraform.
