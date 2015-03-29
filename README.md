# ECUST Bachelor's Thesis Template

##华东理工大学本科生毕业论文模板

根据《教务处本科生毕业论文格式规范（2006年版）》完成，包括

- 开题报告
- 文献翻译
- 论文

## 如何使用

### 准备

- Texlive（没有在其他平台进行测试）
- ctex等宏包
- xelatex进行编译
- adobefonts的四种中文字体（可修改为winfonts）
- 一些LaTeX的知识

### 下载

`git clone https://github.com/dagnaf/ecust-bachelor-thesis-template.git`

### 了解

- `ecustbachelorthesis.cls` 模板类文件，不需要修改
- `GBT7714-2005NLang-UTF8.bst` 参考文献格式，不需要修改
- `templates/thesis.tex` 论文文档
- `templates/opening.tex` 开题报告文档
- `templates/translation.tex` 文献翻译文档
- `templates/thesis.bib` 论文中的文献条目
- `templates/opening.bib` 开题报告中的文献条目
- `templates/translation.bib` 文献翻译中的文献条目
- `templates/*.png|*.jpg ...` 文档中使用的测试图片

### 撰写

根据使用文档，可以直接修改提供的`.tex`模板，注意论文的结构


同时需要注意到无法满足完全和Word格式一致，建议自行添加`\vspace{}`或者`\vspace*{}`

### 编译

建议使用[LaTeXtools][link11]

[link11]: https://github.com/SublimeText/LaTeXTools

### 文档

- [README][link3] 当前文件

- [说明1: thesis.pdf][link4] 使用说明扩展+示例

- [说明2: opening.pdf][link5] 示例

- [说明3: translation.pdf][link6] 示例

[link3]: https://raw.githubusercontent.com/dagnaf/ecust-bachelor-thesis-template/master/README.md

[link4]: https://github.com/dagnaf/ecust-bachelor-thesis-template/blob/master/thesis.pdf?raw=true

[link5]: https://github.com/dagnaf/ecust-bachelor-thesis-template/blob/master/opening.pdf?raw=true

[link6]: https://github.com/dagnaf/ecust-bachelor-thesis-template/blob/master/translation.pdf?raw=true

## 继续学习LaTeX以外，还能做什么

- [X] 完成未定义功能
 - [X] 图 `figure`
 - [X] 表 `table`
 - [X] 公式 `equation`
 - [X] 列表 `enumerate`
- [ ] 核对格式差错
- [ ] 完善代码中的`FIXME`
- [ ] 添加详细文档

## License

[GNU GPL v2.0][link2]

[link2]: https://raw.githubusercontent.com/dagnaf/ecust-bachelor-thesis-template/master/LICENS

