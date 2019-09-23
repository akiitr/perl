#!/usr/bin/perl
#-----------------------------------------------------------------------------------------------------------------------
#Refrences:-
#1: https://www.tutorialspoint.com/perl/perl_function_references.htm (all possible funactions)
#2: https://perlmaven.com(for tips and tricks)
#3: https://metacpan.org/pod/perlfunc#system-LIST (whole document for perl)
#-----------------------------------------------------------------------------------------------------------------------
#//upper line is for making file executable in linux
###################################
###### unified script for nmos ####
###################################
####### for Id = f(vgs,vds) #######
###################################
my $VDD = -1.10; #$ is used for defining vdd and use as variable beacause variant type language
$VDD = sprintf("%.3f", $VDD); #.3f for giving accuracy to 3 decimal point and sprintf command for printing to console
my $count = 1;
#Math::BigFloat - Arbitrary size floating point math package
use Math::BigFloat ':constant'; #all the floating point constants in the given scope are converted to Math::BigFloat. 

#Below part is just opening and reading lut file
open(lut,">IdVg-NFET-Lg-16nm.tbl");
print lut "#Vds\tVgs\tId\n";
close(lut);

#while loop for reading a particular vdd and processing it
while ("$VDD" != 1.105)
{

#1 file nmosidtemp is being generated with different vdd parameters
#-----------------------------------------------------------------------------------------------------------------------
open(in, "<nmosid.cmd") or die "Couldn't open file , $!";#'<' signifies file opened for reading
open(out,">nmosidtemp.cmd") or die "Couldn't open file , $!";#'>' signifies file opened for writing with warning if file not opened
my @array=0; #decalaring an array and setting all element to 0
#( when accessing a single element of an array the leading sigil changes from @ to $. This might cause confusion to some people, but if you think about it, it is quite obvious why. @ marks plural and $ marks singular. When accessing a single element of an array it behaves just as a regular scalar variable.)
#Check basic of perl array
#https://perlmaven.com/perl-arrays 
foreach $line (<in>)#in is a object of nmosid.cmd file for reading only by < 
{ #here line variable has read 1 full line
 my @tokens = split(/ /, $line);#split command will split data whenever space is found in the line name string and will store in token array
 #https://perlmaven.com/perl-split
foreach my $token (@tokens) 
{

#string comparison has been performed and flag is being updated by checking one by one at differ parameters
#print out command is being used for writing the data in to the nmosidtemp file by different string + value method

  if ($token eq "at_VDD")
  {
  print out "nmos$count";
  $flag = $flag + 2; 
  }
  elsif ($token eq "VDD")
  {
  print out "$VDD";
  $flag = $flag + 2; 
  }
  elsif ($token eq "init_at_VDD")
  {
  print out "init_at_$VDD";
  $flag = $flag + 2; 
  }
  elsif ($token eq "Data_at_VDD")
  {
  print out "Data_at_$VDD";
  $flag = $flag + 2; 
  }
  else 
  {
  #IF block will be executed only when flag>0
   if(!$flag){
   print out " $token";}
   else {
   print out "$token";$flag = $flag-1;}
  }
}
}
#closing the input and output file after writing into the file
close(in);
close(out);
#-----------------------------------------------------------------------------------------------------------------------
#2 That nmosidtemp.cmd file is eing run from programm to get all the values in the nodes.plt file 

#System command is used here to run some other programm in this script sdevice nmosidtemp.cmd
system('sdevice nmosidtemp.cmd');
#-----------------------------------------------------------------------------------------------------------------------
#2 That nmosidtemp.cmd file is being processed to extract data in the IdVg-NFET-Lg-16nm.tbl lut file

open(lut,">>IdVg-NFET-Lg-16nm.tbl");#opening the file name lut in write with obj ,name, 
#my $filename = "nmos$count\_des.plt";
my $filename = "nodes.plt";
open(res, '<:encoding(UTF-8)', $filename) or die "Couldn't open file , $!";#open file with (obj ,format ,name) 
print lut "# Vdrain = $VDD\n";#will open lut and print the vdd value to it
#print "$VDD";
#setting different flags 
$flag = 0;
$temp = 0;
$lineno = 0;
$VGS = -0.40;  #new line count 
$VGS = sprintf("%.3f", $VGS);#for assigning the fixed point acuray of flating value
$vlaue = 0;
$firstrun= 1;
$multiinst = 0;
$valueupdt = 0;
$begprint = 0;

foreach $line (<res>) #line is loacal variable for this loop declared here for 
{ 
 my @tokens = split(/\s+/, $line);#splitiing each line \s+ (or any one or more white space character)
 if($flag)
 {$lineno = $lineno +1;}//counting the no of data lines
 if($flag)
 {
 #setting flags based upn the data stored in the nodes.plt
 if($lineno == 2) 
 { if ($tokens[2] == $temp ) { $multiinst = 1; } else { $multiinst = 0; } if ($tokens[2] eq "-4.00000000000000E-01" ) {$begprint = $begprint + 1;}$temp = $tokens[2];}
 
 #extracting values and updating the device parameter by incrementing in the values of vgs vds etc
 if ($lineno == 2){ 
     if($firstrun ){$firstrun = 0; }
     elsif ($multiinst) {  $value = $tokens[3]; $valueupdt = 1;} 
     elsif( !$multiinst) { if($valueupdt) {  if ($begprint == 2) {print lut "$VDD\t$VGS\t$value\n";$VGS = $VGS + 0.005;$VGS = sprintf("%.3f", $VGS);} $valueupdt = 0;} 
                                          if($begprint == 2) { print lut "$VDD\t$VGS\t$tokens[3]\n"; 
                                          $VGS = $VGS + 0.005;$VGS = sprintf("%.3f", $VGS);}
                          }
     $lineno = 0;}
 #print " line no $lineno multiinst $multiinst \t $VGS\n";
}
#checking for the string data
 foreach my $token (@tokens) 
 {
 if($token eq "Data")
 {$flag = 1;print "found data";}
 } 
}
#---------------------------------------------------------------------------------------------------
#table genearted and closing the input and output file and incrementing the vdd for next cycle
close(lut);
close(res);
$VDD = $VDD + 0.005;
$VDD = sprintf("%.3f", $VDD);
} 
#end of while loop
#---------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------
#table for capacitances same process repated nothing new
#################################
##### for cgd,cgs = f(vgs,vds) ##
#################################
my $VDD = -1.10; 
$VDD = sprintf("%.3f", $VDD);
my $count = 1;
open(lut,">CGD-NFET-Lg-16nm.tbl");
open(lut2,">CGS-NFET-Lg-16nm.tbl");
open(lut3,">CDS-NFET-Lg-16nm.tbl");
open(lut4,">CDG-NFET-Lg-16nm.tbl");
open(lut5,">CSG-NFET-Lg-16nm.tbl");
open(lut6,">CSD-NFET-Lg-16nm.tbl");
print lut "#Vds\tVgs\tCGD\n";
print lut2 "#Vds\tVgs\tCGS\n";
print lut3 "#Vds\tVgs\tCGS\n";
print lut4 "#Vds\tVgs\tCGD\n";
print lut5 "#Vds\tVgs\tCGS\n";
print lut6 "#Vds\tVgs\tCGS\n";
close(lut);
close(lut2);
close(lut3);
close(lut4);
close(lut5);
close(lut6);
while ($VDD != 1.15)
{
open(in, "<nmosac.cmd") or die "Couldn't open file , $!";
open(out,">nmosactemp.cmd") or die "Couldn't open file , $!";
my @array=0;
foreach $line (<in>) 
{ 
 my @tokens = split(/ /, $line);
foreach my $token (@tokens) 
{
  
  if ($token eq "at_VDD")
  {
  print out "nmos$count";
  $flag = $flag + 2; 
  }
  elsif ($token eq "VDD")
  {
  print out "$VDD";
  $flag = $flag + 2; 
  }
  elsif ($token eq "init_at_VDD")
  {
  print out "init_at_$VDD";
  $flag = $flag + 2; 
  }
  elsif ($token eq "Data_at_VDD")
  {
  print out "Data_at_$VDD";
  $flag = $flag + 2; 
  }
  else 
  {
   if(!$flag){
   print out " $token";}
   else {
   print out "$token";$flag = $flag-1;}
  }
}
}
close(in);
close(out);
system('sdevice nmosactemp.cmd');
open(lut,">>CGD-NFET-Lg-16nm.tbl");
open(lut2,">>CGS-NFET-Lg-16nm.tbl");
open(lut3,">>CDS-NFET-Lg-16nm.tbl");
open(lut4,">>CDG-NFET-Lg-16nm.tbl");
open(lut5,">>CSG-NFET-Lg-16nm.tbl");
open(lut6,">>CSD-NFET-Lg-16nm.tbl");
#my $filename = "nmos$count\_des.plt";
my $filename = "extraction_ac_des.plt";
open(res, '<:encoding(UTF-8)', $filename) or die "Couldn't open file , $!";
print lut "# Vdrain = $VDD\n";
print lut2 "# Vdrain = $VDD\n";
print lut3 "# Vdrain = $VDD\n";
print lut4 "# Vdrain = $VDD\n";
print lut5 "# Vdrain = $VDD\n";
print lut6 "# Vdrain = $VDD\n";
$flag = 0;
$temp = 0;
$lineno = 0;
$VGS = -0.40;
$VGS = sprintf("%.3f", $VGS);
 #new line count 
foreach $line (<res>) 
{ 
 my @tokens = split(/\s+/, $line);
 if($flag)
 {$lineno = $lineno +1;}
 if($flag){
 if ($lineno == 3) {print lut3 "$VDD\t$VGS\t$tokens[4]\n";print lut4 "$VDD\t$VGS\t$tokens[2]\n";}
 if ($lineno == 4) {print lut "$VDD\t$VGS\t$tokens[1]\n";print lut2 "$VDD\t$VGS\t$tokens[5]\n";}
 if ($lineno == 5) {print lut5 "$VDD\t$VGS\t$tokens[4]\n";print lut6 "$VDD\t$VGS\t$tokens[2]\n";}
 elsif ($lineno == 6) {$VGS = $VGS + 0.005;  $lineno = 0;$VGS = sprintf("%.3f", $VGS);}}
 foreach my $token (@tokens) 
 {
 if($token eq "Data")
 {$flag = 1;}
 } 
}
close(lut);
close(lut2);
close(lut3);
close(lut4);
close(lut5);
close(lut6);
close(res);
$VDD = $VDD + 0.005;
$VDD = sprintf("%.3f", $VDD);
} 
 
