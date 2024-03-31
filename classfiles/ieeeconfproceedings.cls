\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classfiles/ieeeconfproceedings}[IEEE conference proceedings document class.]

\LoadClass[conference,compsoc]{IEEEtran}

\usepackage{etoolbox}

\ifCLASSOPTIONcompsoc
    \usepackage[nocompress]{cite}
\else
    \usepackage{cite}
\fi

%% Disable table of contents
\renewcommand{\tableofcontents}{}

% Disable date
\let\olddate\date
\renewcommand{\date}[1]{\olddate{}}

% Author settings
\let\oldauthor\author
\let\oldinstitute\institute

\makeatletter
\def\@authortext{}
\newcounter{authorcounter}
\newcounter{replcounter}
\newif\ifpatch
\DeclareRobustCommand\addauthor{\@ifnextchar[{\@@addauthor}{\@addauthor}}
\DeclareRobustCommand\addinstitute{\@ifnextchar[{\@@addinstitute}{\@addinstitute}}
\def\@@addauthor[#1]#2{%
    \ifx\@empty\@authortext
        \g@addto@macro\@authortext{\IEEEauthorblockN{#2} \IEEEauthorblockA{@(#1)@}}
    \else
        \g@addto@macro\@authortext{\and \IEEEauthorblockN{#2} \IEEEauthorblockA{@(#1)@}}
    \fi
    \stepcounter{authorcounter}
}
\def\@addauthor#1{%
    \ifx\@empty\@authortext
        \g@addto@macro\@authortext{\IEEEauthorblockN{#1} \IEEEauthorblockA{@(1)@}}
    \else
        \g@addto@macro\@authortext{\and \IEEEauthorblockN{#1} \IEEEauthorblockA{@(1)@}}
    \fi
    \stepcounter{authorcounter}
}
\def\@@addinstitute[#1]#2{%
    \setcounter{replcounter}{0}
    \loop\ifnum\value{replcounter}<\value{authorcounter}
        \patchcmd{\@authortext}{@(#1)@}{\\ #2}{}{}
        \stepcounter{replcounter}
    \repeat
}
\def\@addinstitute#1{%
    \setcounter{replcounter}{0}
    \loop\ifnum\value{replcounter}<\value{authorcounter}
        \patchcmd{\@authortext}{@(1)@}{\\ #1}{}{}
        \stepcounter{replcounter}
    \repeat
}
\oldauthor{\@authortext}

\makeatother

% Disable unnecessary commands from llncs
\newcommand{\titlerunning}[1]{}
\newcommand{\authorrunning}[1]{}

% Bibliography settings
\bibliographystyle{IEEEtran}

% AMS Theorem Environments

\newtheorem{theorem}{Theorem}[section]
\newtheorem{corollary}{Corollary}[theorem]
\newtheorem{lemma}[theorem]{Lemma} 
\newtheorem{definition}{Definition}[section]