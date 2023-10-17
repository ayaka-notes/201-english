\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style}[shui 自定义文档模板]

%基本设置

\LoadClass[UTF8,
oneside,
%openright,
zihao=-4,]{ctexbook}
%其中winfonts解决某些不常用字无法正确显示的问题，其中openright与twoside的效果一样
%Linux下默认使用的字体有些生僻字无法正常显示


%\usepackage[paperwidth=14.54cm,paperheight=23.26cm,top=12mm,bottom=9mm,right=3mm,left=3mm]{geometry}%页面大小，华为M6平板专用


%纸张规格
%开本：787mm×1092mm 1/16
%成品尺寸：184mm×260mm

\usepackage[
paperwidth=185mm,paperheight=260mm,
textheight=218mm,
textwidth=144mm,
%top=2cm,bottom=2.8cm,right=1.8cm,left=1.8cm
]{geometry}%页面设置

\usepackage{ulem}%下划线
\normalem %紧接 ulem 宏包， ulem 重定义\emph 命令，复原
\usepackage{svg}%下划线
\usepackage{bbding}%五角星图形
\usepackage{tikz}
\usepackage{graphicx}
%\usepackage{subfigure}该宏包过期，不推荐使用
\usepackage{caption} %caption 和 subcaption设置标题，提供图片表格并排 
\usepackage{subcaption} %caption 和 subcaption设置标题，提供图片表格并排 
\usepackage{xeCJKfntef}%添加下划线，利用此可以可以实现空白下划线跨行
\usepackage{xcolor}%颜色相关

