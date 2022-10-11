% Classe para formatação de prova com logo do IFRS
% 
% (c) Roger W. P. da Silva
%
%% This program can be redistributed and/or modified under the terms
%% of the LaTeX Project Public License Distributed from CTAN archives
%% in directory macros/latex/base/lppl.txt.
% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{provaifrs}
  [2022/02/10 v0.1 Plano de ensino IFRS]


\ProcessOptions\relax
\LoadClass[12pt]{article}
\RequirePackage[a4paper,left=2cm,right=2cm,top=4cm,bottom=2cm,headheight=2.7cm,footskip=1cm]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{fancyhdr}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[default]{opensans}
\RequirePackage[brazil]{babel}
\RequirePackage{mdframed}
\RequirePackage{titlesec}
\RequirePackage{booktabs}
\RequirePackage{colortbl}
\RequirePackage{xltabular}
\RequirePackage{hhline}
\RequirePackage{tikzpagenodes}
\RequirePackage{background}
\usetikzlibrary{backgrounds,fit}
\RequirePackage{framed}
\RequirePackage{enumitem}
\RequirePackage{verbatim}
\RequirePackage{multicol}
\RequirePackage{arev}

\RequirePackage{etoolbox}
\AtEndPreamble{%
  \pagecolor{background}
  \color{foreground}
}

