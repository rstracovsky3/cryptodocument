\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classfiles/acmccsproceedings}[ACM CCS conference proceedings document class.]

\LoadClass[sigconf]{acmart}

\setcopyright{acmlicensed}
\copyrightyear{2018}
\acmYear{2018}
\acmDOI{XXXXXXX.XXXXXXX}

\acmConference[Conference acronym 'XX]{Make sure to enter the correct
  conference title from your rights confirmation emai}{June 03--05,
  2018}{Woodstock, NY}
\acmISBN{978-1-4503-XXXX-X/18/06}

% Disable date
\let\olddate\date
\renewcommand{\date}[1]{\olddate{}}

% Author settings
\let\oldauthor\author
\let\oldinstitute\institute

\newcommand{\addauthor}[2][]{\author{#2}}
\newcommand{\addinstitute}[2][]{\affiliation{\institute{#2}}}

\newcommand{\authorrunning}[1]{\renewcommand{\shortauthors}{#1}}
\newcommand{\titlerunning}[1]{}