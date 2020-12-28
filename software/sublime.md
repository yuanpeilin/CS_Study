# 安装
```sh
# Install the GPG key:
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

# Ensure apt is set up to work with https sources:
sudo apt-get install apt-transport-https

# Update apt sources and install Sublime Text
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
```

# 配置
* Perference -> Settings  
    ```
    "font_face": "ubuntu mono",
    "font_size": 14,
    "show_encoding": true,
    "show_line_endings": true,
    "translate_tabs_to_spaces": true,
    "tab_size": 4,
    ```
* Preferences -> Key Blinding  
    ```
    { "keys": ["ctrl+shift+f"], "command": "reindent" },
    { "keys": ["alt+c"], "command": "markdown_preview", "args": {"target": "browser", "parser":"github"} },
    { "keys": ["ctrl+d"], "command": "run_macro_file", "args": {"file": "res://Packages/Default/Delete Line.sublime-macro"} },
    ```

# 插件
Ctrl+Shift+P -> Install Package
* ConvertToUTF8
* Markdown Preview
