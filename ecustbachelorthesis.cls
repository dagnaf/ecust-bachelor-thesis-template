% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
% 华东理工大学本科生毕业论文模板
% 该模板不是官方模板，包含了论文、开题报告和文献翻译，没有自带封面。
% 根据《教务处本科生毕业论文格式规范（2006年版）》等文件（由计算机科学与
% 工程系下发）中提到的格式完成，不保证完全一致。
%
% github.com/dagnaf
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ecustbachelorthesis}[2015/02/10]

% 默认字体11小四、A4、adobe字体（可选）
\LoadClass[cs4size, a4paper, adobefonts]{ctexrep}
% 改掉目录中的第x章的形式
\CTEXsetup[name={,\ },number={\arabic{chapter}}]{chapter}
% 英文字体默认设置
\setmainfont{Times New Roman}
% 请在主文件中renewcommand以下两个
\newcommand{\thesistype}{}
\newcommand{\thesistitle}{}
% 边距基本与word格式一样
\usepackage[left=2.5cm, right=2.5cm, top=2.8cm, bottom=2.5cm,headheight=15pt, headsep=0.3cm, footskip=0.5cm]{geometry}
% 引用的格式：上标、方括号、序号
\usepackage[super,square,numbers]{natbib}
% copy from ecustenglishminormajor
%\hyperlinkcite takes 2 arguments: #1<- cite-key, #2<- link-text
%\newcommand*{\citec}[1]{\hyper@link{cite}{cite.#1}}
%\renewcommand\citep[1]{(\citeauthor{#1}, \citeyear{#1})}
%\renewcommand\citet[1]{\citeauthor{#1} (\citeyear{#1})}
%\newcommand\citepzh[2]{(\citec{#1}{#2}, \citeyear{#1})}
%\newcommand\citetzh[2]{\citec{#1}{#2} (\citeyear{#1})}
% 脚注格式，必须在setspace前
\usepackage[hang,flushmargin]{footmisc}
% 设置行距，必须在hyperref前
\usepackage{setspace}
% 超链接
\usepackage[hidelinks,bookmarksnumbered,hypertexnames=false]{hyperref}
% 脚注回链
\usepackage{footnotebackref}
% 长表、多行
\usepackage{longtable}
\usepackage{multirow}
% 图像、图标说明
\usepackage{graphicx}
\usepackage{ccaption}
\captiondelim{\ }
\captionnamefont{\songti\bfseries\zihao{-5}}
\captiontitlefont{\songti\bfseries\zihao{-5}}
\renewcommand{\thefigure}{\arabic{chapter}--\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
% 页眉页脚
\usepackage{fancyhdr}
\fancypagestyle{plain}{
  \fancyhead[L]{
    \zihao{5}{\thesistitle\thesistype}
  }
  \fancyhead[R]{\zihao{-5}{\thepage}}
  \fancyfoot[C]{}
  \renewcommand{\headrulewidth}{0.75pt}
}
\fancypagestyle{head}{
  \fancyhead[L]{}
  \fancyhead[R]{}
  \fancyfoot[C]{\zihao{-5}{\thepage{}}}
  \renewcommand{\headrulewidth}{0pt}
}
\pagestyle{plain}
% 设置目录中各级标题格式
\usepackage{titletoc}
\contentsmargin{0cm}

\titlecontents{chapter}
[0cm]% left margin
{}% above code
{\heiti\zihao{4}\thecontentslabel}% numbered format
{\heiti\zihao{4}\thecontentslabel}% unnumbered format
%{\titlerule*[0.5pc]{.}\zihao{5}{\thecontentspage}\vspace{0pt}}
{\titlerule*[0.5pc]{.}\zihao{5}{\thecontentspage}\vspace{0pt}}

\titlecontents{section}
[0em]
{}
{\heiti\zihao{-4}\thecontentslabel\ }
{}
{\titlerule*[0.5pc]{.}\zihao{5}{\thecontentspage}\vspace{-1pt}}

% 设置正文中各级标题格式，段前段后距离无法与Word中一样，用环境弥补
% FIXME 最好生成pdf后手动添加vspace才能保证完全一致
\usepackage{titlesec}
%titleformat{cmd:section}[fmt:see]{fmt:title}{label}{sep}{before}[after]
\titleformat{\chapter}{\centering\heiti\zihao{-2}}{\thechapter}{0.5em}{}
%\titlespacing{cmd}{left}{before-sep}{after-sep}[right-sep]
\titlespacing*{\chapter}{0pt}{-18pt}{16pt}%FIXME
\titleformat{\section}{\songti\zihao{4}}{\thesection}{0.5em}{}
\titlespacing*{\section}{0pt}{0pt}{16pt}%FIXME
\titleformat{\subsection}{\bfseries\zihao{-4}}{\thesubsection}{0.5em}{}
\titlespacing*{\subsection}{0pt}{0pt}{15pt}%FIXME
%\CTEXsetup[beforeskip={12pt},afterskip={12pt}]{section}
%\CTEXsetup[beforeskip={12pt},afterskip={0pt}]{subsection}
%\CTEXsetup[beforeskip={12pt},afterskip={0pt}]{subsubsection}



%\renewcommand\tableofcontents{%
%    {\centering\heiti\zihao{-2}{\contentsname\\}}\vspace{12pt}
%        \@mkboth{%
%           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
%    \@starttoc{toc}%
%    }
% 设置目录页的页脚
\newcommand{\mktableofcontents}{
  \clearpage
  %\pagenumbering{Roman}
  \pagestyle{head}
  \pdfbookmark[0]{\contentsname}{contents}
  \tableofcontents
  \thispagestyle{head}
  \clearpage
  \pagenumbering{arabic}
}

\usepackage{ifthen}


% 重定义参考文献环境（由于list是内部定义），编号全部靠左，中间空2pt的空格后加上参考内容
% 如果内容超过一行第二行缩进2字符，借用参考文献格式
% 参考文献使用的是section，添加到目录和书签中
% 如果在论文中则没有章节编号，在开题报告中有章节编号
% FIXME 空格的长度是否是2pt
\renewcommand{\@biblabel}[1]{[#1]\hfill}
\def\refname{参考文献}
\renewenvironment{thebibliography}[1]{
  \ifthenelse{\equal{\thesistype}{}}{
    \clearpage\phantomsection
    \addcontentsline{toc}{chapter}{\refname}
    \chapter*{\refname}%
  }{
    \chapter{\refname}%
  }
  \vspace{-12pt}
  \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
  \list{\@biblabel{\@arabic\c@enumiv}}{
    \setlength\itemsep{0pt}
    \setlength{\parsep}{0pt}
    \setlength{\labelsep}{2pt}% FIXME
    \setlength\labelwidth{0pt}
    \setlength{\itemindent}{\dimexpr\labelsep-2em}
    \leftmargin 2em
    \@openbib@code
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}
  }%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m}{
    \def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}
  \endlist}

\bibliographystyle{./GBT7714-2005NLang-UTF8}
%\bibliographystyle{plain}

% 致谢页面，在论文中使用，无章节编号
\newcommand{\acknowledgment}{
  \def\ackname{致谢}
  \clearpage\phantomsection
  \addcontentsline{toc}{chapter}{\ackname}
  \chapter*{\ackname}
}




% 论文的摘要，分中文摘要和英文摘要，新定义环境zh和en
% FIXME 中英文大部分格式是统一的，用命令调用会更容易维护
\newenvironment{abstractzh}[1]{
  \def\keywordszh{#1}
  \clearpage\phantomsection
  \addcontentsline{toc}{chapter}{摘要}
  \pagenumbering{Roman}
  \thispagestyle{head}
  \vspace*{84pt}
  {\centering\heiti\zihao{-2} 摘要\par}
  \vspace*{17pt}\par
  \setstretch{1.1}
  \songti\zihao{-4}
}{
  \vspace*{8pt}\par
  {\heiti\zihao{-4} 关键词：}
  {\songti\zihao{-4} \keywordszh}
}
\newenvironment{abstracten}[1]{
  \def\keywordsen{#1}
  \clearpage\phantomsection
  \addcontentsline{toc}{chapter}{Abstract}
  % \pagenumbering{roman}
  \thispagestyle{head}
  \vspace*{84pt}
  % \pdfbookmark[1]{Abstract}{abstracten}
  {\centering\bfseries\zihao{-2} Abstract\par}
  \vspace*{17pt}\par
  \setstretch{1.1}
  \zihao{-4}
}{
  \vspace*{8pt}\par
  {\bfseries\zihao{-4} Keywords:}
  {\zihao{-4} \keywordsen}
}


\newcommand{\docinit}{
%  \nocite{*}
%  \setlength{\belowdisplayskip}{0pt}
%  \setlength{\belowdisplayshortskip}{0pt}
%  \setlength{\abovedisplayskip}{0pt}
%  \setlength{\abovedisplayshortskip}{0pt}
%  \setlength{\abovecaptionskip}{5pt}%
%  \setlength{\belowcaptionskip}{5pt}%
%  \setlength{\intextsep}{5pt}
}

% \newenvironment{text}{}{\vspace{12pt}}

% \def\CTEX@contentsname{目录}
% \def\CTEX@listfigurename{插图}
% \def\CTEX@listtablename{表格}
%
% \def\CTEX@figurename{图}
% \def\CTEX@tablename{表}
%
% \def\CTEX@abstractname{摘要}
% \def\CTEX@indexname{索引}
% \def\CTEX@bibname{参考文献}

% 目录中只要显示到二级标题
\setcounter{tocdepth}{1}
% FIXME 为了尽量和Word格式保持一样，添加标题和文本的距离
\newenvironment{sectext}{\vspace{-9pt}}{\vspace{13pt}}
\newenvironment{subtext}{\vspace{-14pt}}{\vspace{13pt}}
\newenvironment{chatext}{\vspace{-12pt}}{\vspace{13pt}}

% 开题报告、文献翻译的章节不需要换页
\usepackage{etoolbox}
\newcommand{\updatecmd}{
\ifthenelse{\equal{\thesistype}{}}{}{
  \patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{\par}{}{}
  \titlespacing*{\chapter}{0pt}{-4pt}{16pt}%FIXME
}}

% 行距近似于Word中的1.25
\renewcommand{\baselinestretch}{1.35}
% 设置文献翻译和开题报告中的标题和摘要等
\newcommand{\mktitle}[2]{{\vspace*{-17pt}\centering\heiti{\bfseries\zihao{-2}{#1}\\}{\vspace{6pt}\zihao{4}{#2}\\}}}
\newcommand{\mkabstract}[2]{{\vspace{6pt}{\setstretch{1.1}\noindent\heiti{摘要：}\songti #1\\\heiti{关键词：}\songti #2\par}}\vspace{13pt}}
% 四级标题用枚举
\usepackage{enumitem}
\newenvironment{itemlist}{
  \begin{enumerate}[parsep= 0pt,partopsep=0pt,topsep=0pt,itemsep=0pt,
leftmargin=3.9em,labelsep=0cm,label={（\arabic*）}]
}{
  \end{enumerate}
}
% 设置脚注的行距和数字和文字的距离
%\setlength{\skip\footins}{28pt}
\setlength{\footnotesep}{14pt}
\let\oldfootnote\footnote
\renewcommand\footnote[1]{%
\oldfootnote{\hspace{3pt}#1}}
