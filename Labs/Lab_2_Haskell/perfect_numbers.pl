use strict;
use warnings;
use Time::HiRes qw( usleep gettimeofday tv_interval);
use Math::Factor::XS qw/factors/;
use List::Util qw/sum/;

my $t0 = [ gettimeofday() ];

sub factors {
    my $number = shift;
    
    my @factors = ();
    
    for my $i (1..($number-1)){
        if(($number % $i) == 0) {
            push @factors, $i;
        }
    }
    return @factors;
}

sub isPerfect {
    my $number = shift;
    my @factor = factors($number);
    my $sum = 0;
    for ( @factor ){
        $sum += $_;
    }
    
    if( $number == $sum) {
        print "true";
    } else {
        print "false";
    }
}

sub print_arr{
    my @arr = @_;
    foreach(@arr){
        print "$_\r\n";
    }
}


for (2 .. 10000) {
    print "$_ is perfect\n" if (sum(factors($_),0) == $_ - 1);
}

#@numbers = (2..10000);
#@out = map {isPerfect($_)} @numbers;
#print("The factors of 10 are : ");
#print_arr(factors(10));
#print("\n");
#print("The factors of 7 are : ");
#print_arr(factors(7));

#print("The value of isPerfect(6) is: ");
#isPerfect(6);
#print("\n");
#print("The value of isPerfect(9) is: ");
#isPerfect(9);
print("\n");
print
    qq{Command took },
    tv_interval($t0, [ gettimeofday() ]),
    qq{ seconds to run\n};