
# Cloud Formation
- You can use CloudFormation to treat your infrastructure as code. Since your infrastructure (your AWS resources) are created with code, you should manage it as code. 
- You define your AWS resources in a structured text format, either YAML or JSON, called a CloudFormation template. Manage resource scaling by sharing CloudFormation templates for use across your organization to meet safety, compliance, and configuration standards across all AWS accounts and Regions.
- Then you can create a CloudFormation stack in AWS, which contains the resources created. You can use CloudFormation to group your resources into stacks, using declarative templates
- StackSet: A named set of stacks that use the same template, but applied across different accounts and Regions. You can create, update, or delete stacks across multiple accounts and Regions with a single operation.
CloudFormation can also help you manage creating, updating, and deleting the resources within a stack

With CloudFormation, you can apply DevOps and GitOps best practices and trigger automated deployments with pipeline integrations such as GitHub Actions and AWS CodePipeline. CloudFormation to manage all of their AWS resources, with CI/CD pipelines creating the stacks from code

An issue to keep in mind, when you get to specific resources, is how the lifecycle of each resource is managed. For example, if a change to a resource requires replacing the resource, you should be more careful when using it while it is changing. 

Do not make changes to stack resources outside of CloudFormation. 