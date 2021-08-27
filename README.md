# terraform-spotinst-managed-instance
Spotinst Provider Module for Managed Instance resource

## Usage
```hcl
## Create Managed Instance ##
module "managed-instance" {
  source = "stevenfeltner/managed-instance/spotinst"

  # Spot.io Credentials
  spot_token              = "redacted"
  spot_account            = "redacted"
  
  image_id                    = ""
  instance_types              = ["t3.medium"]
  name                        = "Terraform-Managed-Instance"
  preferred_type              = "t3.medium"
  region                      = "us-west-2"
  subnet_ids                  = []
  vpcId                       = ""
}
```

## Providers

| Name | Version |
|------|---------|
| spotinst/spotinst | >= 1.30.0 |

## Documentation

If you're new to [Spot](https://spot.io/) and want to get started, please checkout our [Getting Started](https://docs.spot.io/connect-your-cloud-provider/) guide, available on the [Spot Documentation](https://docs.spot.io/) website.

## Getting Help

We use GitHub issues for tracking bugs and feature requests. Please use these community resources for getting help:

- Ask a question on [Stack Overflow](https://stackoverflow.com/) and tag it with [terraform-spotinst](https://stackoverflow.com/questions/tagged/terraform-spotinst/).
- Join our [Spot](https://spot.io/) community on [Slack](http://slack.spot.io/).
- Open an issue.

## Community

- [Slack](http://slack.spot.io/)
- [Twitter](https://twitter.com/spot_hq/)

## Contributing

Please see the [contribution guidelines](CONTRIBUTING.md).