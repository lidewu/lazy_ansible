# lazy_ansible
---

## **How_to_ use**


### System Requirements
  - Run ./install_uv.sh

  ```bash
   sh ./install_uv.sh
 ``` 
  - Generate SSH Key for login

  ```bash
  ssh-keygen -f ~/.ssh/id_ed25519
  ```

### Ansible Setting
  -**Modify invendtory/hosts.yaml** as you want, like ansible_host: 192.168.1.30


### Create Ansible Vault
   - Create ansible_ssh_pass & ansible_become_pass
     -- modfiy 'my_secure_password' to your password
   ```bash
     ansible-vault encrypt_string 'my_secure_password' --name 'ansible_ssh_pass' --ask-vault-pass
  ```
   - After you got this:
  ```bash
      ansible_ssh_pass: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          31363332336261656531363339613765343535383465333736363235313164316539316234303166
          6638333064396538336330363363346265616665383232390a303033306137373436636164313034
          39633866346661383136616466623661383663616566376662346231666331346534303463363034
          6565316662326230350a343261376334626536376239393234656362616534343062323831326638
          3663
  ```
   - Copy & Paste to hosts.yaml

   - Create .vault_pass.yaml
   ```bash
     vim .vault_pass.yaml
   ```
     Then enter the vault-pass
   

### Ansible Command 
  ## UV
   ```bash
   # exec ansible playbook
   uv run ansible-playbook playbooks/build_k8s/build_k8s.yaml  
   ```
  ## Enter .venv
    source ./venv/bin/active
    ansible-playbook playbooks/build_k8s/build_k8s.yaml

