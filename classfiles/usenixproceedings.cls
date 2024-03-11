\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classfiles/usenixproceedings}[Usenix proceedings document class.]

\LoadClass[letterpaper,twocolumn,10pt]{article}
\usepackage{classfiles/helper-usenix/usenix2019}

\usepackage{etoolbox}

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
        \g@addto@macro\@authortext{#2 @(#1)@}
    \else
        \g@addto@macro\@authortext{\and #2 @(#1)@}
    \fi
    \stepcounter{authorcounter}
}
\def\@addauthor#1{%
    \ifx\@empty\@authortext
        \g@addto@macro\@authortext{#1 @(1)@}
    \else
        \g@addto@macro\@authortext{\and #1 @(1)@}
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

% Reformat title
\let\oldtitle\title
\renewcommand{\title}[1]{\oldtitle{\Large \bf #1}}

% Disable unnecessary commands from llncs
\newcommand{\titlerunning}[1]{}
\newcommand{\authorrunning}[1]{}

% Bibliography settings
\bibliographystyle{plain}