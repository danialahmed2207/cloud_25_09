# Lab 01: Linux CLI Fundamentals

> Hands-on practice with essential Linux commands and file system navigation.

---

## Objectives

- Navigate the Linux file system confidently
- Manage files and directories
- Understand permissions and ownership
- Use pipes, redirections, and basic filters

## Exercises

### 1. Navigation

```bash
# Print current directory
pwd

# List files with details
ls -la

# Change to /var/log
cd /var/log

# Go back to home
cd ~
```

### 2. File Operations

```bash
# Create a directory
mkdir ~/lab01

# Create an empty file
touch ~/lab01/notes.txt

# Copy a file
cp /etc/hostname ~/lab01/hostname_backup.txt

# Move / rename
mv ~/lab01/notes.txt ~/lab01/my_notes.txt

# View file content
cat ~/lab01/hostname_backup.txt
```

### 3. Permissions

```bash
# Make a script executable
chmod +x ~/lab01/test.sh

# Change owner
sudo chown $USER:$USER ~/lab01/test.sh

# View permissions
ls -l ~/lab01/
```

### 4. Pipes and Filters

```bash
# Count lines in a file
wc -l /etc/passwd

# Search for a user
grep "root" /etc/passwd

# Sort and show top results
cat /etc/passwd | cut -d: -f1 | sort | head -n5
```

## Checklist

- [ ] Created and navigated directories
- [ ] Created, copied, moved, and deleted files
- [ ] Modified file permissions
- [ ] Used pipes to chain commands
- [ ] Practiced with `grep`, `awk`, `sed`

## Notes

Record any difficulties or insights here for future reference.
