🛠️ Allen's Dotfiles (macOS M4 & Ubuntu)
========================================

這是一個針對  **Apple Silicon (M4)**  與  **Ubuntu**  虛擬機/伺服器環境優化的一鍵式開發環境配置。

🌟 核心特色
-------

-   **跨平台自動化**：`install.sh`  會自動偵測作業系統，切換 Homebrew (Mac) 或 APT (Ubuntu) 安裝邏輯。
    
-   **終端機美化**：整合  **Powerlevel10k**  與  **Nerd Fonts**，提供豐富的圖示與資訊顯示。
    
-   **高效工具整合**：內建  `lsd`  (圖示版 ls)、`htop`、`git`  等必備工具。
    
-   **Python 數據分析優化**：預設  `venv`  與  `pip3`  別名，適合 AI 資料分析與 TQC 練習。
    
-   **跨平台剪貼簿**：Vim 配置  **OSC 52**  協議，支援在 SSH 遠端環境下直接複製文字到本地。
    

---

🚀 完整安裝步驟
---------

不論是在全新的 Mac 還是 Ubuntu 上，請依照以下順序執行：

### 1\. 複製倉庫 (Clone)

首先，將此倉庫複製到你的家目錄下：

Bash

```
git clone https://github.com/viatorallen/Dotfiles.git ~/Dotfiles
cd ~/Dotfiles
```

### 2\. 執行自動化安裝

賦予腳本執行權限並啟動安裝（過程中可能需要輸入 sudo 密碼）：

Bash

```
chmod +x install.sh
./install.sh
```

**安裝內容包括：**

-   **macOS**: 自動安裝 Homebrew 並根據  `Brewfile`  安裝所有應用與字體。
    
-   **Ubuntu**: 更新 APT 並安裝  `packages.txt`  中的工具，手動下載 JetBrainsMono Nerd Font。
    
-   **通用**: 安裝 Oh My Zsh 及其插件（autosuggestions, syntax-highlighting, powerlevel10k）。
    

### 3\. 設定終端機字體 (關鍵)

安裝完成後，請務必在終端機設定中選取字體，否則圖示會無法正常顯示：

-   **iTerm2**:  `Profiles`  \>  `Text`  \>  `Font`  \> 選擇  **JetBrainsMono Nerd Font**。
    
-   **Ubuntu**:  `Preferences`  \>  `Profiles`  \>  `Text`  \> 勾選  **Custom font**  並選擇  **JetBrainsMono Nerd Font**。
    

---

⌨️ 常用快捷指令 (Aliases)
-------------------

|     |     |
| --- | --- |
| **指令** | **功能說明**  |
|-|-|
| `ls`  /  `ll` | 使用  `lsd`  顯示帶有圖示的檔案列表  |
| `venv` | 在當前目錄建立並啟動 Python 虛擬環境  |
| `py`  /  `pip` | 自動指向  `python3`  與  `pip3`  |
| `zconf` | 快速編輯  `.zshrc`  並在存檔後自動生效  |
| `vconf` | 快速編輯  `.vimrc`  設定  |
| `cls` | 清除螢幕 (Clear)  |

---

📂 檔案結構
-------

-   `install.sh`: 跨平台核心安裝腳本。
    
-   `.zshrc`: Zsh 配置，包含系統路徑偵測與插件載入。
    
-   `.vimrc`: Vim 編輯器設定（含絕對/相對行號、OSC 52 支援）。
    
-   `Brewfile`: macOS Homebrew 軟體清單。
    
-   `packages.txt`: Ubuntu APT 軟體清單。
    
-   `.gitignore`: 排除  `.DS_Store`  與 Python 暫存檔。
    

---

🔄 同步更新
-------

當你在 Mac 上修改了設定並想同步到 Ubuntu 時：

1.  **在 Mac 端推送**:
    
    Bash
    
    ```
    git add .
    git commit -m "Update configurations"
    git push origin main
    ```
    
2.  **在 Ubuntu 端拉取**:
    
    Bash
    
    ```
    cd ~/Dotfiles && git pull
    ```
    

---

**準備好開始了嗎？只需要 clone 並執行  `./install.sh`！**

---

### 如何更新到 GitHub？

1.  打開  `README.md`，貼上內容後存檔。
    
2.  執行指令：
    
    Bash
    
    ```
    git add README.md
    git commit -m "Fix: correct markdown formatting and links"
    git push origin main
    ```