%罗马数字大小写
\newcommand{\lmx}[1]{\expandafter{\romannumeral #1\relax}}%罗马数字小写
\newcommand{\lmd}[1]{\uppercase\expandafter{\romannumeral #1\relax}}%罗马数字大写


%断词断字设置
\hyphenpenalty=1000 %最大值1,0000，完全阻止断词（hyphenation）
\exhyphenpenalty=1000 %最大值1,0000，完全阻止断词（hyphenation）
\tolerance=550 %最大值1,0000，调整换行比例，间接影响断词，越大换行多断词少，太大影响整体换行效果，不美观
%\hyphenation{data-bases Windows}%设置断词方式，若没有断字符号，则不断，Windows就会永远连在一起打印
%可以使用命令 \- 在单词中间，指示系统这里是一个可以断词的位置。设置后如果不需要断词则不会产生连字符。




%题干正文间距
\newcommand{\TiGanSpace}{ \vspace{1em} } %题干，与正文的间距



% 英文字体配置部分
\setmainfont{Times New Roman}
%\setCJKmainfont[BoldFont=boldFontName, ItalicFont=italicFontName]{mainFontName}
%\setsansfont{}
%\setmonofont{}


% 中文字体配置部分
%\setCJKmainfont{宋体}%正文字体
%\setCJKmainfont[BoldFont={方正小标宋_GBK}, ItalicFont={方正楷体_GBK}, BoldItalicFont={方正仿宋_GBK}]{宋体}%正文字体
%\setCJKsansfont{黑体}%无衬线字体
%\setCJKmonofont{楷体}%等宽字体
%\setCJKfamilyfont{boldsong}{Source Han Serif SC Heavy}

%超链接
\RequirePackage[draft=false,colorlinks=true,CJKbookmarks=true,linkcolor=blue,citecolor=green,urlcolor=red,hyperindex]{hyperref}


%选择题列表
\usepackage{enumitem}
\setlist[enumerate]{
	%label=\bfseries\arabic*.,
	itemsep=0em,
}

%句子选择
\newlist{listmatch}{enumerate}{3}
\setlist[listmatch]{
	label=\Alph*.,
	itemsep=0em,
}

%作文
\newlist{listwrite}{enumerate}{3}
\setlist[listwrite]{
	label=\arabic*)~,
	itemsep=0em,
	leftmargin=3.5em,
}

%页眉
\RequirePackage{fancyhdr} %页眉排版相关
\fancyhf{}
%\fancyhead[OR]{\textnormal{\kaishu\leftmark}}
%\fancyhead[OL]{--\ \thepage\ --}
%\fancyhead[EL]{\textnormal{\kaishu\leftmark}}
%\fancyhead[ER]{--\ \thepage\ --}
\renewcommand{\headrulewidth}{0pt}% Header rule of .4pt
\fancyfoot[C]{\small\leftmark--\thepage}%页码位置：偶数页居左，奇数页居右
\pagestyle{fancy}

\fancypagestyle{mychapter}{%
	\fancyhf{}% Clear header/footer
    \vspace*{1.3cm}% 调整距离纸张最上方边距，可以根据需要调整1cm的值
	\fancyhead[L]{{\zihao{5}\heiti 绝密 \raisebox{-.3em}{\FiveStar}   启用前}}% Author on Odd page, Centred
	%\fancyhead[E]{\protect\Headereven}% Title on Even page, Centred
	%\fancyfoot[C]{\thepage}%
	\renewcommand{\headrulewidth}{0pt}% Header rule of .4pt
}


%标题样式
\usepackage{titlesec}
\titleformat{\chapter}[hang]{\bfseries\vspace{-2cm}\centering}{\filcenter}{1pt}{%
  \bfseries\Large}[]


%标题格式格式
\ctexset{
	chapter ={
		%format = \centering \heiti \LARGE,
        pagestyle = mychapter,
		name = {,},
		number = {},
		aftername = {},
	}
}
\ctexset{
	section ={
		%format = \centering \heiti \LARGE,
		% pagestyle = empty,
		name = {Section \ , \quad  },
		number = {\Roman{section}},
		aftername = {},
	}
}
\ctexset{
	subsection ={
		format = \centering  \large \bfseries,
		% pagestyle = empty,
		name = {,},
		number = {},
		aftername = {},
	}
}

%答案关键词
%\usepackage{keyval}
%\define@key{mylineread}{answer}{#1}
%\define@key{mylineread}{test}{#1}
%\newcommand{\keytest}[1][]{\setkeys{mylineread}{#1}}
%\keytest[answer=B]

%注意下面的\hspace 和 \hbox 其中\hspace在行首失效，\hbox 行首有效
%两者交叉运用，恰好抵消若填空出现在行首产生的0.3em缩进，完美！
%另外，后面的%号不能少，不让其后产生额外空格，不然有时会有标点符号单独在行的开始的尴尬局面
\newcommand{\lineread}[1][]{
	\hspace{-0.3em}\uline{\hbox to 15mm{\hfill\setkeys{mylineread}{#1}\hfill}}%
}

\newcommand{\linefill}{%
\refstepcounter{enumi}(\theenumi)\CJKunderline*[hidden=true]{瞻彼阕者\mbox{虚室}}%使用\mbox保证换行后最少两个字符的间距
}

%
%
%完型填空
%
\newcounter{counterwanxin}[enumi]
\newcommand{\cloze}{%
\refstepcounter{counterwanxin}\uline{\phantom{a~~}\arabic{counterwanxin}\phantom{~~a}}~}%使用\phantom 防止在行首时出现空白消失 

    
%翻译顺序
\newcounter{countertrans}[enumi]
\newcommand{\transnum}{%
\refstepcounter{enumi}(\theenumi)~
}



%新行间距
\newcommand{\newlinespread}[2]
{
{\linespread{#1}\selectfont            %1.5倍行距
#2
\par}
}



%将页面计数器与章节计数器关联起来
%\makeatletter
%\@addtoreset{page}{chapter}
%\makeatother

%选择题
%四个选项的处理
\usepackage{xstring,xifthen}
\newlength{\choicelengtha}
\newlength{\choicelengthb}
\newlength{\choicelengthc}
\newlength{\choicelengthd}
\newlength{\choicelengthe}
\newlength{\maxlength}
\newcommand{\fourchoices}[4]
{
	\settowidth{\choicelengtha}{A.~#1~}
	\settowidth{\choicelengthb}{B.~#2~}
	\settowidth{\choicelengthc}{C.~#3~}
	\settowidth{\choicelengthd}{D.~#4~}
	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\choicelengthd>\maxlength}}{\setlength{\maxlength}{\choicelengthd}}{}
	\ifthenelse{\lengthtest{\maxlength>0.49\linewidth}}%万事留一线(防止意外)
	{
		\par
		\noindent
		\parbox[t]%
		{1.5em}{\hfill A.}\hskip0.2em%
		\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
			#1\strut}%
		\\
		\parbox[t]%
		{1.5em}{\hfill B.}\hskip0.2em%
		\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
			#2\strut}%
		\\
		\parbox[t]%
		{1.5em}{\hfill C.}\hskip0.2em%
		\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
			#3\strut}%
		\\
		\parbox[t]%
		{1.5em}{\hfill D.}\hskip0.2em%
		\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
			#4\strut}%
		%\vspace{\parskip}
		\par
	}
	{
		\ifthenelse{\lengthtest{\maxlength>0.24\linewidth}}%万事留一线(防止意外)
		{
			\par
			\noindent
			\parbox[t]%
			{1.5em}{\hfill A.}\hskip0.2em%
			\parbox[t]{0.5\linewidth-1.7em}{\raggedright%
				#1}\hfill%
			\parbox[t]%
			{1.5em}{\hfill B.}\hskip0.2em%
			\parbox[t]{0.5\linewidth-1.7em}{\raggedright%
				#2}
			\\
			\parbox[t]%
			{1.5em}{\hfill C.}\hskip0.2em%
			\parbox[t]{0.5\linewidth-1.7em}{\raggedright%
				#3}\hfill%
			\parbox[t]%
			{1.5em}{\hfill D.}\hskip0.2em%
			\parbox[t]{0.5\linewidth-1.7em}{\strut\raggedright%
				#4\strut}
			%\vspace{\parskip} %这里，当有四个的时候自动会有parskip空行，原因未知
			\par
		}
		{
			\par
			\noindent
			\parbox[t]%
			{1.5em}{\hfill A.}\hskip0.2em%
			\parbox[t]{0.25\linewidth-1.7em}{\raggedright%
				#1}\hfill%
			\parbox[t]%
			{1.5em}{\hfill B.}\hskip0.2em%
			\parbox[t]{0.25\linewidth-1.7em}{\raggedright%
				#2}\hfill%
			\parbox[t]%
			{1.5em}{\hfill C.}\hskip0.2em%
			\parbox[t]{0.25\linewidth-1.7em}{\raggedright%
				#3}\hfill%
			\parbox[t]%
			{1.5em}{\hfill D.}\hskip0.2em%
			\parbox[t]{0.25\linewidth-1.7em}{\strut\raggedright%
				#4\strut}
			%\vspace{\parskip} %这里，当有四个的时候自动会有parskip空行，原因未知
			\par
		}
	}
}


\newcommand{\bta}[1]{
\setcounter{page}{1}%设置页面计数器
\chapter{#1年全国硕士研究生招生考试}
%\markboth{#1年考研英语}{#1年考研英语}
\markboth{#1}{#1}
\vspace{-1em}
\section*{英语}
\noindent
\begin{center}
	\zihao{4}	(科目代码：201)
\end{center}
%
\begin{center}
	\begin{tikzpicture}[shift={(-2.5cm ,0.3cm)},
		remember picture,overlay]
		\node at (0,0) {试~卷~条~形~码};
		\draw [draw=black,dashed] (-1.7,-0.8) rectangle (1.7,0.8);
	\end{tikzpicture}
	\zihao{4}\heiti	\raisebox{-.3em}{\FiveStarOpen}  考生注意事项 \raisebox{-.3em}{\FiveStarOpen}
\end{center}
%
\vspace{1.3cm}
\begin{minipage}[h!]{0.94\linewidth}
	\begin{enumerate}[leftmargin=4em]
		%\renewcommand{\labelenumi}{\arabic{enumi}.}
		% A(\Alph) a(\alph) I(\Roman) i(\roman) 1(\arabic)
		%设定全局标号series=example	%引用全局变量resume=example
		%[topsep=-0.3em,parsep=-0.3em,itemsep=-0.3em,partopsep=-0.3em]
		%可使用leftmargin调整列表环境左边的空白长度 [leftmargin=0em]
		\item
		答题前,考生须在试题册指定位置上填写考生编号和考生姓名;在答题卡指
		定位置上填写报考单位、考生姓名和考生编号,并涂写考生编号信息点。
		\item
		考生须把试题册上的“试卷条形码”粘贴条取下,粘贴在答题卡的“试卷条
		形码粘贴位置”框中。不按规定粘贴条形码而影响评卷结果的,责任由考生
		自负。

		\item
		选择题的答案必须涂写在答题卡相应题号的选项上,非选择题的答案必须书
		写在答题卡指定位置的边框区域内。超出答题区域书写的答案无效;在草稿
		纸、试题册上答题无效。
		\item
		填(书)写部分必须使用黑色字迹签字笔书写,字迹工整、笔迹清楚;涂写
		部分必须使用2B铅笔填涂。
		\item
		考试结束,将答题卡和试题册按规定交回。




	\end{enumerate}
\end{minipage}
\\
\vspace{1.2cm}
\begin{center}
	(以下信息考生必须认真填写)
	\begin{table}[h!]
	\zihao{5}
		\centering
		\begin{tabular}{|c|c|c|c|c|c|c|c|c|c|c|c|c|c|c|c|}
			\hline
			考生编号 & \hspace{0.5em} & \hspace{0.5em} & \hspace{0.5em} &  \hspace{0.5em} & \hspace{0.5em} &  \hspace{0.5em} & \hspace{0.5em} & \hspace{0.5em} & \hspace{0.5em} & \hspace{0.5em} & \hspace{0.5em} & \hspace{0.5em} & \hspace{0.5em} & \hspace{0.5em} &\hspace{0.5em} \\
			\hline
			考生姓名&\multicolumn{15}{c|}{}\\
			\hline
		\end{tabular}
	\end{table}
\end{center}
\newpage
}

