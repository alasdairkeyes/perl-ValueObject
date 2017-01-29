package ValueObject::Boolean;

use strict;
use warnings;
use Carp;
use ValueObject::Boolean::Exception::Invalid;
use ValueObject::Boolean::YesNo;
use ValueObject::Boolean::TrueFalse;
use ValueObject::Boolean::OnOff;
use base qw/ ValueObject::Base /;

sub new {
    my $class   = shift;
    my $value   = shift;

	my $boolean_object;

	foreach my $boolean_type ('ValueObject::Boolean::YesNo','ValueObject::Boolean::TrueFalse','ValueObject::Boolean::OnOff') {
		$boolean_object = eval {
			$boolean_type->new($value);
		};
		if ($boolean_object) {
			return $boolean_object;
		}
	}

	croak (ValueObject::Boolean::Exception::Invalid->new($value));
}

1;
