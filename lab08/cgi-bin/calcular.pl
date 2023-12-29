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
    if($ec =~ /^(-)?([0-9]*(\.[0-9])*){1}\*-?([0-9]*(\.[0-9])*){1}/)
    $ec =~ s/-/\+-/g;
    my @members = split('\+', $ec);
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
