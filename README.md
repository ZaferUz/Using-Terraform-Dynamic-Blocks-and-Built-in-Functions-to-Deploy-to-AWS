# Using-Terraform-Dynamic-Blocks-and-Built-in-Functions-to-Deploy-to-AWS


## Review and Deploy the Terraform Code
1. As a best practice, format the code in preparation for deployment:
```
terraform fmt
```
2. Initialize the working directory and download the required providers:
```
terraform init
```
3. Validate the code to look for any errors in syntax, parameters, or attributes within Terraform resources that may prevent it from deploying correctly:
```
terraform validate
```
# You should receive a notification that the configuration is valid.

4. Review the actions that will be performed when you deploy the Terraform code:
```
terraform plan
```
5. Note the Change to Outputs, where you can see the Time-Date and Web-Server-URL outputs that were configured in the outputs.tf file earlier.

6. Deploy the code:
```
terraform apply --auto-approve
```
## Test Out the Deployment and Clean Up
1. Once the code has executed successfully, view the outputs at the end of the completion message:

- The Time-Date output displays the timestamp when the code was executed.
- The Web-Server-URL output displays the web address for the Apache webserver we created during deployment.
Note: You could also use the terraform output command at any time in the CLI to view these outputs on demand.

2. Verify that the resources were created correctly in the AWS Management Console:

- Navigate to the AWS Management Console in your browser.
- Type VPC in the search bar and select VPC from the contextual menu.
- On the Resources by Region page, click VPCs.
- Verify that the my-vpc resource appears in the list.
- Type EC2 in the search bar and select EC2 from the contextual menu.
- On the Resources page, click Instances (running).
- Verify that the instance, which has no name, appears in the list (and is likely still initializing).
- In the menu on the left, click Security Groups.
- Verify that the Terraform-Dynamic-SG security group appears in the list.
- Select the security group to see further details.
- Click on the Inbound rules tab, and note that three separate rules were created from the single dynamic block used on the ```ingress``` parameter in the code.

3.In the CLI, copy the URL displayed as the ```Web-Server_URL``` output value.

4.In a new browser window or tab, paste the URL and press Enter.

5. Verify that the Apache Test Page loads, validating that the code executed correctly and the logic within the AWS instance in Terraform worked correctly, as it was able to locate the ```script.sh``` file in the folder and bootstrap the EC2 instance accordingly.

6. In the CLI, tear down the infrastructure you just created before moving on:
```
terraform destroy --auto-approve
```
