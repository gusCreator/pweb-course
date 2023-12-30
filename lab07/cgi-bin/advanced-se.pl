#!/usr/bin/perl
use strict;
use warnings;
use CGI;
 
my $cgi = CGI->new;
my $as_q = $cgi->param('as_q');
my $as_epq = $cgi->param('as_epq');
my $as_eq = $cgi->param('as_eq');
my $url = "https://www.google.com/search?as_q=$as_q&as_epq=$as_epq&as_oq=&as_eq=$as_eq&as_nlo=&as_nhi=&lr=&cr=&as_qdr=all&as_sitesearch=&as_occt=any&as_filetype=&tbs=";
print $cgi->redirect(-uri => $url, -status => 302);
