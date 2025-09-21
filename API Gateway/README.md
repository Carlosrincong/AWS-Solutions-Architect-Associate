
# API Gateway

Create, publish, mantain, monitor and secure APIs at any scale
Serveless
It can be used along with any other service (EC2, lambda) to build backend for your application
REST API publicly accessible for clients
API gateway proxy requests to Backend (Lambda, ECS, HTTP endpoints, AWS services)
Handle security (Authentication and authorization)
Expose any service to the outside through API Gateway

### Endpoint Types:
- Edge-Optimized (default): for global clients. Traffic is routed through cloudfront to the region where lives the backend
- Regional: Clients in the same region
- Private: Accessed from within the VPC using an Interface Network 

### Security
- IAM Roles (internal users)
- Cognito (External users)
- Custom domain name HTTPS using Amazone Certificate Manager (ACM) and Route 53