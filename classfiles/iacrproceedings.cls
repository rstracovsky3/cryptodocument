\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classfiles/iacrproceedings}[IACR submission document class.]

\LoadClass[runningheads]{llncs}

\def\pageMarginSize{1.1in}
\usepackage[pass]{geometry}

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

%% Disable table of contents
\renewcommand{\tableofcontents}{}

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
\def\appendix{\end{document}} % Disables appendices by ending document at appendix command

% Bibliography settings
\bibliographystyle{llncs/splncs04}