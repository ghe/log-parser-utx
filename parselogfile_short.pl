#!/usr/bin/perl -w

$#ARGV >= 0 or die "no log file name supplied";

print "engine,query,subengine\n";
open (FILE, $ARGV[0]);
while (<FILE>) {
  chomp;#remove trailing newline
  #store line for clarity
  my $line = $_;
  #test current line for presence of 'searchbox'
  if ($line =~ m/searchbox/) {
    #test the line for presence of each argument, and record the value in a group ($1)
    if ($line =~ /[^\w]engine=([^\&^\ ]*)/) {print "$1,";}
    if ($line =~ /[^\w]query=([^\&^\ ]*)/) {print "$1,";}
    if ($line =~ /[^\w]subengine=([^\&^\ ]*)/) {print "$1\n";}
  }
}
close (FILE);
