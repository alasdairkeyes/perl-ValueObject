package ValueObject::Gender;

use strict;
use warnings;
use Carp;
use ValueObject::Gender::Exception::Invalid;
use base qw/ ValueObject::Base /;

my @enum = (
    'm',
    'male',
    'f',
    'female',
);

sub validate {
    my $self    = shift;
    my $value   = shift || '';
	croak (ValueObject::Gender::Exception::Invalid->new($value))
        unless (grep { lc($_) eq lc($value) } @enum);
    return 1;
}

1;
