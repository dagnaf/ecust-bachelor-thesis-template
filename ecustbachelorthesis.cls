% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% 
% 华东理工大学本科生毕业论文模板
% 该模板不是官方模板，包含了论文、开题报告和文献翻译，没有自带封面。
% 根据《教务处本科生毕业论文格式规范（2006年版）》等文件（由计算机科学与
% 工程系下发）中提到的格式完成。
%
% ECUST Bachelor's Thesis Template
% This UNOFFICIAL class provides templates for thesis, opening
% report and literature translation without covers based on
% the requirement documents from School of Computer Science
% and Technology.
%
% github.com/dagnaf
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ecustbachelorthesis}[2014/12/30]

% 全文默认小四字体大小，A4
% FIXME adobefonts和winfonts下宋体表现不一致
\LoadClass[cs4size,a4paper,adobefonts]{ctexart}

% 加载个人信息和论文信息，必须填写
\AtEndOfClass{\input{information.cfg}}

% 选择文档类型：开题报告/文献翻译/论文，默认为论文
\newif\ifopening\openingfalse
\newif\iftranslation\translationfalse
\newif\ifthesis\thesistrue
\DeclareOption{opening}{\openingtrue\translationfalse\thesisfalse}
\DeclareOption{translation}{\openingfalse\translationtrue\thesisfalse}
\DeclareOption{thesis}{\openingfalse\translationfalse\thesistrue}
\DeclareOption*{}
\ProcessOptions\relax

% 定义页面边距，页眉页脚距离
% FIXME 与word排版还是有所不同，页脚是否安全
\usepackage[
  left=2.5cm,right=2.5cm,top=2.8cm,bottom=2.5cm,
  headheight=15pt,headsep=0.3cm,footskip=0.5cm% FIXME
]{geometry}

% 使用pdf链接包，选项无边框，书签带编号
\usepackage[hidelinks,bookmarksnumbered]{hyperref}

% 目录深度到二级目录，即1.1为止
% FIXME ctexart默认为2?
\setcounter{tocdepth}{2}

% 使用页眉页脚包，定义body用于正文页和head用于摘要和目录页，默认为body
\usepackage{fancyhdr}
\fancypagestyle{body}{
  \fancyhead[L]{
    \songti\zihao{5}{
      \me@title
      \iftranslation （文献翻译）
      \else\ifopening （开题报告）
      \else\relax
        \fi
      \fi
    }
  }
  \fancyhead[R]{\thepage}
  \fancyfoot[C]{}
  \renewcommand{\headrulewidth}{0.75pt}
}
\fancypagestyle{head}{
  \fancyhead[L]{}
  \fancyhead[R]{}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
}
\pagestyle{body}


