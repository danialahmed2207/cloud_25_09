# Troubleshooting Checklist

> A structured approach to diagnosing and resolving IT issues.

---

## The IT Troubleshooting Methodology

### 1. Identify the Problem

- [ ] Gather information from the user or system
- [ ] Reproduce the issue consistently
- [ ] Determine the scope (one user, one machine, entire network?)

### 2. Establish a Theory

- [ ] Question the obvious (is it plugged in? is it turned on?)
- [ ] Consider multiple possible causes
- [ ] Use the **OSI model** to isolate the layer (physical → application)

### 3. Test the Theory

- [ ] Start with the quickest tests first
- [ ] Check logs (`/var/log/syslog`, `journalctl`, event viewer)
- [ ] Use diagnostic commands (`ping`, `traceroute`, `netstat`)

### 4. Establish a Plan

- [ ] Prioritize fixes by impact and risk
- [ ] Document each step
- [ ] Have a rollback plan if the fix fails

### 5. Implement the Solution

- [ ] Apply the fix during a maintenance window if possible
- [ ] Monitor the system during and after the change

### 6. Verify Functionality

- [ ] Confirm the issue is resolved
- [ ] Check for side effects or new issues
- [ ] Have the user test and confirm

### 7. Document

- [ ] Record the root cause and resolution
- [ ] Update knowledge base / runbooks
- [ ] Share lessons learned with the team

---

## Common Linux Troubleshooting Commands

| Symptom | Command | Purpose |
|---------|---------|---------|
| Slow system | `top`, `htop`, `iotop` | Find resource hogs |
| Disk full | `df -h`, `du -sh *` | Locate large files |
| Service down | `systemctl status <svc>` | Check service state |
| Network issue | `ping`, `ip addr`, `ss` | Diagnose connectivity |
| Boot failure | `journalctl -xb` | Review boot logs |
| Permission denied | `ls -la`, `id` | Check ownership and groups |

---

## Log Locations

| Log | Path |
|-----|------|
| System log | `/var/log/syslog` or `/var/log/messages` |
| Authentication | `/var/log/auth.log` |
| Boot log | `/var/log/boot.log` |
| Kernel log | `dmesg` or `/var/log/kern.log` |
| Application logs | `/var/log/<application>/` |
