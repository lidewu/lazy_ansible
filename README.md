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



### Ansible Command 
   ```bash
   # exec ansible playbook
   uv run ansible-playbook playbooks/build_k8s/build_k8s.yaml  
   ```
