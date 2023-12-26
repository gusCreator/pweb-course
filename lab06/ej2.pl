#!/usr/bin/perl

sub Mayor {
  $may = $_[0];
  foreach $var(@_) {
    if($var > $may) {
      $may = $var;
    }
  }
  return $may;
}

@arr = (1,2,10,4,5);
$may = Mayor(@arr);
print "The mayor number is: $may\n";

