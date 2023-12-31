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
  my $sol;
  if($ec =~ m/(.*?)\((.+)\)(.*?)(\(.+\))(.*)/){
    my @vars = ($1,$2,$3,$4,$5);
    #print "dobPar: $vars[0],$vars[1],$vars[2],$vars[3],$vars[4]\n";
    $sol = solveExp($vars[1]);
    $ec = $vars[0].$sol.$vars[2].$vars[3].$vars[4];
    #print "solvedobPar: ".$ec."\n";
    return solveExp($ec);
  }elsif($ec =~ m/^\((.+)\)$/){
    my $ecu = $1;
    return solveExp($ecu);
  }elsif($ec =~ m/(.*?)\((.+)\)(.*)/){
    my @vars = ($1,$2,$3);
    #print "nesPar: $vars[0],$vars[1],$vars[2]\n";
    $sol = solveExp($vars[1]);
    $ec = $vars[0].$sol.$vars[2];
    #print "solvenesPar: ".$ec."\n";
    return solveExp($ec);
  }else{
    my $solv;
    # print "Init without par\n";
    while($ec =~ m/(.*?)([\-\+]?[0-9]+(\.[0-9]+)?\*[\-\+]?[0-9]+(\.[0-9]+)?)/){
      $solv = solveMul($2);
      $ec = $1.$solv.$';
      #print "Mult: ".$ec."\n";
    }
    while($ec =~ m/(.*?)([\-\+]?[0-9]+(\.[0-9]+)?\/[\-\+]?[0-9]+(\.[0-9]+)?)/){
      $solv = solveDiv($2);
      $ec = $1.$solv.$';
      #print "Div: ".$ec."\n";
    }
    $ec =~ s/-/+-/g;
    my @mem = split('\+', $ec);
    my $sum = 0;
    for my $num(@mem){
      $sum = $sum + 0 +  $num;
      # #print "$sum\n";
    }
    $ec = $sum;
    #print "Final sum: $ec\n";
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
my $q = CGI->new;
$q->charset('UTF-8');
my $exp = $q->param('exp');

my $result = secureExp($exp);

print $q->header('text/html');
print<<BLOCK
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles.css">
    <title>Calculadora</title>
  </head>
  <body>
    <div class="site-wrapper">
      <div class="title">
        <a href="../calculator.html">Calculadora</a>
      </div>
      <div class="resolution-container">
        <div class="resolution">
          <p><b>La expresión es:</b></p>
          <p>$exp</p>
          <p><b>La respuesta es:</b></p>
          <p>$result</p>
        </div>
        <div class="back-button">
          <a href="../calculator.html">Volver</a>
        </div>
      </div>
    </div>

  </body>
</html>
BLOCK
