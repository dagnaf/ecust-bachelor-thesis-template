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

- `information.cfg` 填写论文标题、个人信息、中英文摘要和关键词
- `ecustbachelorthesis.cls` 模板类文件
- `thesis.tex` 论文文档，可以在上面直接修改套用
- `opening.tex` 开题报告文档
- `translation.tex` 文献翻译文档
- `thesis.bib` 论文中的文献条目
- `opening.bib` 开题报告中的文献条目
- `translation.bib` 文献翻译中的文献条目
- `gbt7714-2005.bst` 参考文献格式，GitHub仓库: [GBT7714-2005-BibTeX-Style][link1]
- `*.png *.jpg ...` 文档中使用的测试图片

[link1]: https://github.com/Haixing-Hu/GBT7714-2005-BibTeX-Style

### 撰写

根据使用文档，可以直接修改提供的`.tex`模板，注意论文的结构

### 编译

编译前在`Makefile`中确认源文件名。

下列命令分别生成pdf文件

- `make thesis` 
- `make translation`
- `make opening`  或者
- `make all`

或者直接输入命令

```
xelatex filename.tex
bibtex filename.aux
xelatex filename.tex
xelatex filename.tex
```

### 文档

- [README][link3] 当前文件

- [说明1: thesis.pdf][link4] 使用说明扩展+示例

- [说明2: opening.pdf][link5] 示例

- [说明3: translation.pdf][link6] 示例

[link3]: https://raw.githubusercontent.com/dagnaf/ecust-bachelor-thesis-template/master/README.md

[link4]: https://raw.githubusercontent.com/dagnaf/ecust-bachelor-thesis-template/master/thesis.pdf

[link5]: https://raw.githubusercontent.com/dagnaf/ecust-bachelor-thesis-template/master/opening.pdf

[link6]: https://raw.githubusercontent.com/dagnaf/ecust-bachelor-thesis-template/master/translation.pdf

## 继续学习LaTeX以外，还能做什么

- [ ] 完成未定义功能
 - [ ] 图 `figure`
 - [ ] 表 `table`
 - [ ] 公式 `equation`
 - [ ] 列表 `enumerate`
- [ ] 核对格式差错
- [ ] 完善代码中的`FIXME`

## License

[GNU GPL v2.0][link2]

[link2]: https://raw.githubusercontent.com/dagnaf/ecust-bachelor-thesis-template/master/LICENS

## 相关项目

* May 14, 2013 [ecustthesis][link7] by [raychenfj][link8]
* June 16, 2013 [ecustthesis][link9] by [scottoasis][link10]

[link7]: https://github.com/raychenfj/ecustthesis
[link8]: https://github.com/raychenfj
[link9]: https://github.com/raychenfj
[link10]: https://github.com/scottoasis

