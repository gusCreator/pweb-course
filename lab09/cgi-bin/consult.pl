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

print <<HTML;
      </div>
    </div>
  </body>
</html>
HTML
