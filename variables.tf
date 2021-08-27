variable "spot_token" {
  type = string
  default = ""
}
variable "spot_account" {
  type = string
  default = ""
}
variable "name" {
  type        = string
  description = "(Required) The ManagedInstance name."
}
variable "description" {
  type        = string
  description = "The ManagedInstance description."
  default = null
}
variable "region" {
  type        = string
  description = "The AWS region your group will be created in."
}
variable "life_cycle" {
  type        = string
  description = "Set lifecycle, valid values: \"spot\", \"on_demand\". Default \"spot\"."
  default     = "spot"
}
variable "orientation" {
  type        = string
  description = "Select a prediction strategy. Valid values: \"balanced\", \"costOriented\", \"availabilityOriented\", \"cheapest\". Default: \"availabilityOriented\"."
  default     = "availabilityOriented"
}
variable "draining_timeout" {
  type        = number
  description = "The time in seconds to allow the instance be drained from incoming TCP connections and detached from ELB before terminating it, during a scale down operation."
  default     = null
}
variable "fall_back_to_od" {
  type        = bool
  description = "In case of no spots available, Managed Instance will launch an On-demand instance instead. Default: \"true\"."
  default     = true
}
variable "utilize_reserved_instances" {
  type        = bool
  description = "In case of any available Reserved Instances, Managed Instance will utilize them before purchasing Spot instances. Default: \"true\"."
  default     = true
}
variable "optimization_windows" {
  type        = list(string)
  description = "When performAt is \"timeWindow\": must specify a list of \"timeWindows\" with at least one time window. Each string should be formatted as ddd:hh:mm-ddd:hh:mm (ddd = day of week = Sun | Mon | Tue | Wed | Thu | Fri | Sat hh = hour 24 = 0 -23 mm = minute = 0 - 59)."
  default     = null
}
variable "perform_at" {
  type        = string
  description = "Valid values: \"always\", \"never\", \"timeWindow\". Default \"always\"."
  default     = "always"
}
variable "minimum_instance_lifetime" {
  type        = number
  description = "Defines the preferred minimum instance lifetime. Markets which comply with this preference will be prioritized. Optional values: 1, 3, 6, 12, 24."
  default     = null
}
variable "persist_private_ip" {
  type        = bool
  description = "Should the instance maintain its private IP. Default: \"true\"."
  default     = true
}
variable "persist_block_devices" {
  type        = bool
  description = "Should the instance maintain its Data volumes. Default: \"true\"."
  default     = true
}
variable "persist_root_device" {
  type        = bool
  description = "Should the instance maintain its root device volumes. Default: \"true\"."
  default     = true
}
variable "block_device_mode" {
  type        = string
  description = "Determine the way we attach the data volumes to the data devices. Valid values: \"reattach\", \"onLaunch\". Default: \"onLaunch\"."
  default     = "onLaunch"
}
variable "health_check_type" {
  type        = string
  description = "The service to use for the health check. Valid values: \"EC2\", \"ELB\", \"TARGET_GROUP\", \"MULTAI_TARGET_SET\". Default: \"EC2\"."
  default     = "EC2"
}
variable "auto_healing" {
  type        = bool
  description = "Enable the auto healing which auto replaces the instance in case the health check fails, default: \"true\"."
  default     = true
}
variable "grace_period" {
  type        = number
  description = "The amount of time, in seconds, after the instance has launched to starts and check its health, default \"120\"."
  default     = 120
}
variable "unhealthy_duration" {
  type        = number
  description = "The amount of time, in seconds, an existing instance should remain active after becoming unhealthy. After the set time out the instance will be replaced, default \"120\"."
  default     = 120
}
variable "subnet_ids" {
  type        = list(string)
  description = "A comma-separated list of subnet identifiers for your instance."
}
variable "vpcId" {
  type        = string
  description = "VPC id for your instance."
}
variable "elastic_ip" {
  type        = string
  description = "Elastic IP Allocation Id to associate to the instance."
  default     = null
}
variable "private_ip" {
  type        = string
  description = "Private IP Allocation Id to associate to the instance."
  default     = null
}
variable "product" {
  type        = string
  description = "Operation system type. Valid values: \"Linux/UNIX\", \"SUSE Linux\", \"Windows\", \"Red Hat Enterprise Linux\", \"Linux/UNIX (Amazon VPC)\", \"SUSE Linux (Amazon VPC)\", \"Windows (Amazon VPC)\", \"Red Hat Enterprise Linux (Amazon VPC)\". Default: \"Linux/UNIX\""
  default     = "Linux/UNIX"
}
variable "instance_types" {
  type        = list(string)
  description = "Comma separated list of available instance types for instance."
}
variable "preferred_type" {
  type        = string
  description = "Preferred instance types for the instance. We will automatically select optional similar instance types to ensure optimized cost efficiency"
}
variable "ebs_optimized" {
  type        = bool
  description = "Enable EBS optimization for supported instances. Note: Additional charges will be applied by the Cloud Provider. Default: false"
  default     = false
}
variable "enable_monitoring" {
  type        = bool
  description = "Describes whether instance Enhanced Monitoring is enabled. Default: false"
  default     = false
}
variable "placement_tenancy" {
  type        = string
  description = "Valid values: \"default\", \"dedicated\". Default: \"default\""
  default     = "default"
}
variable "iam_instance_profile" {
  type        = string
  description = "Set IAM profile to instance. Set only one of ARN or Name."
  default     = null
}
variable "security_group_ids" {
  type        = list(string)
  description = "One or more security group IDs."
  default     = null
}
variable "image_id" {
  type        = string
  description = "  The ID of the image used to launch the instance."
}
variable "key_pair" {
  type        = string
  description = "Specify a Key Pair to attach to the instances."
  default     = null
}
variable "tags" {
  type = list(object({
    key = string
    value = string
  }))
  default     = null
  description = "Set tags for the instance. Items should be unique."
}
variable "user_data" {
  type        = string
  description = "The Base64-encoded MIME user data to make available to the instances."
  default     = null
}
variable "shutdown_script" {
  type        = string
  description = "The Base64-encoded shutdown script to execute prior to instance termination."
  default     = null
}
variable "cpu_credits" {
  type        = string
  description = "cpuCredits can have one of two values: \"unlimited\", \"standard\"."
  default     = null
}

