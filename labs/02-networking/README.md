# Lab 02: Networking Diagnostics

> Practice essential networking commands and troubleshoot connectivity issues.

---

## Objectives

- Inspect network interface configuration
- Test connectivity with ping and traceroute
- Resolve DNS queries
- Analyze open ports and connections

## Exercises

### 1. Interface Inspection

```bash
# Show all interfaces
ip addr

# Show routing table
ip route

# Legacy command
ifconfig
```

### 2. Connectivity Testing

```bash
# Ping a well-known public DNS
ping -c 4 8.8.8.8

# Trace the route to a host
traceroute google.com

# Check if a specific port is open
curl -v telnet://google.com:80
```

### 3. DNS Resolution

```bash
# Query A record
nslookup google.com

# Detailed DNS query
dig google.com

# Reverse lookup
host 8.8.8.8
```

### 4. Socket Inspection

```bash
# Show listening TCP ports
ss -tlnp

# Show all connections
ss -tan

# Legacy netstat
netstat -tlnp
```

## Troubleshooting Scenario

**Problem**: A user reports they cannot access any websites.

**Steps to diagnose**:

1. Check if the interface has an IP: `ip addr`
2. Check default gateway: `ip route | grep default`
3. Ping the gateway: `ping <gateway-ip>`
4. Ping external IP: `ping 1.1.1.1`
5. Test DNS: `nslookup google.com`
6. Check firewall: `sudo iptables -L`

## Checklist

- [ ] Inspected network interfaces
- [ ] Verified gateway and route
- [ ] Tested internet connectivity
- [ ] Verified DNS resolution
- [ ] Listed open ports and connections

## Notes

Document any errors encountered and how they were resolved.