% Comandos para preencer os campos de identificação
\newcommand{\instituto}[1]{\def\insertinstitute{#1}}
\newcommand{\disciplina}[1]{\def\insertsubject{#1}}
\newcommand{\curso}[1]{\def\insertcourse{#1}}
\newcommand{\etapa}[1]{\def\insertstage{#1}}
\newcommand{\periodo}[1]{\def\insertperiod{#1}}
\newcommand{\professor}[1]{\def\insertteacher{#1}}
\newcommand{\email}[1]{\def\insertemail{#1}}
\newcommand{\contato}[1]{\def\insertaddress{#1}}
\newcommand{\peso}[1]{\def\insertmaxgrade{#1}}


\def\missing{\leavevmode\color{red}\bfseries \#FALTANDO!}
\let\insertinstitute\missing
\let\insertsubject\missing
\let\insertcourse\missing
\let\insertstage\missing
\let\insertperiod\missing
\let\insertteacher\missing
\let\insertmaxgrade\missing
\let\insertemail\missing

% Nomes dos campos
\def\ifrsident{Informações}
\def\ifrssubject{Disciplina}
\def\ifrscourse{Curso}
\def\ifrsstage{Etapa}
\def\ifrsperiod{Semestre}
\def\ifrsstudent{Nome}
\def\ifrsregistr{Matrícula}
\def\ifrsdate{Data}
\def\ifrsteacher{Professor}
\def\ifrsgrade{Nota}
\def\ifrsemail{E-mail}

% Cores para o logo
\definecolor{primary}{RGB}{50,160,65}
\definecolor{secondary}{RGB}{200,25,30}
\definecolor{foreground}{RGB}{0,0,0}
\definecolor{background}{RGB}{255,255,255}

% Logo do IFRS
\newcommand{\logo}{%
  \begin{tikzpicture}
    \tikzstyle{quad} = [rectangle,fill=primary,rounded corners=0.4mm,minimum width=4mm,minimum height=4mm]
    \tikzstyle{circ} = [circle,fill=secondary,minimum size=4.4mm]

    \node[circ]       at (6mm,20.4mm) {};
    \node[quad] (esq) at (6mm,15.6mm) {};
    \node[quad]       at (6mm,10.8mm) {};
    \node[quad]       at (6mm,6mm) {};

    \node[quad] (cimo)  at (10.8mm,20.4mm) {};
    \node[quad]         at (10.8mm,15.6mm) {};
    \node[quad]         at (10.8mm,10.8mm) {};
    \node[quad] (baixo) at (10.8mm,6mm) {};

    \node[quad] at (15.6mm,20.4mm) {};
    \node[quad] at (15.6mm,10.8mm) {};
    
    \ifx\insertinstitute\empty
        \node[anchor=south west,inner sep=0mm,font=\fontsize{5.7mm}{6mm}\selectfont\bf,text=foreground] (IF) at (20.6mm,8.65mm) {\hspace{-0.6mm}INSTITUTO FEDERAL};
        \node[anchor=south west,inner sep=0mm,font=\fontsize{4.275mm}{4.5mm}\selectfont,text=foreground] at (20.6mm,2.6mm) {\hspace{-0.5mm}\strut Rio Grande do Sul};
        \node (nome) at (20.6mm,2.6mm) {};
    \else
        \node[anchor=south west,inner sep=0mm,font=\fontsize{5.7mm}{6mm}\selectfont\bf,text=foreground] (IF) at (20.6mm,13.45mm) {\hspace{-0.6mm}INSTITUTO FEDERAL};
        \node[anchor=south west,inner sep=0mm,font=\fontsize{4.275mm}{4.5mm}\selectfont,text=foreground] at (20.6mm,8.65mm) {\hspace{-0.5mm}Rio Grande do Sul};
        \node[anchor=south west,inner sep=0mm,font=\fontsize{4.275mm}{4.5mm}\selectfont,text=foreground] (nome) at (20.6mm,2.6mm) {\hspace{-0.5mm}\strut\insertinstitute};
    \fi
    \begin{scope}[on background layer]
    \node[fill=background,fit=(esq)(cimo)(baixo)(IF)(nome),inner sep=2.4mm] {};
    \end{scope}
  \end{tikzpicture}%
}

% Estilo da página
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0.5pt}
\fancyhf{}
\fancyhead[R]{\insertsubject\\\insertstage --- \insertperiod}
\fancyhead[L]{\logo}
\fancyfoot[R]{\thepage}
\fancyfoot[L]{\insertcourse}
\pagestyle{fancy}

% Marcas nas margens
\newcounter{ifrswatermarkcounter}
\newlength{\ifrswatermarklen}
\newcommand{\marca}[1]{%
  \def\insertwatermark{#1}
  \ifx\insertwatermark\empty
  \else
    \def\insertwatermark{}
    \settowidth{\ifrswatermarklen}{\MakeUppercase{#1~$\cdot$~}}
    \setcounter{ifrswatermarkcounter}{\numexpr \paperheight / \ifrswatermarklen \relax}
    \makeatletter
    \loop \ifnum\value{ifrswatermarkcounter}>-2
      \g@addto@macro\insertwatermark{\MakeUppercase{#1~$\cdot$~}}
      \addtocounter{ifrswatermarkcounter}{-1} 
    \repeat
    \makeatother
  \fi
}
\marca{}
\backgroundsetup%
{   angle=0,
    opacity=.5,
    scale=1,
    contents=%
    {   \begin{tikzpicture}[remember picture,overlay, scale=3]
            \node[text=primary, rotate=-90, above=0.75cm] at (current page text area.east) {\insertwatermark}; 
            \node[text=primary, rotate=90, above=0.75cm] at (current page text area.west) {\insertwatermark};         
        \end{tikzpicture}
    }
}

% Título
\renewcommand{\maketitle}{%
\begin{center}
\Large\bfseries\color{primary}\MakeUppercase{\@title}
\end{center}
\begin{tabela}[frametitle={\ifrsident}]
  \begin{tabularx}{\textwidth}{l|X|l|X}
    \arrayrulecolor{background}\hline\arrayrulecolor{primary}
    \cabecalho{\ifrsstudent} & \multicolumn{3}{l}{~}\\
    \hhline{~|-|-|-}
    \cabecalho{\ifrsregistr} & ~ & \cabecalho{\ifrsdate} & \hphantom{00}~/~\hphantom{00}~/~\the\year\\
    \hhline{~|-|~|-}
    \cabecalho{\ifrsteacher} & \insertteacher & \cabecalho{\ifrsgrade} & \hspace{3em}~/~\insertmaxgrade\\
    \hhline{~|-|-|-}
    \cabecalho{\ifrsemail} & \multicolumn{3}{l}{\insertemail}
  \end{tabularx}
\end{tabela}
}

\titleformat{\section}[block]{\color{primary}\bfseries}{}{1em}{\centering\large\MakeUppercase}
\titlespacing*{\section}{0pt}{2em}{1em}

% Caixas e tabelas
\newcommand{\cabecalho}[1]{\cellcolor{primary}\leavevmode\color{background}\textbf{#1}}
\setlength{\parindent}{0pt}
\setlength{\tabcolsep}{1em}
\arrayrulecolor{primary}\renewcommand{\arraystretch}{1.5}
\setlength\arrayrulewidth{1pt}
\setlength\LTpre{0pt}

\mdfdefinestyle{caixa}{
  linecolor=primary,
  linewidth=1pt,
  innerlinecolor=background,
  font=\color{foreground},
  backgroundcolor=background,
  everyline=true,
  frametitlealignment=\center,
  frametitlefont=\color{background}\bfseries\MakeUppercase,
  frametitleaboveskip=0.5em,
  frametitlebelowskip=0.5em,
  frametitlebackgroundcolor=primary,
  frametitlerule=true,
  frametitlerulecolor=background,
  splittopskip=2ex,
  startinnercode=\addtocounter{section}{1}, % pq parece que o mdframed cria a
  endinnercode=\addtocounter{section}{-1}   % save box antes do frametitle
}
\newmdenv[style=caixa]{caixa}
\newmdenv[
  style=caixa,
  innerleftmargin=0,
  innerrightmargin=0,
  innertopmargin=0,
  innerbottommargin=0,
  splittopskip=0pt,
  splitbottomskip=0pt,
  everyline=false
]{tabela}


\columnseprule=0.5pt
\def\twodigits#1{%
\ifnum#1<10 0\fi 
\number#1}
\setlist[enumerate,1]{leftmargin=*,label={\protect\twodigits{\theenumi}.},ref={\protect\twodigits{\theenumi}}}
\setlist[enumerate,2]{label={(\makebox[1.25ex][c]{\alph*})}}
\columnsep=0.5cm
\AtBeginDocument{\setlist[enumerate]{leftmargin=*}}

\newlength{\questskip}
\questskip=0pt

\newcounter{questao}
\newenvironment{questoes}%
{\begin{enumerate}\questskip=1em\relax\setcounter{enumi}{\thequestao}}%
{\end{enumerate}\setcounter{questao}{\theenumi}\questskip=0pt}

\makeatletter
\newenvironment{snippet}%
{\framed\relax\@totalleftmargin=0pt\endgraf\verbatim}%
{\endverbatim\vspace*{-\questskip}\endframed}
\renewcommand{\verbatim@font}{\ttfamily}
\AtBeginEnvironment{snippet}{\topsep=0pt \partopsep=0pt }
\makeatother

\newcounter{linha}
\newcommand{\pauta}[1]{%
  \setcounter{linha}{0}%
  \loop%
  \\\hspace*{-\leftmargin}\rule[-1ex]{\columnwidth}{0.5pt}%
  \rule[-1ex]{0pt}{1.5\baselineskip}
  \stepcounter{linha}%
  \ifnum\value{linha}<#1%
  \repeat%
}

\endinput
%%
%% End of file `planoifrs.sty'.
