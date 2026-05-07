# Networking Basics

> Core networking concepts for IT support and operations.

---

## 1. TCP/IP Model Overview

| Layer | Protocols / Examples |
|-------|----------------------|
| Application | HTTP, HTTPS, DNS, SSH, FTP |
| Transport | TCP, UDP |
| Internet | IP, ICMP, ARP |
| Network Access | Ethernet, Wi-Fi |

## 2. IP Addressing

- **IPv4**: 32-bit address (e.g., `192.168.1.1`)
- **IPv6**: 128-bit address (e.g., `2001:0db8::1`)
- **Private ranges**: `10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`
- **Loopback**: `127.0.0.1` / `::1`

## 3. DNS (Domain Name System)

Translates human-readable domain names into IP addresses.

```bash
# Query DNS
nslookup google.com
dig google.com
host google.com
```

## 4. DHCP (Dynamic Host Configuration Protocol)

Automatically assigns IP addresses to devices on a network.

- **DORA Process**: Discover → Offer → Request → Acknowledge
- Lease time determines how long a device keeps an IP

## 5. Common Ports

| Port | Protocol | Service |
|------|----------|---------|
| 22 | TCP | SSH |
| 53 | UDP/TCP | DNS |
| 80 | TCP | HTTP |
| 443 | TCP | HTTPS |
| 25 | TCP | SMTP |

## 6. Essential Tools

```bash
# Check connectivity
ping 8.8.8.8

# Trace route
traceroute google.com

# Check open ports
ss -tlnp
netstat -tlnp

# View network interfaces
ip addr
ip route
```

---

## Troubleshooting Workflow

1. Check physical / link layer (cable, interface status)
2. Verify IP configuration (`ip addr`, `ip route`)
3. Test local gateway (`ping <gateway>`)
4. Test external connectivity (`ping 8.8.8.8`)
5. Test DNS resolution (`nslookup google.com`)
6. Check firewall rules (`sudo iptables -L`)
