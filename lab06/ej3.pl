#!/usr/bin/perl

sub Invert {
  $str = "";
  for($i = 0; $i < length($_[0]); $i++){
    $char = substr($_[0], length($_[0]) - $i - 1, 1);
    $str = $str.$char;
  }
  return $str;
}
$input = <STDIN>;
chomp($input);
$invert = Invert($input);
print $invert."\n";

