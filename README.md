# lazy_ansible

`lazy_ansible` 是一個用來快速佈署 Kubernetes 環境的 Ansible 專案。

---

## 1) 快速開始（5 分鐘）

```bash
# 1. 安裝 uv（只需做一次）
sh ./install_uv.sh

# 2. 準備 SSH 金鑰
ssh-keygen -f ~/.ssh/id_ed25519

# 3. 編輯 inventory
vim inventory/hosts.yaml

# 4. 建立 Ansible Vault 密碼欄位，貼到 inventory
ansible-vault encrypt_string 'your_ssh_password' --name 'ansible_ssh_pass'
ansible-vault encrypt_string 'your_sudo_password' --name 'ansible_become_pass'

# 5. 執行 playbook
uv run ansible-playbook playbooks/build_k8s/build_k8s.yaml
```

---

## 2) 系統需求

- 可連線到目標主機（SSH）
- 目標主機可使用 `sudo`
- 本機可執行 `sh ./install_uv.sh`

---

## 3) 設定 inventory（最重要）

請修改 `inventory/hosts.yaml`，至少要確認：

- `ansible_host`：目標主機 IP
- `ansible_user`：SSH 使用者
- `ansible_port`：SSH 連接埠（通常 22）
- `ansible_ssh_private_key_file`（若使用私鑰登入）
- `ansible_ssh_pass`、`ansible_become_pass`（若使用密碼登入）

> 建議先以一台機器測試成功，再擴充到多台。

---

## 4) 建立 Ansible Vault 密碼

若你使用密碼登入或需要 sudo 密碼，請先建立加密字串：

```bash
ansible-vault encrypt_string 'your_ssh_password' --name 'ansible_ssh_pass'
ansible-vault encrypt_string 'your_sudo_password' --name 'ansible_become_pass'
```

你會得到類似以下輸出：

```yaml
ansible_ssh_pass: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
          xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

把整段內容貼進 `inventory/hosts.yaml` 對應欄位即可。

---

## 5) 執行方式

### 建議方式（使用 uv）

```bash
uv run ansible-playbook playbooks/build_k8s/build_k8s.yaml
```

### 傳統 venv 方式（備選）

```bash
source ./.venv/bin/activate
ansible-playbook playbooks/build_k8s/build_k8s.yaml
```

---

## 6) 常見問題

- **連線失敗（UNREACHABLE）**
  - 檢查 `ansible_host`、`ansible_port`、防火牆與 SSH 金鑰/密碼。
- **sudo 權限錯誤**
  - 確認 `ansible_become_pass` 是否正確。
- **Vault 相關錯誤**
  - 確認你貼入的是完整 `!vault` 區塊，且縮排未破壞。

---

## 7) 專案主要路徑

- `inventory/hosts.yaml`：主機清單與連線設定
- `playbooks/build_k8s/build_k8s.yaml`：主要執行 playbook
- `playbooks/build_k8s/vars/`：K8s 與系統相關變數範例
- `install_uv.sh`：安裝 uv 腳本

