\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cryptodocument}[Modular document class for common crypto submission and preprint formats.]

\RequirePackage{xkeyval}

\RequirePackage{amsmath, amssymb, amsfonts}
\RequirePackage{stmaryrd, mathtools}
\RequirePackage{cryptocode}
\RequirePackage{booktabs, multirow}

\def\myclasstype{article} % default class if invalid options are chosen

\DeclareOptionX{eprint}{%
    \gdef\myclasstype{classfiles/eprint}}
\DeclareOptionX{iacr-submission}{%
    \gdef\myclasstype{classfiles/iacrsubmission}}
\DeclareOptionX{iacr-proceedings}{%
    \gdef\myclasstype{classfiles/iacrproceedings}}
\DeclareOptionX{usenix-submission}{%
    \gdef\myclasstype{classfiles/usenixsubmission}}
\DeclareOptionX{usenix-proceedings}{%
    \gdef\myclasstype{classfiles/usenixproceedings}}
\DeclareOptionX{ieee-conf-submission}{%
    \gdef\myclasstype{classfiles/ieeeconfsubmission}}
\DeclareOptionX{ieee-conf-proceedings}{%
    \gdef\myclasstype{classfiles/ieeeconfproceedings}}
    \DeclareOptionX{acm-ccs-proceedings}{%
    \gdef\myclasstype{classfiles/acmccsproceedings}}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{\myclasstype}}
\ProcessOptionsX
\LoadClass{\myclasstype}% add options if desired