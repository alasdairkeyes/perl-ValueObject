package ValueObject::Boolean::Base;

use strict;
use warnings;
use Carp;
use base qw/ ValueObject::Base /;

sub boolean {
	my $self = shift;
	croak "Invalid boolean function for " . (ref($self) || $self);
}

1;
