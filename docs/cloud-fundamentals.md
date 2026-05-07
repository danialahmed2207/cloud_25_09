# Cloud Fundamentals

> Introduction to cloud computing concepts for IT operations and support roles.

---

## 1. What is Cloud Computing?

Cloud computing is the on-demand delivery of IT resources over the internet with pay-as-you-go pricing. Instead of owning and maintaining physical data centers and servers, organizations can access technology services — such as computing power, storage, and databases — as needed.

## 2. Cloud Service Models

| Model | Description | Example |
|-------|-------------|---------|
| **IaaS** | Infrastructure as a Service — rent VMs, storage, networks | AWS EC2, Azure VMs |
| **PaaS** | Platform as a Service — managed runtime for applications | Heroku, AWS Elastic Beanstalk |
| **SaaS** | Software as a Service — fully managed applications | Google Workspace, Microsoft 365 |

## 3. Cloud Deployment Models

| Model | Description |
|-------|-------------|
| **Public Cloud** | Resources owned by a third-party provider (AWS, Azure, GCP) |
| **Private Cloud** | Resources used exclusively by one organization |
| **Hybrid Cloud** | Combination of public and private clouds |
| **Multi-Cloud** | Using services from multiple cloud providers |

## 4. Key Cloud Concepts

- **Virtualization**: Running multiple virtual machines on a single physical server
- **Containers**: Lightweight, portable application environments (Docker, Kubernetes)
- **Auto-Scaling**: Automatically adjusting resources based on demand
- **Load Balancing**: Distributing traffic across multiple servers
- **High Availability**: Designing systems to remain operational during failures

## 5. Cloud vs. On-Premises

| Aspect | On-Premises | Cloud |
|--------|-------------|-------|
| Capital Expense | High upfront cost | Low / pay-as-you-go |
| Scalability | Limited by hardware | Near-unlimited |
| Maintenance | In-house responsibility | Provider-managed |
| Agility | Slower to deploy | Rapid provisioning |

## 6. Shared Responsibility Model

| Responsibility | On-Premises | IaaS | PaaS | SaaS |
|----------------|-------------|------|------|------|
| Data | Customer | Customer | Customer | Customer |
| Applications | Customer | Customer | Provider | Provider |
| OS | Customer | Customer | Provider | Provider |
| Network | Customer | Provider | Provider | Provider |
| Physical | Customer | Provider | Provider | Provider |

---

## Learning Path

1. Understand virtualization (VMs vs. containers)
2. Learn a major cloud provider's console (AWS Free Tier)
3. Practice with CLI tools (AWS CLI, Azure CLI)
4. Study networking in the cloud (VPCs, subnets, security groups)
5. Explore Infrastructure as Code (Terraform basics)
