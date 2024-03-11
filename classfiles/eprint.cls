\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classfiles/eprint}[IACR ePrint document class.]

\LoadClass{llncs}

\def\pageMarginSize{1.1in}
\usepackage[margin=\pageMarginSize]{geometry} 
\pagestyle{plain}

\usepackage[T1]{fontenc}

\usepackage{url}
\usepackage[
    bookmarksdepth=2,
    colorlinks=true,
    linkcolor=blue,
    urlcolor=blue,
    citecolor=blue,
    pdfauthor={Anonymous}
    pagebackref,
    linktocpage=true,
]{hyperref}

\usepackage{xcolor}

\setlength\parindent{16pt}

%% Table of contents package and settings
\usepackage[titles]{tocloft}
\setlength\cftbeforesecskip{8pt}
\setcounter{tocdepth}{2}
\makeatletter
\renewcommand*\l@author[2]{}
\renewcommand*\l@title[2]{}
\makeatletter
\usepackage{etoolbox}
\patchcmd{\tableofcontents}{\@starttoc}{\vspace{-2.5\baselineskip}\@starttoc}{}{}
\renewcommand{\contentsname}{\raggedright Contents}
\renewcommand{\cftsecfont}{\normalfont\bfseries}% titles in bold
\renewcommand{\cftsecpagefont}{\normalfont\bfseries}% page numbers in bold
\renewcommand{\cftdotsep}{1}
\renewcommand{\cftsecleader}{\bfseries\cftdotfill{\cftsecdotsep}}% dot leaders in bold

\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{{\hypersetup{linkcolor=black}\small \oldtableofcontents}\clearpage}

% Author settings
\let\oldauthor\author
\let\oldinstitute\institute

\makeatletter
\def\@authortext{}
\def\@institutetext{}
\DeclareRobustCommand\addauthor{\@ifnextchar[{\@@addauthor}{\@addauthor}}
\DeclareRobustCommand\addinstitute{\@ifnextchar[{\@@addinstitute}{\@addinstitute}}
\def\@@addauthor[#1]#2{%
    \ifx\@empty\@authortext
        \g@addto@macro\@authortext{#2\textsuperscript{#1}}
    \else
        \g@addto@macro\@authortext{\and #2\textsuperscript{#1}}
    \fi
}
\def\@addauthor#1{%
    \ifx\@empty\@authortext
        \g@addto@macro\@authortext{#1}
    \else
        \g@addto@macro\@authortext{\and #1}
    \fi
}
\def\@@addinstitute[#1]#2{%
    \ifx\@empty\@institutetext
        \g@addto@macro\@institutetext{\textsuperscript{#1}#2}
    \else
        \g@addto@macro\@institutetext{\\ \textsuperscript{#1}#2}
    \fi
}
\def\@addinstitute#1{%
    \g@addto@macro\@institutetext{#1}
}
\oldauthor{\@authortext}
\oldinstitute{\@institutetext}
\makeatother

% Appendix settings
\let\oldappendix\appendix
\renewcommand{\appendix}{\newpage\oldappendix}

% Bibliography styling
\bibliographystyle{alphaurl}