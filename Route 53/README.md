
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
- CNAME: maps a hostname to another hostname. ONLY for non root domain name
- NS: Name server for the hosted zone, which is a container of records
- Alias (enabled): maps a hostname to a AWS resource. for BOTH root domain and non root domain. Free of charge and you can´t set TTL. AWS resource like a Load balancer, CloudFront, API gateway, S3 websites, VPC interface endpoints, Global accelerator, Reoute 53. The record type is A/AAAA.

Routing policy
- Simple: tipically, route traffic to a single resource. You can specify multiple values in the same record and only one will be chosen by the client
- Weighted: % of request go to specific resource. DNS records must be have the same name and type.
- Failover
- Latency
- Geolocation
- Multi-value answer
- Geoproximity
