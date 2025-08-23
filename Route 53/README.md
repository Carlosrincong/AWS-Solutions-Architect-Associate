
Register a domain
Zone file contains DNS records
Name server resolves DNS queries
Top level domain : .com, .gov, .org, in
Second level domain: google.com, amazon.com

# Amazon Route 53
Authoritative DNS and a domain registrar
Authoritative = The user can update de DNS records
100% availability SLA

Records contains:
- Domain/subdomain name
- Record type: A, AAAA, CNAME, NS and more
- Value: 1.10.10.0
- Routing policy: How Route 53 responds to queries
- TTL (Time to Live): amount of time the record is cached at DNS resolvers

Record Type
- A: maps a hostname to IPv4
- AAAA: maps a hostname to IPv6
- CNAME: maps a hostname to another hostname
- NS: Name server for the hosted zone, which is a container of records