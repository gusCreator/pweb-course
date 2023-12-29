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
sub recognize {
  my $ec = $_[0];
  if($ec =~ /[a-z]|[A-Z]/){
    return "No es una expresión válida\n";
  }else{
    $ec =~ s/ //g;
    $ec =~ s/-/+-/g;
    my @members = split('\+', $ec);
  }
}

my $y = <STDIN>;
chomp($y);
print recognize($y);
