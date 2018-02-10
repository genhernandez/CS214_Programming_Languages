use Time::HiRes qw( usleep gettimeofday tv_interval);
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

sub factors2 {
    my $number = shift;
    my @factors = ();
    
    for my $i (1..($number - 1)){
        if(scalar @factors < 2){
            if(($number % $i == 0)){
                push @factors, $i;
            }
        } else{
            return @factors;
        }
    }
    
}

sub print_arr{
    my @arr = @_;
    foreach(@arr){
        print "$_\r\n";
    }
}

sub isPrime {
    my $number = shift;
    my @factor = factors($number);
    
    if(scalar @factor == 1){
        print "$number : true ";
    } else {
        print "$number : false ";
    }
}

sub isPrime2 {
    my $number = shift;
    my @factor = factors2($number);
    
    if(scalar @factor == 1){
        print "$number : true, ";
    }else {
        print "$number : false, ";
    }
}

#factors tests
#print("The return value of factors(20): ");
#print_arr(factors(20));
#print("\n");
#print("The return value of factors(17): ");
#print_arr(factors(17));
#print("The return value of factors(10000): ");
#print_arr(factors(10000));

#isPrime tests
#print("The return value of isPrime(9): ");
#isPrime(9);
#print "\n";
#print("The return value of isPrime(17): ");
#isPrime(17);

print("The return value of map {isPrime($_)} (1..10000) is:" );
my @numbers = (1..10000);
my @output = map {isPrime($_)} @numbers;


#factors2 tests
#print("The return value of factors2(20): ");
#print_arr(factors2(20));
#print("\n");
#print("The return value of factors2(17): ");
#print_arr(factors2(17));
#print("The return value of factors2(10000): ");
#print_arr(factors2(10000));

#isPrime2 tests
#print("The return value of isPrime2(9): ");
#isPrime2(9);
#print "\n";
#print("The return value of isPrime2(17): ");
#isPrime2(17);


#my @numbers = (1..10000);
#my @output = map {isPrime2($_)} @numbers;

print("\n");
print
    qq{Command took },
    tv_interval($t0, [ gettimeofday() ]),
    qq{ seconds to run\n};