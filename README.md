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

What CloudForge Demonstrates
- Infrastructure as Code with Terraform
- Containerization with Docker
- Kubernetes application deployment
- Kubernetes health and readiness probes
- CI/CD with GitHub Actions
- Infrastructure and Kubernetes security scanning
- Kubernetes manifest validation
- Application metrics with Prometheus
- Deployment health checks
- Automated rollback logic
- Failure simulation and recovery
- Reusable cloud-oriented infrastructure patterns
