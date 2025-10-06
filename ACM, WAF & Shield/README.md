
# AWS Certificate Manager (ACM)
- Provision, deploy and manage TLS certificates
- Suports both private and public (free) TLS certificates


- TLS Certificate for in-flight encryption for websites (HTTPS)
- Integration with: Elastic Load Balancer, CloudFront, API Gateway (NOT with EC2)

#### How use public certificate:
ACM:
- You must define a list of domain names to be incluided in the certificate
- Select a validation method: email or DNS
- Once verificated, the public certificate will be enrolled for automatic renewal (each 60 days)

Imported:
- No automatic renewal, must import a new certificate before expiry
- ACM send expiration events to EventBridge to get notificated about import a new certificate

# AWS Web Application Firewall (WAF)
- Protects the webapp from web exploits at Layer 7 (HTTP)
- Deploy on: ALB, API Gateway, CloudFront, Cognito, AppSync GraphQL API
- Define Web ACL rules:
    - IP set
    - HTTP header, HTTP body or URI strings
    - Geo-match
    - Size constrains
    - Rate-based rules
- Web Acces Control list (Web ACL) are regional, except for CloudFront
- WebACL must be in the same region as ALB

# AWS Shield
- Protect from DDoS attack (Distribuited Denial of Service), many requests at the same time
- AWS Shield Standard (free): protection from attacks such as SYN/UDP floods and other layer 3/4 attacks
- AWS Shield Advanced (fee per organization): protection to EC2, ELB, CloudFront, Global Accelerator and Route 53. Acces to DDoS response team in case you get attack. Automatically creates, evaluates and deploy WAF rules to mitigate layer 7 attacks.

# AWS Firewall Manager
- Manage rules in all accounts of an Organization (WAF across accounts)
- Security policy (regional): set of security rules: WAF rules, Shield Advanced, security groups and Network Firewall, Route 53 resolver DNS Firewall 
