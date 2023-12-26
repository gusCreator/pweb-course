#!/usr/bin/perl
use List::Util qw(max);
sub Celebrity {
  my ($mat) = @_;
  for(my $i = 0; $i < @$mat; $i++){
    $mat->[$i][$i] -= 1;
    my $ide = $mat->[$i][$i];
    my @row = @{$mat->[$i]};
    if($ide == 0 && max(@row) == 0){
      my $sum = 0;
      for(my $j = 0; $j < @$mat; $j++){
        $sum += $mat->[$j][$i];
      }
      if($sum == @$mat - 1){
        return 1;
      }
      return 0;
    }
  }
  return 0;
}
@mat = ([1,1,0], [1,1,0], [0,1,0], [1,1,0]);
$cel = Celebrity(\@mat);

print $cel."\n";
