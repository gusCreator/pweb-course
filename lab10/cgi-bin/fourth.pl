#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;
use Net::Address::IP::Local;
 
my $cgi = CGI->new;
$cgi->charset('UTF-8');
print $cgi->header('text/html; charset=UTF-8');
print <<HTML;
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../styles.css">
    <title>Películas por año</title>
  </head>
  <body>
    <div class="site-wrapper">
      <div class="mytitle">
        <b>Pelis por año</b>
      </div>
      <div class="content">
HTML
my $user = "alumno";
my $password = "pweb1";
my $ip = Net::Address::IP::Local->public_ipv4;
my $dsn = "DBI:MariaDB:database=pweb1;host=$ip";
my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");
my $year = $cgi->param('year');

print "<div class='mytable'>\n<table>\n<tr>\n";
my $sth = $dbh->prepare("DESC Movie");
$sth->execute();
while(my @head = $sth->fetchrow_array){
  print "<th>$head[0]</th>\n";
}
print "</tr>\n";

$sth = $dbh->prepare("SELECT * FROM Movie WHERE Year=?");
$sth->execute($year);
while(my @row = $sth->fetchrow_array){
  print "<tr>\n";
  foreach my $data(@row){
    print "<td>$data</td>\n";
  }
  print "</tr>\n";
}
$sth->finish;
$dbh->disconnect;
print <<HTML;
      </table>
      </div>
      </div>
      <div class="back">
        <a href="../consult.html">Volver</a>
      </div>
    </div>
  </body>
</html>
HTML
