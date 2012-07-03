#!/usr/bin/perl -w
$#ARGV >= 0 or die "no log file name supplied";

my @arguments= ('engine', 'query', 'subengine');
print join(',', @arguments) . "\n";
   
open (FILE, $ARGV[0]);
while (<FILE>) {
  chomp;#remove trailing newline
  #store line for clarity
  my $line = $_;
  #test current line for presence of 'searchbox'
  if ($line =~ m/searchbox/) {
    #declare empty array to hold the values
    my @vals = (); 
    #loop through the above defined arguments
    foreach $argument (@arguments) {
      #test the line for presence of each argument, and record the value in a group ($2)
      if ($line =~ /($argument)=([^\&|^\ ]*)/) {
        #push the found value on the end of the values array
        push(@vals, $2);
      }
    }
    #print the values array separated by commas, terminated by newline 
    print join(',', @vals) . "\n";
  }
}
close (FILE);
exit;
