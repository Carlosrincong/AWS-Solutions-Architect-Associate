
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

# Credentials
- User name and password: You should define a password policy for all of your IAM users to enforce strong password
- MFA (Multi-factor authentication) is an additional layer of security for accessing AWS services.
- Access Keys (access key ID and a secret key):  to make programmatic calls to AWS using the AWS CLI or the AWS SDKs.

# IAM Policies
To manage access to identities (authentication) and provide permissions (authorization) to AWS services and resources.
permission over resources can comes with specific conditions if you want. Permissiones are assigned to **Principals** or **resources** to do **actions** over **resources** or by **users**. 
- If the identity-based policy allows a certain action but the resource-based policy does not, the result will be a deny.
- IAM user, role, or federated user is denied access by default, they must be explicitly allowed to perform an action
- If a permissions boundary, AWS Organizations SCP, or session policy is present, it might override the allow with an implicit deny.
- There are six types of IAM Policies:
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
Session policies limit the permissions that the role or user's identity-based policies grant to the session.
A session policy is an inline permissions policy that users pass in the session when they assume the role.
You can configure the identity broker to pass a session policy to reduce the scope of session permissions when users assume the role. 
When you pass session policies, the resulting  permissions are the intersection of the IAM entity's identity-based policy and the session policies

# Authorization model
#### Role-based access control
#### Attribute-based access control
Attribute-based access control (ABAC) is an authorization strategy that defines permissions based on attributes. In AWS, these attributes are called tags. Tags can be attached to IAM principals (users or roles) and to AWS resources.  ABAC is helpful in environments that are growing rapidly and helps with situations where policy management becomes cumbersome.
- Using ABAC for identity federation: User attributes can be passed as session tags using standards-based SAML. You can use attributes defined in external identity systems as part of attributes-based access control decisions within AWS. 

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
You can use IAM identity providers instead of creating IAM users in your AWS account. With an identity provider (IdP), you can manage your user identities outside AWS and give these external user identities permissions to use AWS resources in your account. IAM supports:
- IAM Identity Center: Single sing-on to AWS Accounts, including Security Assertion Markup Language 2.0 (SAML 2.0), Open ID Connect (OIDC), and OAuth 2.0.  IAM Identity Center makes it easy to centrally manage federated access to multiple AWS accounts and business applications and provide users with single sign-on access to all their assigned accounts and applications from one place.
- AWS Cognito: Access to web and mobile apps, such as Login with Amazon, Amazon Cognito, Facebook, Google, or any OpenID Connect-compatible identity provider.
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
#### NotPrincipal
lets you specify an exception to a list of principals. you can deny access to all principals except the one named in the NotPrincipal element. It is strongly recommend that you do not use NotPrincipal in the same policy statement as "Effect": "Allow". Doing so allows all principals except the one named in the NotPrincipal element access to your resources. By doing this, you might grant access to anonymous (unauthenticated) users.
- use NotPrincipal in the same policy statement as "Effect": "Deny"
#### NotAction
- Dont use NotAction in the same policy statement as "Effect": "Allow".
- You can use the NotAction element in a statement with "Effect": "Deny" to deny access to all of the listed resources except for the actions specified in the NotAction element. 
#### NotResource 
- Be careful using the NotResource element and "Effect": "Allow" in the same statement or in a different statement within a policy. 
- Using the NotResource element and "Effect": "Deny" in the same statement denies services and resources that are not explicitly listed in the policy.
- You should never use the NotResource element with the "Effect": "Allow" and "Action": "*" elements together. This statement is very dangerous because it allows all actions in AWS on all resources except the resource specified in the policy.
###  IAM policy simulator
- Test policies that are attached to IAM users, groups, or roles in your AWS account.
- Identify which specific statement in a policy results in allowing or denying access to a particular resource or action.
### Access History
- IAM provides last accessed information to help you identify unused permissions, refine your policies, and allow access to only the services and actions that your IAM entities use.
- There are two types: AWS service information and allowed action information. 

# AWS Security Token Service (AWS STS)
- Temporary security credentials are required when assuming an IAM role, and they work almost identically to the long-term access key credentials that your IAM users can use
- grant temporary access and limit access to users.
- Use case: federation identities, cross-account and roles for EC2


## ------------------

When you have an organization that spans multiple AWS accounts, you need to manage access to all the AWS accounts centrally via identity federation because users and groups are not scalable. 
