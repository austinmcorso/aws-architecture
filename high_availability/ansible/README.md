## Automating AWS Infrastructure with Ansible

#Setup
Locate the key from your IAM account and export ```AWS_ACCESS_KEY_ID``` and ```AWS_SECRET_ACCESS_KEY```

Review: http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html

i.e.
```bash
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrKKJUtnFEMI/K7MDENG/bPxXfiDYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-east-1
```

During terraform apply we're using ansible-pull to provision our ELK stack, Jenkins, Selenium Hub

Github repo for ansible-pull https://github.com/chaunceyt/ansible-playbooks

#Post command
Provision Drupal setup.
```
ansible-playbook -i inventory/hosts playbooks/drupal-setup.yml -e "database_name=DBNAME database_username=USERNAME database_password=DBPASSWORD database_host=DBHOSTNAME efs_file_id=EFS_ID"
```

