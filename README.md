# lazy_ansible

## How to use

 ```bash
   # exec ./install_uv,sh
   sh ./install_uv.sh

   #logout

   # modify inventory/hosts.yaml as you want, like ansible_host: 192.168.1.30
 
   # exec ansible
   uv run ansible-playbook playbooks/build_k8s/build_k8s.yaml  

 ```
