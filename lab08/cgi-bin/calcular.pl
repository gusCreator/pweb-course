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
  if($mult > 0){
    $mult = "+".$mult;
  }
  return $mult;
}
sub solveDiv {
  my $ec = $_[0];
  my $div;
  if($ec =~ m/(.*?)\/(.*)/){
    $div = $1 / $2;
  }
  return $div;
}
sub solveExp {
  my $ec = $_[0];
  #if($ec =~ m/^\((.+)\)$/){
  # $ec = $1;
  #}
  #print $ec."\n";
  if($ec =~ m/(.*?)\((.+?)\)(.*?)(\(.+\))(.*)/){
    print "dobPar: $1,$2,$3,$4,$5\n";
    $ec = $1.solveExp($2).$3.$4.$5;
    print "solvedobPar: ".$ec."\n";
    return solveExp($ec);
  }elsif($ec =~ m/^\((.+)\)$/){
    return solveExp($1);
  }elsif($ec =~ m/(.*?)\((.+)\)(.*)/){
    print "nesPar: $1,$2,$3\n";
    $ec = $1.solveExp($2).$3;
    print "solvenesPar: ".$ec."\n";
    return solveExp($ec);
  }else{
    my $solv;
    print "Init without par\n";
    while($ec =~ m/(.*?)([\-\+]?[0-9]+(\.[0-9]+)?\*[\-\+]?[0-9]+(\.[0-9]+)?)/){
      $solv = solveMul($2);
      $ec = $1.$solv.$';
      print "Mult: ".$ec."\n";
    }
    while($ec =~ m/(.*?)([\-\+]?[0-9]+(\.[0-9]+)?\/[\-\+]?[0-9]+(\.[0-9]+)?)/){
      $solv = solveDiv($2);
      $ec = $1.$solv.$';
      print "Div: ".$ec."\n";
    }
    $ec =~ s/-/+-/g;
    my @mem = split('\+', $ec);
    my $sum = 0;
    for my $num(@mem){
      $sum = $sum + 0 +  $num;
      print "$sum\n";
    }
    $ec = $sum;
    print "Final sum: $ec\n";
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
