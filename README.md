# Azure Windows VM With Terraform

This Terraform creates one Windows VM in Azure Central India with:

- Resource group
- Virtual network and subnet
- Network security group allowing RDP
- Static public IP
- Network interface
- Windows Server 2022 VM
- Password authentication for RDP

The VM is composed from small local modules under `modules/`, with one Azure resource per module.

## Prerequisites

- Terraform 1.5 or newer
- Azure CLI
- Azure login:

```powershell
az login
az account set --subscription "<subscription-id-or-name>"
```

## Local Deploy

Optionally copy the example variables file:

```powershell
Copy-Item terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` and set:

- `admin_password` to a strong Windows admin password
- `allowed_rdp_cidr` to your public IP as `/32`

Then run:

```powershell
terraform init `
  -backend-config="resource_group_name=<state-resource-group>" `
  -backend-config="storage_account_name=<state-storage-account>" `
  -backend-config="container_name=<state-container>" `
  -backend-config="key=azure-vm.tfstate"
terraform plan -out vm.tfplan
terraform apply vm.tfplan
```

After apply, Terraform prints the public IP and RDP username.

## GitHub Actions Deploy With OIDC

The deploy workflow is in `.github/workflows/terraform-azure-vm.yml`.

This workflow uses GitHub OIDC authentication. You do not need an Azure client secret.

Create an Azure Storage Account container for Terraform state before running the workflow. Grant the federated identity `Storage Blob Data Contributor` on the state storage account or container.

Grant the same identity `Contributor` on the subscription or resource group where the VM resources will be created.

Add these GitHub repository secrets:

- `AZURE_CLIENT_ID`
- `AZURE_TENANT_ID`
- `AZURE_SUBSCRIPTION_ID`
- `ADMIN_PASSWORD`
- `TF_STATE_RESOURCE_GROUP_NAME`
- `TF_STATE_STORAGE_ACCOUNT_NAME`
- `TF_STATE_CONTAINER_NAME`
- `TF_STATE_KEY`, for example `azure-vm.tfstate`

Add this GitHub repository variable:

- `ALLOWED_RDP_CIDR`, for example `203.0.113.10/32`

Configure federated credentials on the Azure app registration or managed identity used by `AZURE_CLIENT_ID`, allowing this GitHub repository to request Azure OIDC tokens.

For manual deployments from the `main` branch, use this federated credential subject:

```text
repo:<github-owner>/<github-repo>:ref:refs/heads/main
```

The workflow runs:

- manual `terraform plan` and `terraform apply` from the GitHub Actions UI

## GitHub Actions Destroy

The destroy workflow is in `.github/workflows/terraform-destroy.yml`.

Run it manually from the GitHub Actions UI and type `destroy` in the confirmation input. It uses the same OIDC and Terraform state settings as the deploy workflow.

## Destroy

```powershell
terraform destroy
```
