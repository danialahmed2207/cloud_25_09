#!/usr/bin/env bash
#
# network-check.sh
# Performs basic network diagnostics.
# Safe, read-only script — no modifications are made to the system.
#

set -euo pipefail

# Configuration
DNS_TARGET="google.com"
PING_TARGET="1.1.1.1"
GATEWAY=$(ip route | grep default | awk '{print $3}' | head -n1 || echo "")

echo "========================================"
echo "       Network Diagnostics"
echo "========================================"
echo ""

# Interface info
echo "--- Network Interfaces ---"
ip addr show 2>/dev/null | grep -E '^[0-9]+:|inet ' || ifconfig 2>/dev/null | grep -E '^[a-z]|inet ' || echo "Interface info unavailable"
echo ""

# Default gateway
echo "--- Default Gateway ---"
ip route | grep default 2>/dev/null || route -n 2>/dev/null | grep '^0.0.0.0' || echo "Gateway: N/A"
echo ""

# Gateway ping
echo "--- Gateway Reachability ---"
if [ -n "${GATEWAY}" ]; then
    if ping -c 1 -W 2 "${GATEWAY}" &>/dev/null; then
        echo "Gateway (${GATEWAY}): REACHABLE"
    else
        echo "Gateway (${GATEWAY}): UNREACHABLE"
    fi
else
    echo "Gateway: Unable to detect"
fi
echo ""

# Internet ping
echo "--- Internet Connectivity ---"
if ping -c 1 -W 3 "${PING_TARGET}" &>/dev/null; then
    echo "Internet (${PING_TARGET}): REACHABLE"
else
    echo "Internet (${PING_TARGET}): UNREACHABLE"
fi
echo ""

# DNS resolution
echo "--- DNS Resolution ---"
if command -v nslookup &>/dev/null; then
    if nslookup "${DNS_TARGET}" &>/dev/null; then
        echo "DNS (${DNS_TARGET}): RESOLVED"
        nslookup "${DNS_TARGET}" | grep 'Address:' | tail -n1
    else
        echo "DNS (${DNS_TARGET}): FAILED"
    fi
elif command -v dig &>/dev/null; then
    if dig +short "${DNS_TARGET}" &>/dev/null; then
        echo "DNS (${DNS_TARGET}): RESOLVED"
        dig +short "${DNS_TARGET}" | head -n1
    else
        echo "DNS (${DNS_TARGET}): FAILED"
    fi
else
    echo "DNS tools not available"
fi
echo ""

# DNS servers
echo "--- DNS Servers ---"
grep '^nameserver' /etc/resolv.conf 2>/dev/null || echo "DNS config unavailable"
echo ""

echo "========================================"
echo "Check completed: $(date)"
echo "========================================"
