# Linux Basics

> Foundational concepts and commands for Linux system administration.

---

## 1. File System Navigation

| Command | Description |
|---------|-------------|
| `pwd` | Print working directory |
| `ls -la` | List files with details |
| `cd /path` | Change directory |
| `find / -name "file"` | Search for files |

## 2. File Permissions

Linux permissions are represented in three groups: **owner**, **group**, and **others**.

```bash
# View permissions
ls -l file.txt

# Change permissions
chmod 755 script.sh
chmod u+x script.sh

# Change ownership
sudo chown user:group file.txt
```

## 3. User & Group Management

```bash
# Add user
sudo adduser username

# Add to group
sudo usermod -aG sudo username

# Switch user
su - username
```

## 4. Process Management

| Command | Description |
|---------|-------------|
| `ps aux` | List all processes |
| `top` / `htop` | Interactive process viewer |
| `kill PID` | Terminate a process |
| `systemctl status ssh` | Check service status |

## 5. Disk & Storage

```bash
# Disk usage
df -h

# Directory size
du -sh /var/log

# Mounted filesystems
mount | grep ext4
```

---

## Learning Notes

- The Linux filesystem follows the **FHS** (Filesystem Hierarchy Standard).
- `root` has UID 0 and unrestricted access.
- Always prefer `sudo` over direct root login for audit trails.
