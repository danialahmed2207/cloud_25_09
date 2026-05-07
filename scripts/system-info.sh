#!/usr/bin/env bash
#
# system-info.sh
# Displays basic system information for Linux environments.
# Safe, read-only script — no modifications are made to the system.
#

set -euo pipefail

echo "========================================"
echo "       System Information Report"
echo "========================================"
echo ""

# Operating System
echo "--- Operating System ---"
if command -v lsb_release &>/dev/null; then
    lsb_release -d | cut -f2
else
    echo "OS: $(uname -o)"
fi
echo ""

# Kernel
echo "--- Kernel ---"
echo "Kernel: $(uname -r)"
echo "Architecture: $(uname -m)"
echo ""

# Hostname
echo "--- Hostname ---"
echo "Hostname: $(hostname)"
echo ""

# CPU
echo "--- CPU ---"
if [ -f /proc/cpuinfo ]; then
    CPU_MODEL=$(grep 'model name' /proc/cpuinfo | head -n1 | cut -d':' -f2 | sed 's/^ *//')
    CPU_COUNT=$(nproc)
    echo "Model: ${CPU_MODEL}"
    echo "Cores: ${CPU_COUNT}"
else
    echo "CPU: $(sysctl -n hw.model 2>/dev/null || echo 'N/A')"
    echo "Cores: $(sysctl -n hw.ncpu 2>/dev/null || echo 'N/A')"
fi
echo ""

# Memory
echo "--- Memory ---"
if command -v free &>/dev/null; then
    free -h | grep -E 'Mem|Swap'
else
    vm_stat 2>/dev/null | head -n5 || echo "Memory info unavailable"
fi
echo ""

# Disk
echo "--- Disk Usage ---"
df -h / | tail -n1 | awk '{print "Total: "$2", Used: "$3", Available: "$4", Use%: "$5}'
echo ""

# Network
echo "--- Network ---"
# Try to get primary IP address
if command -v ip &>/dev/null; then
    IP_ADDR=$(ip route get 1.1.1.1 2>/dev/null | grep -oP 'src \K\S+' || echo "N/A")
elif command -v ifconfig &>/dev/null; then
    IP_ADDR=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | head -n1 | awk '{print $2}' | sed 's/addr://' || echo "N/A")
else
    IP_ADDR="N/A"
fi
echo "IP Address: ${IP_ADDR}"
echo ""

# Uptime
echo "--- Uptime ---"
uptime -p 2>/dev/null || uptime
echo ""

echo "========================================"
echo "Report generated: $(date)"
echo "========================================"
