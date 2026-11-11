# CloudForge

> **Build. Validate. Deploy. Observe. Recover.**

CloudForge is a local-first **Cloud Infrastructure Automation Platform** built to demonstrate how infrastructure, application deployment, security validation, monitoring, and automated recovery can be integrated into a single engineering workflow.

The platform is designed around real cloud engineering practices while running locally without requiring an active AWS account.

## Architecture

cat > README.md <<'EOF'
# CloudForge

> **Build. Validate. Deploy. Observe. Recover.**

CloudForge is a local-first **Cloud Infrastructure Automation Platform** built to demonstrate how infrastructure, application deployment, security validation, monitoring, and automated recovery can be integrated into a single engineering workflow.

The platform is designed around real cloud engineering practices while running locally without requiring an active AWS account.

## Architecture

```text
Developer
   │
   ▼
GitHub
   │
   ▼
GitHub Actions
   ├── Application Tests
   ├── Terraform Validation
   ├── Security Scanning
   └── Kubernetes Manifest Validation
   │
   ▼
Docker
   │
   ▼
Kubernetes (kind)
   │
   ├── CloudForge Application
   ├── Service / Ingress
   │
   ▼
Prometheus
   │
   ├── Application Metrics
   └── Health Alerts
   │
   ▼
Failure Detection
   │
   ▼
Rollback
## Kubernetes Deployment

CloudForge runs as a Kubernetes deployment with:

- 2 application replicas
- Rolling updates
- Readiness probes
- Liveness probes
- Kubernetes Service
- NGINX Ingress
- Dedicated namespace

## Monitoring

Prometheus monitors the CloudForge application through its `/metrics` endpoint.

The platform includes an alert rule that detects when the application becomes unavailable:

```text
CloudForgeDown
```

## Failure & Rollback Demonstration

CloudForge includes a controlled deployment failure scenario.

Deploy a broken image:

```bash
kubectl set image deployment/cloudforge-app \
  cloudforge-app=cloudforge-app:v3-broken \
  -n cloudforge
```

Restore the previous healthy deployment:

```bash
kubectl rollout undo deployment/cloudforge-app \
  -n cloudforge
```

Rollback automation is also available:

```bash
./scripts/rollback.sh
```

This demonstrates a practical:

**Detect → Recover → Verify**

workflow.

## Local Setup

Create the Kubernetes cluster:

```bash
kind create cluster --name cloudforge
```

Create the application namespace:

```bash
kubectl apply -f kubernetes/namespace.yaml
```

Deploy CloudForge:

```bash
kubectl apply -f kubernetes/
```

Verify:

```bash
kubectl get pods -n cloudforge
kubectl get service -n cloudforge
```

## AWS Cloud Mapping

CloudForge is intentionally local-first, but its components map to common AWS concepts:

| CloudForge | AWS Equivalent |
|---|---|
| Docker | ECS / EC2 container workloads |
| kind Kubernetes | Amazon EKS |
| Local networking | Amazon VPC |
| NGINX Ingress | Application Load Balancer |
| Prometheus | CloudWatch / Amazon Managed Service for Prometheus |
| Terraform | AWS Infrastructure as Code |
| Kubernetes configuration | Secrets Manager / Parameter Store |

**Important:** CloudForge is not deployed to AWS. The AWS mapping demonstrates how the same engineering concepts translate to a cloud environment.

## Why This Project

CloudForge demonstrates practical Cloud Engineering capabilities beyond individual tool knowledge:

**Provision → Validate → Secure → Deploy → Observe → Recover**

The project focuses on automation, reliability, infrastructure validation, observability, and operational recovery.

## Target Roles

- Cloud Engineer
- Cloud Infrastructure Engineer
- Cloud Automation Engineer
- Platform Engineer
- DevOps / Cloud Operations Engineer

## Repository

GitHub: https://github.com/dudeingit/cloudforge


