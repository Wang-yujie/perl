#! usr/bin/perl
use strict;
die "perl $0 R1 R2  outR1 outR2" unless @ARGV >3;
open R1, "@ARGV[0]" or die "can not open fileF!";
open R2, "@ARGV[1]" or die "can not open fileR!";
open RER1,">>@ARGV[2]" or die "can not creat ref!";
open RER2,">>@ARGV[3]" or die "can not creat rer!";

my @readsF;
my @readsR;
my $count1 =-1;
my $count2 =-1;
my %hashF;
my %hashR;
my @namef;
my @namer;

@readsF=<R1>;
foreach my $line (@readsF){
    $count1++;
    if($line =~ /\@/){
        @namef= split/\s/,$line;
        my $next1=$count1+1;
        my $next2=$count1+2;
        my $next3=$count1+3;
        my $value = $readsF[$count1].$readsF[$next1].$readsF[$next2].$readsF[$next3];
        $hashF{$namef[0]} =$value;
    }
}

@readsR=<R2>;
foreach my $line1 (@readsR){
    $count2++;
    if($line1 =~ /\@/){
        @namer= split/\s/,$line1;
        my $next4=$count2+1;
        my $next5=$count2+2;
        my $next6=$count2+3;
        my $value1 = $readsR[$count2].$readsR[$next4].$readsR[$next5].$readsR[$next6];
        $hashR{$namer[0]} =$value1;
    }
}

my $keyF;
my @ref;
my @rer;
my $ref;
my $rer;

foreach $keyF (sort keys %hashF){
    push @ref,$hashF{$keyF};
    push @rer,$hashR{$keyF};
}

$ref = join "",@ref;
$rer = join "",@rer;

print RER1 "$ref";
print RER2 "$rer";