use Time::HiRes qw( usleep gettimeofday tv_interval);
my $t0 = [ gettimeofday() ];

sub isPrime
{
    my $number = shift;
    my $sqrt = sqrt $number;
    my $d = 2;
    while (1)
    {
        return 0 if ( $number % $d == 0 );
        return 1 if ( $d > $sqrt );
        $d++;
    }
}

my @numbers = (1..10000);
my @output = map {isPrime($_)} @numbers;

print("\n");
print
    qq{Command took },
    tv_interval($t0, [ gettimeofday() ]),
    qq{ seconds to run\n};