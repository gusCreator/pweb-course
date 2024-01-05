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
    <title>Películas de 1985</title>
  </head>
  <body>
    <div class="site-wrapper">
      <div class="mytitle">
        <b>Películas de 1985</b>
      </div>
      <div class="container">
HTML
my $user = "alumno";
my $password = "pweb1";
my $ip = Net::Adress::IP::Local->public_ipv4;
my $dsn = "DBI:MariaDB:database=pweb1;host=$ip";
my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");
my $year = "1985";
my $sth = $dbh->prepare("SELECT * FROM Movie WHERE Year=?");
$sth->execute($year);
while(my @row = $sth->fetchrow_array){
  print "<p>@row</p>\n";
}
$sth->finish;
$dbh->disconnect;
print <<HTML;
      </div>
      <div class="back">
        <a href="../consult.html">Volver</a>
      </div>
    </div>
  </body>
</html>
HTML
