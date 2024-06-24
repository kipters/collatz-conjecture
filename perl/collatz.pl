use strict;
use warnings;

sub collatz {
    my $seed = shift;
    my $steps = 0;
    while ($seed > 1) {
        if ($seed % 2 == 0) {
            $seed /= 2;
        } else {
            $seed = $seed * 3 + 1;
        }
        $steps++;
    }
    return $steps;
}

sub main {
    my $collatz_result = 0;
    for my $seed (1 .. 1_000_000) {
        $collatz_result += collatz($seed);
    }
    print "steps $collatz_result\n";
}

main();
