package ValueObject::Identity::UUID;

use strict;
use warnings;
use Carp;
use ValueObject::Identity::UUIDv1;
use ValueObject::Identity::UUIDv2;
use ValueObject::Identity::UUIDv3;
use ValueObject::Identity::UUIDv4;
use ValueObject::Identity::UUIDv5;
use base qw/ ValueObject::Base /;
use ValueObject::Identity::UUID::Exception::Invalid;

sub validate {
    my $self    = shift;
    my $value   = shift || '';

    foreach my $uuid_type (
		'ValueObject::Identity::UUIDv1',
		'ValueObject::Identity::UUIDv2',
		'ValueObject::Identity::UUIDv3',
		'ValueObject::Identity::UUIDv4',
		'ValueObject::Identity::UUIDv5'
	) {
        my $uuid_object = eval {
            $uuid_type->new($value);
        };
        if ($uuid_object) {
            return $uuid_object;
        }
    }

    croak (ValueObject::Identity::UUID::Exception::Invalid->new($value));
}

1;
