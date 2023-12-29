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
    my $ec =~ s/ //g;
    my $ec =~ s/-/+-/g;
    my  @members = split('+', $ec);
  }
}
