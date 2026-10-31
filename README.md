# Terraform Infrastructure Automation

A hands-on infrastructure-as-code portfolio project demonstrating how Terraform can provision and manage resources across local containers and cloud platforms. The repository currently includes Docker and AWS examples, with Google Cloud (GCP) planned next.

## Examples

### Docker

The `docker/` configuration uses the Terraform Docker provider to:

- Pull the `nginx:latest` and `httpd:latest` images.
- Run NGINX on `http://localhost:9000` and Apache HTTP Server on `http://localhost:9001`.

**Requirements:** Terraform CLI and Docker Desktop with the Docker Engine running. The provider is currently configured for the Windows Docker Engine named pipe.

From PowerShell:

```powershell
cd docker
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
```

Check the services with `curl.exe http://localhost:9000` and `curl.exe http://localhost:9001`. Remove the resources with `terraform destroy`.

### AWS

The `aws/` configuration provisions a basic AWS network and web-server environment:

- A VPC and subnet, connected to an internet gateway through a route table.
- A security group and an EC2 `t2.micro` instance.
- NGINX installation and startup through EC2 user data.
- Terraform outputs for the EC2 instance ID and public IP address.

**Requirements:** Terraform CLI, an AWS account, and AWS CLI credentials available through the `default` profile. The provider is configured for `us-east-1`; the AMI value is region-specific.

From PowerShell:

```powershell
cd aws
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
terraform output
```

Terraform automatically loads `terraform.tfvars` when it is present. Review the plan before applying. When finished, remove the AWS resources to avoid ongoing charges:

```powershell
terraform destroy
```

> **Security note:** This is a learning example, not a production-ready deployment. The current security group allows inbound SSH from any IPv4 address (`0.0.0.0/0`) and does not define an inbound HTTP rule. Restrict SSH to a trusted IP range and configure only the required network access before using it beyond a controlled test environment.

## Repository layout

```text
.
├── aws/
│   ├── main.tf             # VPC, subnet, routing, security group, and EC2 instance
│   ├── output.tf           # Instance ID and public IP
│   ├── provider.tf         # AWS provider configuration
│   ├── terraform.tfvars    # Local variable overrides; ignored by Git
│   └── variables.tf        # Configurable resource names, CIDRs, and AMI
├── docker/
│   ├── main.tf             # Docker images, containers, and port mappings
│   └── provider.tf         # Docker provider configuration
└── README.md
```

## Roadmap

- Add a Google Cloud (GCP) infrastructure example.
- Continue improving the examples with safer, configurable networking and deployment practices.

## Safety and state

Terraform state can contain sensitive infrastructure details. Keep state files and any variable files containing secrets out of version control. Use AWS profiles or role-based credentials rather than placing cloud credentials in Terraform files. Review each plan before applying, and destroy test resources when they are no longer needed.
