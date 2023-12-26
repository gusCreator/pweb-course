#!/usr/bin/perl
use strict;
use warnings;
use CGI;
 
my $cgi = CGI->new;
my $q = $cgi->param('q');

print $cgi->header('text/html');
print <<BLOCK;
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Búsqueda Simple</title>
  </head>
  <body>
    <nav>
      <div>
        <button onclick="location.href='simple-se.html'">Búsqueda Simple</button>
      </div>
      <div>
        <button onclick="location.href='advanced-se.html'">Búsqueda Avanzada</button>
      </div>
      <div>
        <button onclick="location.href='image-se.html'">Búsqueda Por Imágenes</button>
      </div>
    </nav>
  </body>
</html>
BLOCK
