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
在 `chapters/` 目录下按序号创建 `.typ` 文件，并在 `main.typ` 中按需包含：
```typst
#for chapter_id in range(1, 4) {
  include "chapters/" + numbering("01", chapter_id) + ".typ"
}
```

参考文献使用的 BibLaTex 文件保存在 [`reference.bib`](reference.bib) 中。

### 4. 预览与编译

```bash
typst watch main.typ    # 开启实时预览
typst compile main.typ  # 生成 PDF 文档
```

## 关于参考文献

为了更好的渲染效果（如对预印本进行更精准的分类等），建议您从 BibTex 或 BibLaTex 迁移至 [Hayagriva](https://github.com/typst/hayagriva) 的 yaml 格式引用。您可参考以下方式进行切换：

1. 参照[这里](https://rust-lang.org/tools/install/)的教程安装 Rust
2. 在终端中运行 `cargo install hayagriva --features cli` 安装 Hayagriva CLI
3. 在终端中运行 `hayagriva reference.bib > reference.yaml` 以转换引用格式
4. 修改 [`bibliography.typ`](bibliography.typ) 中的 `reference.bib` 文件名为转换后的文件名

此外，[GB/T 7714-2025](https://publishmedia.cbpt.cnki.net/portal/minio/webs/hbxy/media/web/2026/01/20/GBT%207714%E2%80%942025%20%E4%BF%A1%E6%81%AF%E4%B8%8E%E6%96%87%E7%8C%AE%20%E5%8F%82%E8%80%83%E6%96%87%E7%8C%AE%E8%91%97%E5%BD%95%E8%A7%84%E5%88%99.pdf) 将于 2026 年 7 月 1 日代替现行的 GB/T 7714-2015 参考文献著录规则[^1]。在 Typst 官方支持该标准前，您可前往[可用于 Hayagriva 的 CSL 样式](https://typst-doc-cn.github.io/csl-sanitizer/)下载您需要的 CSL 样式，并修改 [`bibliography.typ`](bibliography.typ) 中的 `style` 参数为该 CSL 文件的路径，以应用该参考文献著录规则。比如，若您下载的 CSL 样式名为 `gb-7714-2025-numeric.csl` ，并保存在模板项目根目录下，并使用 `reference.yaml` 作为引用文件，修改后的 `bibliography.typ` 内容可以是：

```typst
#import "utils.typ": font_size, font_type

#pagebreak(weak: true)

#bibliography(
  "reference.yml",
  title: "参考文献",
  style: "gb-7714-2025-numeric.csl",
)
```

## 🤝 贡献与反馈

如果您在使用过程中发现任何格式偏差或功能建议，欢迎提交 Issue 或 Pull Request。

## 📄 开源协议

本项目采用 [AGPL-3.0 License](LICENSE) 协议开源。

[^1]: [信息与文献 参考文献著录规则](https://std.samr.gov.cn/gb/search/gbDetailed?id=4507EFE13D37CB6AE06397BE0A0A601F)