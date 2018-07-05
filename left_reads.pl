#! usr/bin/perl
use strict;
die "perl $0 R1 R2  outR1 outR2" unless @ARGV >4;


my @hereadsF;
my @hereadsR;
my @zongreadsF;
my @zongreadsR;
my $count1 =-1;
my $count2 =-1;
my %hashF;
my %hashR;
my @namef;
my @namer;
my @readsf_name;
my @readsr_name;

open heR1, "@ARGV[2]" or die "can not open fileF!";
while (<heR1>){
    my $line1 = $_;
    if($line1 =~ /\@/){
        @readsf_name= split/\s/,$line1;
        push(@namef,$readsf_name[0]);
    }
}
close(heR1);
print "namef is ok!";

# @hereadsR=<heR2>;
# foreach my $line2 (@hereadsR){
#     if($line2 =~ /\@/){
#         @readsr_name= split/\s/,$line2;
#         push(@namer,$readsr_name[0]);
#     }
# }
open zongR1, "@ARGV[0]" or die "can not open fileF!";
open RER1,">>@ARGV[3]" or die "can not creat ref!";
while(<zongR1>){
    $count1++;
    my $line3 = $_;
    if($line3 =~ /\@/){
        my @readsf= split/\s/,$line3;
        my $it1 = grep /$readsf[0]/,@namef;
        if ($it1 eq '0'){
            print RER1 "$line3";
        }
    }
}
#     $count1++;
#     if($line3 =~ /\@/){
#         my @readsf= split/\s/,$line3;
#         my $it1 = grep /$readsf[0]/,@namef;
#         # print $it1;
#         if ($it1 eq '0'){
#             my $next1=$count1+1;
#             my $next2=$count1+2;
#             my $next3=$count1+3;
#             my $value1 = $zongreadsF[$count1].$zongreadsF[$next1].$zongreadsF[$next2].$zongreadsF[$next3];
#             print RER1 "$value1";
#         }
#     }
# }
close(zongR1);
close(RER1);
print "R1 is ok!";

# open zongR2, "@ARGV[1]" or die "can not open fileR!";
# open RER2,">>@ARGV[4]" or die "can not creat rer!";
# @zongreadsR=<zongR2>;
# foreach my $line4 (@zongreadsR){
#     $count2++;
#     if($line4 =~ /\@/){
#         my @readsr= split/\s/,$line4;
#         my $it2 = grep /$readsr[0]/,@namef;
#         # print $it2;
#         if ($it2 eq '0'){
#             my $next4=$count2+1;
#             my $next5=$count2+2;
#             my $next6=$count2+3;
#             my $value2 = $zongreadsR[$count2].$zongreadsR[$next4].$zongreadsR[$next5].$zongreadsR[$next6];
#             print RER2 "$value2";
#         }
#     }
# }
# close(zongR2);
# close(RER2);
# print "R2 is ok!";

# my $keyF;
# my @ref;
# my @rer;
# my $ref;
# my $rer;

# foreach $keyF (sort keys %hashF){
#     push @ref,$hashF{$keyF};
#     push @rer,$hashR{$keyF};
# }

# $ref = join "",@ref;
# $rer = join "",@rer;

# print RER1 "$ref";
# print RER2 "$rer";