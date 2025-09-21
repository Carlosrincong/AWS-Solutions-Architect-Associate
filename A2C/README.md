
# AWS App2Container

CLI tool for migrating and modernizing Java and .NET web apps into Docker containers
Migrate legacy apps
Deploy to ECS, EKS or App runner
Register Container images to ECR
Suports pre-built CI/CD pipelines

Step-by-Step:
1. app inventory and its deoendencies
2. Create an Image using the app and its dependencies
3. Create deployment artifact (Cloud formation)
4. Deploy to AWS: register on ECR and deplot to ECS, EKS or App runner