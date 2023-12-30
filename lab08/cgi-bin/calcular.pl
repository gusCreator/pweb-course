#!/usr/bin/perl
use strict;
use warnings;
use CGI;
 
sub solveMul {
  my $ec = $_[0];
  my $mult;
  if($ec =~ m/(.*?)\*(.*)/){
    $mult = $1 * $2;
  }
  return $mult;
}
sub solveDiv {
  my $ec = $_[0];
  my $div;
  if($ec =~ m/(.*?)\/(.*)/){
    $div = $1 * $2;
  }
  return $div;
}
sub solveExp {
  my $ec = $_[0];
  if($ec =~ m/.*\((.+)\).*/){
    solveExp($1);
  }else{
    my $solv;
    if($ec =~ m/(.*?)([\-\+]?[0-9]+(\.[0-9]+)?\*[\-\+]?[0-9]+(\.[0-9]+)?)/){
      #$solv = solveMul($2);
      $ec = $1.$solv.$3;
      print $ec."\n";
    }
    if($ec =~ m/(.*?)([\-\+]?[0-9]+(\.[0-9]+)?\/[\-\+]?[0-9]+(\.[0-9]+)?)/){
      #$solv = solveDiv($2);
      $ec = $1.$solv.$3;
      print $ec."\n";
    }
    $ec = s/-/+-/g;
    my @mem = split('\+', $ec);
    my $sum = 0;
    for my $num(@mem){
      $sum = $sum + $num;
    }
    $ec = $sum;
    return $ec;
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
print secureExp($y);
