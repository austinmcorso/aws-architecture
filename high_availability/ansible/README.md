## Automating AWS Infrastructure with Ansible

#Setup
Locate the key from your IAM account and export AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY

Review: http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html

i.e.

export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrKKJUtnFEMI/K7MDENG/bPxXfiDYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-east-1

#Post command
Provision Drupal setup.
ansible-playbook -i inventory/hosts playbooks/drupal-setup.yml -e "database_name=DBNAME database_username=USERNAME database_password=DBPASSWORD database_host=DBHOSTNAME efs_file_id=EFS_ID"

p
