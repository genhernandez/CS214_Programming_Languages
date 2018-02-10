use Time::HiRes qw( usleep gettimeofday tv_interval);
my $t0 = [ gettimeofday() ];

my @numbers = (1 .. 10000); 
my %factor_hash = ();
my $number = 1;
my @perfect_numbers = ();
for $number (@numbers) 
{
    #do the factoring in a subroutine
    #store a string such as 1-2-4 for the factors of 4
    $factor_hash{$number} = factor($number);
}

#time to check for perfection
for $number (@numbers)
{
    my $sum_of_factors = 0;
    my @factors = split /-/, $factor_hash{$number};
    for my $factor (@factors)
    {
        $sum_of_factors+=$factor;
    }
    #a number is perfect if it equals half the sum of all factors
    # (because the number itself is a factor)
    if ($number == $sum_of_factors/2) 
    {
        print "$number is perfect\n";
        push @perfect_numbers, $number;
    }
}

sub factor
{
    my $factor_string = "";
    my $number = shift;
    
    for my $i ( 1 .. $number)
    {
        if (($number % $i) == 0)
        {
            $factor_string .= "-$i";
        }
    }
    return $factor_string;
}

print("\n");
print
    qq{Command took },
    tv_interval($t0, [ gettimeofday() ]),
    qq{ seconds to run\n};