terraform {
  required_version = ">= 0.13.0"
  required_providers {
    spotinst = {
      source = "spotinst/spotinst"
    }
  }
}
provider "spotinst" {
  token = var.token
  account = var.account
}
# Create a Managed Instance
resource "spotinst_managed_instance_aws" "managed-instance" {
  name                        = var.name
  description                 = var.description
  region                      = var.region
  life_cycle                  = var.life_cycle
  orientation                 = var.orientation
  draining_timeout            = var.draining_timeout
  fall_back_to_od             = var.fall_back_to_od
  utilize_reserved_instances  = var.utilize_reserved_instances
  optimization_windows        = var.optimization_windows
  revert_to_spot {
    perform_at                = var.perform_at
  }
  minimum_instance_lifetime   = var.minimum_instance_lifetime
  persist_private_ip          = var.persist_private_ip
  persist_block_devices       = var.persist_block_devices
  persist_root_device         = var.persist_root_device
  block_devices_mode          = var.block_device_mode
  health_check_type           = var.health_check_type
  auto_healing                = var.auto_healing
  grace_period                = var.grace_period
  unhealthy_duration          = var.unhealthy_duration
  subnet_ids                  = var.subnet_ids
  vpc_id                      = var.vpcId
  elastic_ip                  = var.elastic_ip
  private_ip                  = var.private_ip
  product                     = var.product
  instance_types              = var.instance_types
  preferred_type              = var.preferred_type
  ebs_optimized               = var.ebs_optimized
  enable_monitoring           = var.enable_monitoring
  placement_tenancy           = var.placement_tenancy
  iam_instance_profile        = var.iam_instance_profile
  security_group_ids          = var.security_group_ids
  image_id                    = var.image_id
  key_pair                    = var.key_pair
  dynamic tags {
    for_each = var.tags == null ? [] : var.tags
    content {
      key = tags.value["key"]
      value = tags.value["value"]
    }
  }
  user_data                   = var.user_data
  shutdown_script             = var.shutdown_script
  cpu_credits                 = var.cpu_credits

  ## Block Device Mappings ##
  block_device_mappings {
    device_name                 = var.device_name
    ebs {
      delete_on_termination     = var.delete_on_termination
      iops                      = var.iops
      volume_type               = var.volume_type
      volume_size               = var.volume_size
      throughput                = var.throughput
    }
  }

  resource_tag_specification {
    should_tag_enis           = var.should_tag_enis
    should_tag_volumes        = var.should_tag_volumes
    should_tag_snapshots      = var.should_tag_snapshots
    should_tag_amis           = var.should_tag_amis
  }

  dynamic network_interface {
    for_each = var.network_interface == null ? [] : var.network_interface
    content {
      device_index = network_interface.value["device_index"]
      associate_public_ip_address = network_interface.value["associate_public_ip_address"]
      associate_ipv6_address = network_interface.value["associate_ipv6_address"]
    }
  }

  dynamic scheduled_task {
    for_each = var.scheduled_task == null ? [] : var.scheduled_task
    content {
      is_enabled = scheduled_task.value["is_enabled"]
      frequency = scheduled_task.value["frequency"]
      start_time = scheduled_task.value["start_time"]
      cron_expression = scheduled_task.value["cron_expression"]
      task_type = scheduled_task.value["task_type"]
    }
  }

  load_balancers {
    name                = var.load_balancer_name
    arn                 = var.arn
    type                = var.type
    balancer_id         = var.balancer_id
    target_set_id       = var.target_set_id
    auto_weight         = var.auto_weight
    az_awareness        = var.az_awareness
  }

  integration_route53 {
    domains {
      hosted_zone_id = var.hosted_zone_id
      spotinst_acct_id = var.spotinst_acct_id
      record_set_type = var.record_set_type
      dynamic record_sets {
        for_each = var.record_sets == null ? [] : var.record_sets
        content {
          name = record_sets.value["name"]
          use_public_ip = record_sets.value["use_public_ip"]
          use_public_dns = record_sets.value["use_public_dns"]
        }
      }
    }
  }

  managed_instance_action {
    type                = var.managed_instance_action
  }



}