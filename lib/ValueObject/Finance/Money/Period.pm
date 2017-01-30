package ValueObject::Finance::Money::Period;

use strict;
use warnings;
use Carp;
use ValueObject::Finance::Money::Exception::InvalidPeriod;
use base qw/ ValueObject::Finance::Money::Base /;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
	croak (ValueObject::Finance::Money::Exception::InvalidPeriod->new($value))
		unless ($value =~ /^\d+\.\d{2}$/);
    return 1;
}

1;
