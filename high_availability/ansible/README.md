## Automating AWS Infrastructure with Ansible

#Post command
Provision Drupal setup.

ansible-playbook -i inventory/hosts playbooks/drupal-setup.yml -e "database_name=DBNAME database_username=USERNAME database_password=DBPASSWORD database_host=DBHOSTNAME efs_file_id=EFS_ID"
