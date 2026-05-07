# Git & GitHub Workflow

> Version control best practices for IT documentation and script management.

---

## 1. Core Concepts

| Term | Description |
|------|-------------|
| Repository | Project folder tracked by Git |
| Commit | Snapshot of changes at a point in time |
| Branch | Independent line of development |
| Merge | Combine changes from different branches |
| Clone | Copy a remote repository locally |
| Push | Upload local commits to a remote repository |
| Pull | Download changes from a remote repository |

## 2. Essential Commands

```bash
# Initialize repository
git init

# Check status
git status

# Stage files
git add filename
git add .

# Commit changes
git commit -m "Descriptive commit message"

# View history
git log --oneline

# Create and switch branch
git checkout -b feature-branch

# Merge branch
git checkout main
git merge feature-branch

# Push to remote
git push origin main

# Pull latest changes
git pull origin main
```

## 3. Commit Message Best Practices

- Use the imperative mood: "Add feature" not "Added feature"
- Keep the first line under 50 characters
- Add a blank line, then detailed description if needed
- Reference issues when applicable

```
Add network diagnostics script

- Implements ping, DNS, and traceroute checks
- Adds colored output for readability
- Includes error handling for offline state

Closes #12
```

## 4. Branching Strategy (Simple)

| Branch | Purpose |
|--------|---------|
| `main` | Stable, production-ready code |
| `develop` | Integration branch for features |
| `feature/*` | New features or experiments |
| `docs/*` | Documentation updates |

## 5. .gitignore Basics

```gitignore
# macOS
.DS_Store

# Temporary files
*.tmp
*.log

# Environment
.env

# Build artifacts
build/
dist/
```

---

## Why This Matters for IT Operations

- **Documentation as Code**: Track changes to runbooks and procedures
- **Script Versioning**: Roll back scripts if a change breaks a system
- **Collaboration**: Multiple team members can work on automation safely
- **Audit Trail**: See who changed what and when
