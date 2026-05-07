# Lab 04: Troubleshooting Practice

> Apply a structured troubleshooting methodology to common IT scenarios.

---

## Objectives

- Follow a systematic troubleshooting process
- Analyze logs and system behavior
- Document findings and resolutions
- Practice root cause analysis

## Exercises

### 1. Scenario: Slow System Response

**Symptom**: A Linux server is responding slowly to SSH and commands.

**Diagnostic steps**:

```bash
# Check CPU and memory usage
top -bn1 | head -n20

# Check disk I/O
iostat -x 1 5

# Check disk space
df -h

# Check for memory pressure
free -h

# Check running processes
ps aux --sort=-%mem | head -n10
```

**Questions**:
- Is the issue CPU-bound, memory-bound, or I/O-bound?
- Which process is consuming the most resources?
- What would be the next step?

### 2. Scenario: Service Not Starting

**Symptom**: The Apache web server fails to start.

**Diagnostic steps**:

```bash
# Check service status
sudo systemctl status apache2

# Check logs
sudo journalctl -u apache2 -n 50

# Check configuration syntax
sudo apachectl configtest

# Check port availability
sudo ss -tlnp | grep :80
```

### 3. Scenario: User Cannot Log In

**Symptom**: A user reports they cannot log in via SSH.

**Diagnostic steps**:

```bash
# Check authentication logs
sudo tail -n20 /var/log/auth.log

# Verify user exists
id username

# Check account status
sudo passwd -S username

# Check SSH service status
sudo systemctl status sshd
```

## Checklist

- [ ] Gathered information before acting
- [ ] Formed a hypothesis based on symptoms
- [ ] Tested the hypothesis safely
- [ ] Applied a fix and verified resolution
- [ ] Documented the root cause and solution

## Notes

Practice makes perfect. The more scenarios you work through, the faster pattern recognition becomes.
