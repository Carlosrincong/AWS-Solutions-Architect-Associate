
# Amazon Cognito

Provide an Identity to users (**outside of the AWS Account**) to interacto whith the web or mobile application

Sub-services:
- Cognito User pool (CUP):
    - sing in functionality for app users
    - Integrate with Aplication Load Balancer and API Gateway
- Cognito Identity Pool (Federated Identity)
    - Temporary access to users who need directly access to AWS resources
    - Integrate with Cognito user pool as an Identity provider

### Cognito User pool (CUP)
- Create a serveless database of user for the app 
- User and pasword
- Password reset
- Email and Phone number verification
- MFA
- Federated identities: Facebook, Google, and son on

### Cognito Identity Pool (Federated Identity)
- Cognito user pool as an Identity provider or other 3rd party
- The IAM permissions applied to the credentials are defined in cognito
