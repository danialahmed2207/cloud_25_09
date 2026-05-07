#!/usr/bin/env bash
#
# log-check-demo.sh
# Demonstrates how to inspect system logs safely.
# Read-only — no logs are modified.
#

set -euo pipefail

LINES=20

echo "========================================"
echo "       Log Check Demo"
echo "========================================"
echo ""

# Check if systemd journal is available
if command -v journalctl &>/dev/null; then
    echo "--- Recent System Logs (journalctl) ---"
    journalctl --no-pager -n "${LINES}" 2>/dev/null || echo "  Unable to read journal (may require permissions)"
    echo ""

    echo "--- Recent SSH Logs ---"
    journalctl --no-pager -u ssh -n "${LINES}" 2>/dev/null || journalctl --no-pager -u sshd -n "${LINES}" 2>/dev/null || echo "  SSH service logs not found"
    echo ""
else
    echo "--- Recent System Logs (syslog) ---"
    if [ -f /var/log/syslog ]; then
        tail -n "${LINES}" /var/log/syslog 2>/dev/null || echo "  Permission denied"
    elif [ -f /var/log/messages ]; then
        tail -n "${LINES}" /var/log/messages 2>/dev/null || echo "  Permission denied"
    else
        echo "  No standard system log found"
    fi
    echo ""

    echo "--- Recent Authentication Logs ---"
    if [ -f /var/log/auth.log ]; then
        tail -n "${LINES}" /var/log/auth.log 2>/dev/null || echo "  Permission denied"
    else
        echo "  auth.log not found"
    fi
    echo ""
fi

# Check for failed login attempts
echo "--- Failed Login Attempts (last 24h) ---"
if command -v lastb &>/dev/null && [ -f /var/log/btmp ]; then
    lastb -n 10 2>/dev/null || echo "  lastb unavailable or permission denied"
else
    echo "  lastb not available or /var/log/btmp missing"
fi
echo ""

# Check current user sessions
echo "--- Active User Sessions ---"
who 2>/dev/null || echo "  who command unavailable"
echo ""

# Check boot messages
echo "--- Boot Messages (dmesg) ---"
dmesg | tail -n "${LINES}" 2>/dev/null || echo "  dmesg unavailable"
echo ""

echo "========================================"
echo "Log check completed: $(date)"
echo "========================================"
