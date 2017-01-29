package ValueObject::Inet::IP;

use strict;
use warnings;
use Carp;
use ValueObject::Inet::IP::Exception::Invalid;
use ValueObject::Inet::IP::IPv4;
use ValueObject::Inet::IP::IPv6;
use base qw/ ValueObject::Base /;

sub new {
    my $class   = shift;
    my $value   = shift;

	my $ip_object;

	foreach my $ip_type ('ValueObject::Inet::IP::IPv4', 'ValueObject::Inet::IP::IPv6') {
		$ip_object = eval {
			$ip_type->new($value);
		};
		if ($ip_object) {
			return $ip_object;
		}
	}

	croak (ValueObject::Inet::IP::Exception::Invalid->new($value));
}

1;
