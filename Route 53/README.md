
Register a domain
Zone file contains DNS records
Name server resolves DNS queries
Top level domain : .com, .gov, .org, in
Second level domain: google.com, amazon.com

# Amazon Route 53
Authoritative DNS and a domain registrar
Authoritative = The user can update de DNS records
100% availability SLA

### Records contains:
- Domain/subdomain name
- Record type: A, AAAA, CNAME, NS and more
- Value: 1.10.10.0
- Routing policy: How Route 53 responds to queries
- TTL (Time to Live): amount of time the record is cached at DNS resolvers

### Record Type
- A: maps a hostname to IPv4
- AAAA: maps a hostname to IPv6
- CNAME: maps a hostname to another hostname. ONLY for non root domain name
- NS: Name server for the hosted zone, which is a container of records
- Alias (enabled): maps a hostname to a AWS resource. for BOTH root domain and non root domain. Free of charge and you can´t set TTL. AWS resource like a Load balancer, CloudFront, API gateway, S3 websites, VPC interface endpoints, Global accelerator, Reoute 53. The record type is A/AAAA.

### Routing policy
- Simple: tipically, route traffic to a single resource. You can specify multiple values in the same record and only one will be chosen by the client
- Weighted: % of request go to specific resource. DNS records must be have the same name and type.
- Latency: redirect to the resource that has the least latency close to us. Latency is based on traffic between users and AWS regions. For this, you must specify the region of a record. 
- Failover (active - passive) a HEALTH CHECK is mandatory. Shift between Primary to secondary instance if the primary instance is unhealthy. You must to create a record for primary and other for the secondary enpoint, along with a Health check.
- Geolocation: based on where the user is located. Can be asociated with HC. A record must be created for each location.
- Multi-value : route traffic to multiple resources. Can be asociated with HC. 
- Geoproximity: based on location of users and resources. Bias is a parameter that you define to receive more or less traffic in a specific region. Users will be redirected to the closets region with higher bias. Bias is the capacity of a region to receive traffic. 
- IP based: route specific CIDR block to specific endpoint.

##### Health checks
Only for public resources. Automated DNS failover
- Monitor an endpoint: send http/s or TCP request and wait for: a 2xx response or specific text in the response. You must allow incoming request from the Route 53 HC  in your router/firewall
- Monitor other health checks (calculated HC): combine the result of multiple child health checks (up to 256) into a single health check
- Monitor CloudWatch alarms: you can set alarms for private hosted zones and attach the Health check to monitor that alarm.
