# CloudForge

> **Build. Validate. Deploy. Observe. Recover.**

CloudForge is a local-first **Cloud Infrastructure Automation Platform** built to demonstrate how infrastructure, application deployment, security validation, monitoring, and automated recovery can be integrated into a single engineering workflow.

The platform is designed around real cloud engineering practices while running locally without requiring an active AWS account.

## Architecture

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
├── CloudForge Application
├── Service / Ingress
    │
    ▼
Prometheus
├── Application Metrics
└── Health Alerts
    │
    ▼
Failure Detection
    │
    ▼
Rollback



