#!/usr/bin/env perl
$lualatex         = 'lualatex -halt-on-error %O -synctex=1 %S';
$latex            = 'uplatex -halt-on-error';
$latex_silent     = 'uplatex -halt-on-error -interaction=batchmode';
$bibtex           = 'upbibtex %O %B';
$makeindex        = 'mendex %O -o %D %S';
$biber            = 'biber %O -E=utf8 -u -U --output_safechars %B';
$dvipdf           = 'dvipdfmx %O -o %D %S';

$pdf_mode         = 4; # generates pdf via dvipdfmx

$pvc_view_file_via_temporary = 0;
$max_repeat       = 5;

add_cus_dep("nlo", "nls", 0, "nlo2nls");
sub nlo2nls {
        system("makeindex $_[0].nlo -s nomencl.ist -o $_[0].nls -t $_[0].nlg");
}

$aux_dir          = "out/";
$out_dir          = "out/";
