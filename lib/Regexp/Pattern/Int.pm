package Regexp::Pattern::Int;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;
#use utf8;

our %RE;

$RE{int} = {
    summary => 'Integer number',
    pat => qr/[+-]?[0-9]+/,
    examples => [
        {str=>'', anchor=>1, matches=>0},
        {str=>'123', anchor=>1, matches=>1},
        {str=>'+123', anchor=>1, matches=>1},
        {str=>'-123', anchor=>1, matches=>1},
        {str=>'123.1', anchor=>1, matches=>0},
        {str=>'1e2', anchor=>1, matches=>0},
    ],
};

$RE{uint} = {
    summary => 'Non-negative integer number',
    pat => qr/[+]?[0-9]+/,
    examples => [
        {str=>'', anchor=>1, matches=>0},
        {str=>'0', anchor=>1, matches=>1},
        {str=>'+0', anchor=>1, matches=>1},
        {str=>'-0', anchor=>1, matches=>0},
        {str=>'123', anchor=>1, matches=>1},
        {str=>'+123', anchor=>1, matches=>1},
        {str=>'-123', anchor=>1, matches=>0},
        {str=>'123.1', anchor=>1, matches=>0},
        {str=>'1e2', anchor=>1, matches=>0},
    ],
};

$RE{negint} = {
    summary => 'Negative integer number',
    pat => qr/-[1-9][0-9]*/,
    examples => [
        {str=>'', anchor=>1, matches=>0},
        {str=>'0', anchor=>1, matches=>0},
        {str=>'+0', anchor=>1, matches=>0},
        {str=>'-0', anchor=>1, matches=>0},

        {str=>'123', anchor=>1, matches=>0},
        {str=>'+123', anchor=>1, matches=>0},
        {str=>'-1', anchor=>1, matches=>1},
        #{str=>'-001', anchor=>1, matches=>0}, # currently we forbid zero prefix
        {str=>'-123', anchor=>1, matches=>1},
        {str=>'-123.1', anchor=>1, matches=>0},
        {str=>'-1e2', anchor=>1, matches=>0},
    ],
};

$RE{posint} = {
    summary => 'Positive integer number',
    pat => qr/[+]?[1-9][0-9]*/,
    examples => [
        {str=>'', anchor=>1, matches=>0},
        {str=>'0', anchor=>1, matches=>0},
        {str=>'+0', anchor=>1, matches=>0},
        {str=>'-0', anchor=>1, matches=>0},

        {str=>'1', anchor=>1, matches=>1},
        {str=>'123', anchor=>1, matches=>1},
        {str=>'+123', anchor=>1, matches=>1},
        {str=>'-1', anchor=>1, matches=>0},
        #{str=>'+001', anchor=>1, matches=>0}, # currently we forbid zero prefix
        {str=>'-123', anchor=>1, matches=>0},
        {str=>'123.1', anchor=>1, matches=>0},
        {str=>'1e2', anchor=>1, matches=>0},
    ],
};

1;
# ABSTRACT: Regexp patterns related to integers

=head1 SEE ALSO

L<Regexp::Pattern::Float>

L<Sah::Schema::uint>, L<Sah::Schema::negint>, L<Sah::Schema::negint>,
