#! /usr/bin/perl
#use strict;
use Getopt::Long;
##############usage##############################
die "Usage:
    perl [script] -i [input_vcf] -o [output_file] -m [mother_column] -s [son_column] -f [father_column] -d [min_var_depth] -p point_list

        -i  input: str txt or vcf file
        -o  output
        -m  mother_data_column
        -s  son_data_column
        -f  father_column
        -d  min_var_depth
        -p point_list"
unless @ARGV>=1;

########################

my $in;
my $out;
my $mom;
my $son;
my $dad;
my $min;
my $son_small;
my $dad_small;
my $sim;
my $sim1;
my $sim2;
my $sim3;
my $sim4;
my %list;
Getopt::Long::GetOptions (
   'i=s' => \$in,
   'o=s' => \$out,
   'm:i' => \$mom,
   's:i' => \$son,
   "f:i" => \$dad,
   "d:i" => \$min,
   "p=s" => \$list,
);


open IN, "<$in" or die "Cannot open file $in!\n";
open OUT, ">>$out" or die "Cannot open file $out!\n";
open INP, "<$list" or die "Cannot open file $list!\n";
while <INP> {
    chomp;

}

my $line_count=0;
my $snp_ms=0;
my $snp_f=0;
my @result;
my $line;
print OUT "检测位点编号\t染色体\t疑父基因型\t母本基因型\t胎儿基因型\t是否匹配\n";
while(<IN>) {
 chomp;
 $line=$_;

 if(substr($line,0,2)ne"##") {
  $line_count++;
  my @line=split/\t/,$line;
  push @line,0;
  my @mom=split/\:/,$line[$mom];
#  my @mom_var=split/\,/,$mom[1];
#  my $mom_var=$mom_var[1]/$mom[2];
  my @son=split/\:/,$line[$son];
#  my @son_var=split/\,/,$son[1];
#  my $son_var=$son_var[1]/$son[2];
  my @dad=split/\:/,$line[$dad];
  my $ref = $line[3];
  my $alt = $line[4];
  $line_count1 = 'NIPA'.($line_count -1) ;
#print OUT "Num\t染色体\t父本基因型\t母本基因型\t胎儿基因型\t是否匹配\n";
$son_type = $ref.'/'.$alt;
  if ( $dad[0] eq '0/1' and $mom[0] eq '0/0') {
    $dad_type = $ref.'/'.$alt;
    $mom_type = $ref.'/'.$ref;
    print OUT "$line_count1\t$line[0]\t$dad_type\t$mom_type\t$son_type\t$line[-2]\n";
}
if ( $dad[0] eq '0/0' and $mom[0] eq '0/0') {
   $dad_type = $ref.'/'.$ref;
   $mom_type = $ref.'/'.$ref;
  print OUT "$line_count1\t$line[0]\t$dad_type\t$mom_type\t$son_type\t$line[-2]\n";
}
  if ( $dad[0] eq '1/1' and $mom[0] eq '0/0') {
   $dad_type = $alt.'/'.$alt;
   $mom_type = $ref.'/'.$ref;
   print OUT "$line_count1\t$line[0]\t$dad_type\t$mom_type\t$son_type\t$line[-2]\n";
}
   if ( $dad[0] eq '0/1' and $mom[0] eq '1/1') {
   $dad_type = $ref.'/'.$alt;
   $mom_type = $alt.'/'.$alt;
 print OUT "$line_count1\t$line[0]\t$dad_type\t$mom_type\t$son_type\t$line[-2]\n";
}
  if ( $dad[0] eq '0/0' and $mom[0] eq '1/1') {
   $dad_type = $ref.'/'.$ref;
   $mom_type = $alt.'/'.$alt;
 print OUT "$line_count1\t$line[0]\t$dad_type\t$mom_type\t$son_type\t$line[-2]\n";
}
  if ( $dad[0] eq '1/1' and $mom[0] eq '1/1') {
   $dad_type = $alt.'/'.$alt;
   $mom_type = $alt.'/'.$alt;
    print OUT "$line_count1\t$line[0]\t$dad_type\t$mom_type\t$son_type\t$line[-2]\n";
}
}
}


