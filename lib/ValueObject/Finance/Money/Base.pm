package ValueObject::Finance::Money::Base;

use strict;
use warnings;
use Carp;
use base qw/ ValueObject::Base /;

sub full_value {
    my $self = shift;
    croak "Invalid full_value() for " . (ref($self) || $self);
}

1;
