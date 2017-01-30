package ValueObject::Finance::Money;

use strict;
use warnings;
use Carp;
use ValueObject::Finance::Money::Period;
use ValueObject::Finance::Money::Comma;
use ValueObject::Finance::Money::Exception::Invalid;
use base qw/ ValueObject::Base /;

sub new {
    my $class   = shift;
    my $value   = shift;

	my $currency_object;

	foreach my $currency_type ('ValueObject::Finance::Money::Period', 'ValueObject::Finance::Money::Comma') {
		$currency_object = eval {
			$currency_type->new($value);
		};
		if ($currency_object) {
			return $currency_object;
		}
	}

	croak (ValueObject::Finance::Money::Exception::Invalid->new($value));
}

1;