## Block Device Mappings ##
variable "device_name" {
  type        = string
  default     = "/dev/xvda"
  description = "Set device name. (Example: /dev/xvda)."
}
variable "delete_on_termination" {
  type        = string
  default     = true
  description = "Flag to delete the EBS on instance termination."
}
variable "iops" {
  type        = string
  default     = null
  description = "(Required for requests to create io1 volumes; it is not used in requests to create gp2, st1, sc1, or standard volumes) Int. The number of I/O operations per second (IOPS) that the volume supports."
}
variable "volume_type" {
  type        = string
  default     = "gp2"
  description = "The type of the volume. (Example: gp2)."
}
variable "volume_size" {
  type        = number
  default     = 30
  description = "The size, in GB of the volume."
}
variable "throughput" {
  type        = number
  default     = null
  description = "The amount of data transferred to or from a storage device per second, you can use this param just in a case that volume_type = gp3."
}
###################

# resource_tag_specification #
variable "should_tag_enis" {
  type        = bool
  description = "Tag specification for ENI resources."
  default     = true
}
variable "should_tag_volumes" {
  type        = bool
  description = "Tag specification for Volume resources."
  default     = true
}
variable "should_tag_snapshots" {
  type        = bool
  description = "Tag specification for Snapshot resources."
  default     = true
}
variable "should_tag_amis" {
  type        = bool
  description = "Tag specification for AMI resources."
  default     = true
}
###################

# network_interface #
variable "network_interface" {
  type = list(object({
    device_index = number
    associate_public_ip_address = bool
    associate_ipv6_address = bool
  }))
  default = null
  description = "List of network interfaces in an EC2 instance"
}
###################

# scheduled_task #
variable "scheduled_task" {
  type = list(object({
    is_enabled = bool
    frequency = string
    start_time = string
    cron_expression = string
    task_type = string
  }))
  default = null
  description = "List of scheduled tasks"
}
###################

# Load Balancers #
variable "load_balancer_name" {
  type        = string
  description = "Name of LB"
  default     = ""
}
variable "arn" {
  type        = string
  description = "The AWS resource ARN (Required only for ALB target groups)."
  default     = ""
}
variable "type" {
  type        = string
  description = "The resource type. Valid Values: CLASSIC, TARGET_GROUP, MULTAI_TARGET_SET."
  default     = "CLASSIC"
}
variable "balancer_id" {
  type        = string
  description = "The Multai load balancer ID. Default: lb-123456"
  default     = ""
}
variable "target_set_id" {
  type        = string
  description = "The Multai load target set ID. Default: ts-123456"
  default     = ""
}
variable "auto_weight" {
  type        = bool
  description = "Auto Weight will automatically provide a higher weight for instances that are larger as appropriate. For example, if you have configured your Elastigroup with m4.large and m4.xlarge instances the m4.large will have half the weight of an m4.xlarge. This ensures that larger instances receive a higher number of MLB requests."
  default     = null
}
variable "az_awareness" {
  type        = bool
  description = "AZ Awareness will ensure that instances within the same AZ are using the corresponding MLB runtime instance in the same AZ. This feature reduces multi-zone data transfer fees."
  default     = null
}
###################

# integration_route53 #
variable "hosted_zone_id" {
  type        = string
  description = "The Route 53 Hosted Zone Id for the registered Domain."
  default     = "zone-id"
}
variable "spotinst_acct_id" {
  type        = string
  description = "The Spotinst account ID that is linked to the AWS account that holds the Route 53 hosted Zone Id. The default is the user Spotinst account provided as a URL parameter."
  default     = null
}
variable "record_set_type" {
  type        = string
  description = "Default: a. The type of the record set. Valid values: \"a\", \"cname\"."
  default     = "a"
}
variable "record_sets" {
  type = list(object({
    name = string
    use_public_ip = bool
    use_public_dns = bool
  }))
  default = [{name = "foo.example.com", use_public_ip = true, use_public_dns = null}]
  description = "List of record sets"
}
###################

variable "managed_instance_action" {
  type        = string
  description = "Action type. Supported action types: pause, resume, recycle."
  default     = "resume"
}