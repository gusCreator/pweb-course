#!/usr/bin/perl
use strict;
use warnings;
use CGI;
 
my $cgi = CGI->new;
my $q = $cgi->param('q');
my $url = "https://www.google.com/search?q=$q&tbm=isch";
print $cgi->redirect(-uri => $url, -status => 302);