% 开题报告/文献翻译中的论文标题，默认参数为cfg文件中的标题
\newcommand{\makethesistitle}[1][\me@title]{
  {\centering\heiti\bfseries\zihao{-2} #1\par}
}
% 开题报告中的个人信息，也可用于文献翻译中作者信息，默认参数为个人信息
\newcommand{\makemyinfo}[1][\me@class （\me@number ）\me@name]{
  {\centering\heiti\zihao{4} #1\par}
}

% 开题报告的摘要，重定义系统环境。
% 可以传参数，参数为关键词。默认参数为配置文件中定义的关键词
\renewenvironment{abstract}[1][\me@keywordszh]{
  \def\env@abstract@param{#1}
  \pdfbookmark[1]{\abstractname}{abstract}
  {\noindent\heiti\zihao{-4} 摘要：}
  \songti\zihao{-4}
}{
  \par
  {\noindent\heiti\zihao{-4} 关键词：}
  {\songti\zihao{-4} \env@abstract@param\par}
}

% 论文的摘要，分中文摘要和英文摘要，新定义环境zh和en
% FIXME 中英文大部分格式是统一的，用命令调用会更容易维护
\newenvironment{abstractzh}{
  \clearpage
  \thispagestyle{head}
  \vspace*{90pt}
  \pdfbookmark[1]{\abstractname}{abstractzh}
  {\centering\heiti\zihao{-2} 摘要\par}
  \vspace*{12pt}\par
  \songti\zihao{-4}
}{
  \vspace*{12pt}\par
  {\heiti\zihao{-4} 关键词：}
  {\songti\zihao{-4} \me@keywordszh}
}
\newenvironment{abstracten}{
  \clearpage
  \thispagestyle{head}
  \vspace*{90pt}
  \pdfbookmark[1]{Abstract}{abstracten}
  {\centering\bfseries\zihao{-2} Abstract\par}
  \vspace*{12pt}\par
  \zihao{-4}
}{
  \vspace*{12pt}\par
  {\bfseries\zihao{-4} Keywords:}
  {\zihao{-4} \me@keywordsen}
}

% 设置文档中英文默认字体
% FIXME 与adobefonts冲突？
\setmainfont{Times New Roman}
%\setCJKmainfont{SimSun}

% 使用标题小节包，设置小节标题字体，小节前距离和小节后距离
% FIXME 如果使用titleformat，sec和subsec在一起时会有两倍的距离，而使用CTEX则不会
\usepackage{titlesec}
\titleformat{\section}{\centering\heiti\zihao{-2}}{\thesection}{1em}{}
%\titlespacing{\section}{0pt}{12pt}{0pt}%FIXME
\titleformat{\subsection}{\songti\zihao{4}}{\thesubsection}{1em}{}
%\titlespacing{\subsection}{0pt}{12pt}{0pt}%FIXME
\titleformat{\subsubsection}{\heiti\zihao{-4}}{\thesubsubsection}{1em}{}
%\titlespacing{\subsubsection}{0pt}{12pt}{0pt}%FIXME
\CTEXsetup[beforeskip={12pt},afterskip={12pt}]{section}
\CTEXsetup[beforeskip={12pt},afterskip={0pt}]{subsection}
\CTEXsetup[beforeskip={12pt},afterskip={0pt}]{subsubsection}

% 在论文中小节前分页，而在文献翻译和开题报告中不需要
\ifthesis
  \let\oldsection\section
  \renewcommand\section{\clearpage\oldsection}
\fi 

% 换页创建目录，添加书签
\newcommand{\mktableofcontents}{
  \clearpage
  \thispagestyle{head}
  \pdfbookmark[1]{\contentsname}{contents}
  \tableofcontents
}

% 使用目录图片/表列表包，设置目录样式
\usepackage{tocloft}
\renewcommand{\cftdotsep}{1}
\cftsetpnumwidth{10pt}
\renewcommand{\cfttoctitlefont}{\hfill\heiti\zihao{-2}}
\renewcommand{\cftaftertoctitle}{\hfill}
\setlength{\cftaftertoctitleskip}{12pt}
\renewcommand{\cftsecfont}{\heiti\zihao{4}}
\renewcommand{\cftsubsecfont}{\heiti\zihao{-4}}
\renewcommand{\cftsecpagefont}{\zihao{-4}}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftsubsecindent}{0pt}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

% 使用自定义标注包，设置图片、表、公式的标注
% 添加图像包、数学公式排版包
\usepackage{ccaption}
\usepackage{graphicx}
\captiondelim{\ }
\captionnamefont{\songti\bfseries\zihao{-5}}
\captiontitlefont{\songti\bfseries\zihao{-5}}
\usepackage[fleqn]{amsmath}
\numberwithin{figure}{section}
\numberwithin{equation}{section}
\numberwithin{table}{section}
\renewcommand{\theequation}{\arabic{section}-\arabic{equation}}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{section}.\arabic{table}}

% 重定义参考文献环境（由于list是内部定义），编号全部靠左，中间空2pt的空格后加上参考内容
% 如果内容超过一行第二行缩进2字符，借用参考文献格式
% 参考文献使用的是section，添加到目录和书签中
% 如果在论文中则没有章节编号，在开题报告中有章节编号
% FIXME 空格的长度是否是2pt
\renewcommand{\@biblabel}[1]{[#1]\hfill}
\renewenvironment{thebibliography}[1]{
  \ifthesis
    \clearpage\phantomsection
    \addcontentsline{toc}{section}{\refname}
    \section*{\refname}%
  \else
    \section{\refname}
  \fi
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
    {\@latex@warning{Empty `thebibliography' environment}}%
  \endlist}
\bibliographystyle{./gbt7714-2005}

% 致谢页面，在论文中使用，无章节编号
\newcommand{\acknowledgement}{
  \def\ackname{致谢}
  \clearpage\phantomsection
  \addcontentsline{toc}{section}{\ackname}
  \section*{\ackname}
}

% 设置行距
% FIXME 行距是否设定正确
\renewcommand{\baselinestretch}{1.3}

\newcommand{\docinit}{
  \setlength{\belowdisplayskip}{0pt}
  \setlength{\belowdisplayshortskip}{0pt}
  \setlength{\abovedisplayskip}{0pt} 
  \setlength{\abovedisplayshortskip}{0pt}
  \setlength{\abovecaptionskip}{5pt}%
  \setlength{\belowcaptionskip}{5pt}%
  \setlength{\intextsep}{5pt}
}

% 列表
\usepackage{enumitem}
\newenvironment{itemlist}{
  \begin{enumerate}[parsep= 0pt,partopsep=0pt,topsep=0pt,itemsep=0pt,
leftmargin=4em,labelsep=0cm,label={（\arabic*）}]
}{
  \end{enumerate}
}
