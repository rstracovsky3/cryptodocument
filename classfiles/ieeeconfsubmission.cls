\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classfiles/ieeeconfsubmission}[IEEE conference submission document class.]

\LoadClass[conference,compsoc]{IEEEtran}

\ifCLASSOPTIONcompsoc
    \usepackage[nocompress]{cite}
\else
    \usepackage{cite}
\fi

%% Disable table of contents
\renewcommand{\tableofcontents}{}

% Disable date and author
\let\olddate\date
\renewcommand{\date}[1]{\olddate{}}
\newcommand{\addauthor}[2][]{}
\newcommand{\addinstitute}[2][]{}
\author{Anonymous Author(s)}

% Disable unnecessary commands from llncs
\newcommand{\titlerunning}[1]{}
\newcommand{\authorrunning}[1]{}

% Bibliography settings
\bibliographystyle{IEEEtran}