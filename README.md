# Azure Blob Storage Security – Terraform

This project uses Terraform to deploy Azure Blob Storage infrastructure and configure application access using Microsoft Entra ID and Azure RBAC.

## Requirements

Make sure the following tools are installed:

- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Terraform](https://developer.hashicorp.com/terraform/install)
- [Git](https://git-scm.com/downloads)

You will also need an Azure subscription with permission to create the required resources.

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR-GITHUB-USERNAME/uvu-it3200-azure-blob-security.git
cd uvu-it3200-azure-blob-security
```

### 2. Log in to Azure

```bash
az login
```

Verify your active subscription:

```bash
az account show
```

If needed, select your subscription:

```bash
az account set --subscription YOUR-SUBSCRIPTION-ID
```

### 3. Configure Variables

Create a local `terraform.tfvars` file in the project directory:

```hcl
subscription_id = "YOUR-SUBSCRIPTION-ID"
student_name    = "yourname"
location        = "westus2"
```

Replace the example values with your own.

### 4. Initialize Terraform

```bash
terraform init
```

This downloads the required providers and prepares Terraform for deployment.

### 5. Validate the Configuration

```bash
terraform validate
```

### 6. Review the Deployment

```bash
terraform plan
```

Review the resources Terraform intends to create before proceeding.

### 7. Deploy the Resources

```bash
terraform apply
```

Review the deployment plan and type `yes` when prompted.

Terraform will create the configured Azure resources and application identity.

## Service Principal Access Testing

After deployment, authenticate using the service principal credentials generated for the application.

The service principal is intended to have Storage Blob Data Contributor permissions scoped to the `reports` container.

Use Azure CLI with `--auth-mode login` to test Blob Storage operations, including uploading, listing, and downloading files.

## Cleanup

To remove the resources deployed by Terraform:

```bash
terraform destroy
```

Review the deletion plan and confirm when prompted.

## Security

- Storage container public access is disabled.
- HTTPS and TLS 1.2 are required.
- Shared storage account key authentication is disabled.
- Blob permissions are assigned using Azure RBAC.
- Terraform state files, variable files, and credentials should never be committed to GitHub.

