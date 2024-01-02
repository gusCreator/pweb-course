#!/usr/bin/perl
use strict;
use warnings;
use CGI;
 
my $cgi = CGI->new;
cgi->charset('UTF-8');
print $cgi->header('text/html');
print <<HTML;
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../styles.css">
    <title>Página de Búsqueda - Universidades licenciadas</title>
  </head>
  <body>
    <div class="site-wrapper">
      <div class="mytitle">
        <b>Resultados de la búsqueda</b>
      </div>
      <div class="content">
HTML

my $kind = cgi->param('kind');
my $keyword = cgi->param('keyword');

my $flag;
open(IN, "../data.csv" ) or die "<h2>Error al abrir el archivo</h2>";
while(my $line = <IN>){
  my %dict = findInLine($line);
  my $value = $dict{$kind};
  if(defined($value) && $value =~ /.*$keyword.*/){
    print "<p>$line</p>\n";
    $flag = 1;
    next;
  }
}
close(IN);
if(!defined($flag)){
  print "<p>No se encontraron resultados</p>\n"
}
print <<HTML;
      </div>
      <div class="back">
        <a href="../consult.html">Volver</a>
      </div>
    </div>
  </body>
</html>
HTML
sub findInLine {
  my %dict = ();
  my $line = $_[0];
  if($line =~ m/.+\|(.+)\|.+\|.+\|(.+)|.+\|.+\|.+\|.+\|.+\|(.+)\|.+\|.+\|.+\|.+\|.+\|(.+)\|.+/){
    $dict{"name"} = $1;
    $dict{"period"} = $2;
    $dict{"localRegion"} = $3;
    $dict{"studyProgram"} = $4;
  }
  return %dict;
}
