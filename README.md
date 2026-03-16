# 复旦大学本科学位论文 Typst 模板

[![Typst](https://img.shields.io/badge/Typst-0.14.2-blue)](https://typst.app/) [![License](https://img.shields.io/badge/License-AGPL--3.0-green)](LICENSE)

这是一个基于 [Typst](https://typst.app/) 构建的复旦大学本科学位论文模板。

## 🚀 快速上手

### 1. 安装环境
确保您的系统中已安装 [Typst CLI](https://github.com/typst/typst) 或使用 VS Code 配合 [Tinymist TypstPreview](https://open-vsx.org/vscode/item?itemName=myriad-dreamin.tinymist) 插件。

### 2. 配置信息

打开 `config.typ`，修改您的论文题目、姓名、学号及导师信息：
```typst
#let title = "您的论文题目"
#let author = "您的姓名"
// ... 更多配置
```

### 3. 开始撰写
在 `chapters/` 目录下创建 `.typ` 文件，并在 `main.typ` 中按需包含：
```typst
#for chapter_id in range(1, 4) {
  include "chapters/" + numbering("01", chapter_id) + ".typ"
}
```

### 4. 预览与编译
```bash
typst watch main.typ    # 开启实时预览
typst compile main.typ  # 生成 PDF 文档
```

## 🛠 Project Roadmap (Todo)

- [ ] 图、表格式
- [ ] 中英文摘要
- [ ] 致谢

## 🤝 贡献与反馈

如果您在使用过程中发现任何格式偏差或功能建议，欢迎提交 Issue 或 Pull Request。

## 📄 开源协议

本项目采用 [AGPL-3.0 License](LICENSE) 协议开源。
