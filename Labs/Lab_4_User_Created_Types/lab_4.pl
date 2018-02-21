use Class::Struct;
#https://perldoc.perl.org/Class/Struct.html#The-struct()-function

struct ('Fraction' => 
{
    n => '$', 
    d => '$',
});

struct ('Mixed' =>
{
    w =>'$',
    n =>'$',
    d =>'$'
});

sub doubleValue {
    my $self = shift;
    my $value = 0;
    if($self->can('w')){ #https://stackoverflow.com/questions/2647273/how-can-i-check-if-an-object-has-a-specific-method
        $value = $self->w + ($self->n / $self->d);
    } else {
        $value = $self->n / $self->d;
    }
    return $value;
}

sub printNum {
    my $self = shift;
    if($self->can('w')){
        #https://stackoverflow.com/questions/13239515/perl-printing-object-properties
        print "${\$self->w} "."${\$self->n}"."/"."${\$self->d}\n";
    } else {
        print "${\$self->n}"."/"."${\$self->d}\n";
    }
}

sub isEqual {
    my $num1 = shift;
    my $num2 = shift; 
    $value1 = doubleValue($num1);
    $value2 = doubleValue($num2);
    
    $value1 == $value2 ? return 1 : return 0;
}

sub order {
    my $num1 = shift;
    my $num2 = shift; 
    $value1 = doubleValue($num1);
    $value2 = doubleValue($num2);
    #https://users.cs.cf.ac.uk/Dave.Marshall/PERL/node37.html
    return $value1 <=> $value2;
}

my $f1 = Fraction->new();
$f1->n(2);
$f1->d(4);

my $f2 = Fraction->new();
$f2->n(4);
$f2->d(8);

my $f3 = Fraction->new();
$f3->n(1);
$f3->d(5);

my $f4 = Fraction->new();
$f4->n(6);
$f4->d(4);

my $m1 = Mixed->new();
$m1-> w(1);
$m1-> n(1);
$m1-> d(2);

my $m2 = Mixed->new();
$m2-> w(1);
$m2-> n(2);
$m2-> d(4);

my $m3 = Mixed->new();
$m3-> w(2);
$m3-> n(1);
$m3-> d(2);

my $m4 = Mixed->new();
$m4-> w(1);
$m4-> n(1);
$m4-> d(8);

print $f1;
print "Printing fractions and mixed numbers.\n";
print "Printing f1 should be 2/4 and is: ";
printNum($f1);
print "Printing f2 should be 4/8 and is: ";
printNum($f2);
print "Printing f3 should be 1/5 and is: ";
printNum($f3);
print "Printing f4 should be 6/4 and is: ";
printNum($f4);
print "Printing m1 should be 1 1/2 and is: ";
printNum($m1);
print "Printing m2 should be 1 2/4 and is: ";
printNum($m2);
print "Printing m3 should be 2 1/2 and is: ";
printNum($m3);
print "Printing m4 should be 1 1/8 and is: ";
printNum($m4);
print "\n";

print "Testing isEqual\n";
print "isEqual(f1, f2) should be 1 and is: "."${\isEqual($f1, $f2)}\n";
print "isEqual(f3, f4) should be 0 and is: "."${\isEqual($f3, $f4)}\n";
print "isEqual(m4, f2) should be 0 and is: "."${\isEqual($m4, $f2)}\n";
print "isEqual(m2, f4) should be 1 and is: "."${\isEqual($m2, $f4)}\n";
print "isEqual(f2, m1) should be 0 and is: "."${\isEqual($f2, $m1)}\n";
print "isEqual(f4, m1) should be 1 and is: "."${\isEqual($f4, $m1)}\n";
print "isEqual(m1, m2) should be 1 and is: "."${\isEqual($m1, $m2)}\n";
print "isEqual(m1, m4) should be 0 and is: "."${\isEqual($m1, $m4)}\n";
print "\n";

print "Testing order\n";
print "order(f1, f2) should be 0 and is: "."${\order($f1, $f2)}\n";
print "order(f1, f4) should be -1 and is: "."${\order($f1, $f4)}\n";
print "order(f4, f3) should be 1 and is: "."${\order($f4, $f3)}\n";

print "order(f4, m1) should be 0 and is: "."${\order($f4, $m1)}\n";
print "order(f2, m1) should be -1 and is: "."${\order($f2, $m1)}\n";
print "order(f4, m4) should be 1 and is: "."${\order($f4, $m4)}\n";

print "order(m1, f4) should be 0 and is: "."${\order($m1, $f4)}\n";
print "order(m4, f4) should be -1 and is: "."${\order($m4, $f4)}\n";
print "order(m1, f2) should be 1 and is: "."${\order($m1, $f2)}\n";


print "order(m1, m2) should be 0 and is: "."${\order($m1, $m2)}\n";
print "order(m1, m3) should be -1 and is: "."${\order($m1, $m3)}\n";
print "order(m3, m4) should be 1 and is: "."${\order($m3, $m4)}\n";




