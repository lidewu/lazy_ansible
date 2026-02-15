# Optimization Notes for `lazy_ansible`

## 已完成的優化（本次分支）

1. **提升 Playbook 冪等性（Idempotency）**
   - `swapoff -a` 改為只有在主機有啟用 swap 時才執行，避免每次都顯示 changed。
   - `sysctl --system` 標記 `changed_when: false`，避免在僅重新套用設定時造成誤判。

2. **改善可維護性**
   - 將裸 module 名稱（`stat`、`replace`）改為 `ansible.builtin.*`，降低名稱衝突風險。
   - 修正文案 typo：`cloud_config rmoeve` -> `cloud_config remove`。

3. **移除硬編碼主機 IP**
   - `K8S_FQDN` 寫入 `/etc/hosts` 的 IP 來源由固定清單改為 inventory (`groups['all']`)。
   - 主機擴縮容時不用同步修改 playbook，降低操作成本。

4. **YAML 布林一致性**
   - `become: yes` 改為 `become: true`，風格一致且更清楚。

## 後續建議優化（尚未在本次提交實作）

1. **將 restart 類任務改為 handler 驅動**
   - 像 `containerd`、`chrony`、`kubelet` 的重啟可透過 `notify` 觸發，只在設定變動時重啟。

2. **APT key 管理現代化**
   - `apt_key` 逐步被弱化，建議改為 `get_url` + `signed-by` keyring 檔案流程。

3. **導入 lint 與 CI**
   - 新增 `ansible-lint`、`yamllint` 以及 pre-commit，可提早發現語法/風格問題。

4. **拆分角色（roles）**
   - 將 containerd、kernel/sysctl、k8s packages、hosts 管理拆成 roles，讓重用與測試更容易。
