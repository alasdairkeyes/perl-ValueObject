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

=head1 NAME

ValueObject::Identity::UUID - Value Object for UUIDs

=head1 SYNOPSIS

  use ValueObject::Identity::UUID;

  my $vo = ValueObject::Identity::UUID->new('yes');

=head1 DESCRIPTION

ValueObject::Identity::UUID provides Value Object for validation of UUID values.

Returns one of 
ValueObject::Identity::UUIDv1
ValueObject::Identity::UUIDv2
ValueObject::Identity::UUIDv3
ValueObject::Identity::UUIDv4
ValueObject::Identity::UUIDv5

or Exception object ValueObject::Identity::UUID::Exception::Invalid

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Identity::UUID::Exception::Invalid if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Identity::UUIDv1>,
L<ValueObject::Identity::UUIDv2>,
L<ValueObject::Identity::UUIDv3>,
L<ValueObject::Identity::UUIDv4>,
L<ValueObject::Identity::UUIDv5>,

=cut
