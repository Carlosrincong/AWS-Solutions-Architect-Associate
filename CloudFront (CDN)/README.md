
# CloudFront (CDN)

Improves read performance (lower latency) because content is cached at the edge of the AWS network in the Points of presence (POP)
Uses the golbal edge network
Files are cached for a ttl

Origin
Origin is where the content lives: S3, ELB, API Gateway, VPC and other
Use VPC endpoints to deliver traffic to private: EC2 Instance, NLB or ALB
Use a Public ALB to deliver traffic to you private backend instances.

Security
- You can use a Web Application Firewall (WAF) to add a security layer to CDN
- Geo restriction: Allow users to access to you content if they are in the list of approved countries using allow list or block list

Pricing
- the cost of data out per edge location varies based on location
- reduce the number of edge location for cost reduction, there are 3 classes: all, 200 and 100. 

Features
- Cache invalidations: the cached content will be refreshed when the TTL expire. Use Cache invalidation to force expiration of TTL 