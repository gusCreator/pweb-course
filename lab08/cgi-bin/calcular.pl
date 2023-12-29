#!/usr/bin/perl
use strict;
use warnings;
use CGI;
 
sub solvePar {
  
}

sub solveSum {

}
sub solveRes {

}

sub solveMul {

}
sub solveDiv {

}
sub solveExp {
  my $ec = $_[0];
  if($ec =~ m/.*\((.+)\).*/){
    solveExp($1);
  }else{
    my $solv;
    if($ec =~ m/(.*?)([\-\+]?[0-9]+(\.[0-9]+)?\*[\-\+]?[0-9]+(\.[0-9]+)?)/){
      $solv = solveMul($2);
      $ec = $1.$solv.$3;
    }
    if($ec =~ m/(.*?)([\-\+]?[0-9]+(\.[0-9]+)?\/[\-\+]?[0-9]+(\.[0-9]+)?)/){
      $solv = solveDiv($2);
      $ec = $1.$solv.$3;
    }
  }
}
sub secureExp {
  my $ec = $_[0];
  $ec =~ s/ //g;
  if($ec =~ /[a-z]|[A-Z]/){
    return "No es una expresión válida\n";
  }
  return solveExp($ec);
}

my $y = <STDIN>;
chomp($y);
print recognize($y);
