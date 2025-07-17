
# AWS root user
Single sign-in identity that has complete access to all AWS services and resources in the AWS account

Credentials associated with it: 
1. Email address and password (Console)
2. Access keys (AWS CLI & AWS SDK). Consist of two parts: Access key ID & Secret access key

https://aws.amazon.com/iam/features/mfa/
https://docs.aws.amazon.com/accounts/latest/reference/root-user-tasks.html
https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html
https://docs.aws.amazon.com/en_us/IAM/latest/UserGuide/id.html

Best practice:
- Activate MFA, Strogn password, Disable or delete the access keys associated with the root user, create IAM users for other tasks. 
- Create an IAM admin user once the AWS Root user has been created, and use this admin user instead of root user.
- Least privilege is a standard security principle that advises you to grant only the necessary permissions to do a particular job and nothing more.

# IAM 

AWS Identity and Access Management (IAM) is an AWS service that helps you manage access to your AWS account and resources.

# IAM Policies
To manage access to identities (authentication) and provide permissions (authorization) to AWS services and resources.
permission over resources can comes with specific conditions if you want. Permissiones are assigned to **Principals** or **resources** to do **actions** over **resources** or by **users**. 
- If the identity-based policy allows a certain action but the resource-based policy does not, the result will be a deny.
- IAM user, role, or federated user is denied access by default, they must be explicitly allowed to perform an action
- If a permissions boundary, AWS Organizations SCP, or session policy is present, it might override the allow with an implicit deny.

There are six types of IAM Policies:
## Grants
### IAM Policies (Identity-based)
Identity-based policies are managed and inline policies attached to IAM identities (users, groups to which users belong, or roles).
### Resource-based policies
Resource-based policies grant permissions to the principal that is specified in the policy; hence, the principal policy element is required. 
### ACLs
ACLs are **cross-account** permissions policies that grant permissions to the specified principal. ACLs cannot grant permissions to entities within the same account.

## Guardrails
### Permissions boundary
This sets the maximum permissions that an identity-based policy can grant to an IAM entity. 
### AWS Organizations SCPS
SCPs specify the maximum permissions for an account, or a group of accounts, called an organizational unit (OU). 
#### Session policy
Session policies limit the permissions that the role or user's identity-based policies grant to the session

# Principal
As a best practice, do not use your root user credentials for your daily work. Instead, create IAM entities (users and roles). You can also support federated users or programmatic access to allow an application to access your AWS account.

#### AWS Account
When you use an AWS account identifier as the principal in a policy, you delegate authority to the account.
#### IAM User
An IAM user represents a person or service that interacts with AWS. You define the user in your AWS account. Any activity done by that user is billed to your account. When you create a user, that user can sign in to gain access to the AWS resources inside your account. When you create a user, you can provide them with credentials for Console of AWS CLI/AWS SDK

- BP: You can group IAM users and attach permissions at the group level.
- consider managing employee identity information through an identity provider (IdP). Using an IdP, whether it's with an AWS service such as AWS IAM Identity Center (successor to AWS Single Sign-On) or a third-party identity provider, provides a single source of truth for all identities in your organization. Now You can use IAM roles to provide permissions to identities that are federated from your IdP
- credentials (console, AWS CLI & AWS SDK) associated to.
#### Federated User
You can use IAM identity providers instead of creating IAM users in your AWS account. With an identity provider (IdP), you can manage your user identities outside AWS and give these external user identities permissions to use AWS resources in your account. IAM supports SAML-based IdPs and web identity providers, such as Login with Amazon, Amazon Cognito, Facebook, or Google. 
#### IAM Role
IAM role is an indentiy that can be assumed by someone (external identity provider, AWS account) or something (AWS Servie) who needs temporary access to AWS Credential to perform an API call in an AWS account. 
External identity provider can be manage with AWS IAM Identity Center. 
Each IAM role comes with an ARN: Amazon Resource Name
#### AWS Service
IAM roles that can be assumed by an AWS service are called service roles.
#### IAM Groups
An IAM group is a collection of users. All users in the group inherit the permissions assigned to the group. 
1. Groups can have many users.
2. Users can belong to many groups.
3. Groups cannot belong to groups.


## Permissions policies 
This is a collection of permissions, mostly managed by AWS or created by users.

## ------------------

When you have an organization that spans multiple AWS accounts, you need to manage access to all the AWS accounts centrally via identity federation because users and groups are not scalable. 

# Credentials
- User name and password: You should define a password policy for all of your IAM users to enforce strong password
- MFA (Multi-factor authentication) is an additional layer of security for accessing AWS services.
- Access Keys (access key ID and a secret key):  to make programmatic calls to AWS using the AWS CLI or the AWS SDKs.