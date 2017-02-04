package ValueObject::Finance::Money::Comma;

use strict;
use warnings;
use Carp;
use ValueObject::Finance::Money::Exception::InvalidComma;
use base qw/ ValueObject::Finance::Money::Base /;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Finance::Money::Exception::InvalidComma->new($value))
        unless ($value =~ /^\d+(\,\d{1,2})?$/);
    return 1;
}

sub full_value {
	my $self = shift;

	my $adjusted_value = $self->value();
	$adjusted_value =~ s/,/\./g;
	$adjusted_value = sprintf('%.2f', $adjusted_value);
	$adjusted_value =~ s/\./,/g;

	return $adjusted_value;
}

1;
