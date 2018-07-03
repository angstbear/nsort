#!/usr/bin/env perl6

use v6;

sub MAIN ( Bool :$reverse = False, *@values ) {
    if ($reverse) {
       .say for reverse( @values.sort: { $^a.&naturally, $^a } );
    }
    else {
       .say for @values.sort: { $^a.&naturally, $^a };
    }
}

sub naturally ($a) {
    $a.lc.subst(/(\d+)/, -> $/ { 0 ~ $0.chars.chr ~ $0 }, :g) ~ "\x0" ~ $a
}
