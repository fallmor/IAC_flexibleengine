

module "ecs_cluster" {
  source = "FlexibleEngineCloud/ecs/flexibleengine"
  
  instance_name     = "Test-Mor-Ecs"
  instance_count    = 1
  availability_zone = "eu-west-0a"

  flavor_name     = "t2.small"
  key_name        = var.key_pair
  security_groups = [module.mor_sg.id]
  block_devices = [
    {
      uuid                  = "c2280a5f-159f-4489-a107-7cf0c7efdb21"
      source_type           = "image"
      destination_type      = "volume"
      volume_size           = 50
      boot_index            = 0
      delete_on_termination = true
      volume_type = "SATA"
    }
  ]

  metadata = {
    Terraform   = "true"
    Environment = "dev"
  }

  
}

module "mor_sg" {
  source  = "terraform-flexibleengine-modules/secgroup/flexibleengine"
  version = "1.0.0"
  ingress_with_source_cidr = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      ethertype   = "IPv4"
      source_cidr = "0.0.0.0/0"
    }
  ]


}