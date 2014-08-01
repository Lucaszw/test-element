#!/usr/bin/perl

use Getopt::Std;

$filament_diam=1.75; 
$filament_density=1.05;   # density in g/cc 

$total=0;
$last=0;
$line_num=0;

getopts('s:d:f:h', \%opts);

if ($opts{s}) {	
  $filament_diam = $opts{s};
}

if ($opts{d}) {
  $filament_density=$opts{d};
}

$filename="-";

if ($opts{f}) {
  $filename=$opts{f};
}

if ($opts{h})  {
  # print "\nUsage:\n";
   print "filament_length [-s filament diameter] [-d filament density] [-f filename]\n";
#   print "    The density of ABS is ~1.05 g/cc, PLA is about 1.25 g/cc\n";
  exit;
}

# print "Filament diameter is $filament_diam mm\n";
# print "Filament density is $filament_density g/cc\n";

$filament_area = ($filament_diam/20)*($filament_diam/20) * 3.14159;

# print "Cross sectional area of filament: $filament_area cm^2\n";

if ($filename) {
  open(INPUTFILE, "<$filename");
} 

while ($line = <INPUTFILE>) {
#   print $line
   chomp($line);
   if ( $line =~ /G1.*E *(\d+\.\d*)/i ) {
	$last = $1;
   } elsif ( $line =~ /G92.*E0/ ) {
  $volume += $filament_area*$last/10
	$total += $last/10;
	print " Total at line $line_num: ", $total, " ", $last, "\n";
	$last=0;
   }
   $line_num++;
}
$total += $last/10;

# printf "\nTotal filament: %.3f cm\n", $total;

# $volume= $filament_area * $total;
printf "Volume: %.3f cc\n", $volume;
printf "%.3f", $volume;

$grams= $filament_density * $volume;
# printf "Weight: %.3f g\n", $grams;
