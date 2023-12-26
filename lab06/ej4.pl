#!/usr/bin/perl
use List::Util qw(max min);
sub Average {
  $mayor = max(@_);
  $minor = min(@_);
  $sum = 0;
  foreach $var (@_){
    $sum += $var;
  }
  $av = ($sum - $minor + $mayor) / @_;
  return $av;
}
$ave = Average(10,10,20);
print $ave."\n";
