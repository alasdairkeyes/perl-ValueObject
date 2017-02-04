package ValueObject::Identity::UUIDv4;

use strict;
use warnings;
use Carp;
use base qw/ ValueObject::Base /;
use ValueObject::Identity::UUIDv4::Exception::Invalid;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Identity::UUIDv4::Exception::Invalid->new($value))
        unless ($value =~ /^[0-9a-f]{8}\-[0-9a-f]{4}\-4[0-9a-f]{3}\-[89ab][0-9a-f]{3}\-[0-9a-f]{12}$/);
    return 1;
}

1;

=head1 NAME

ValueObject::Identity::UUIDv4 - Value object for V4 UUIDs

=head1 SYNOPSIS

  use ValueObject::Identity::UUIDv4;

'27134617-b2ff-5f27-aa2a-9fb4732b197a'

  my $vo = ValueObject::Identity::UUIDv4->new('27134617-b2ff-4f27-aa2a-9fb4732b197a');

=head1 DESCRIPTION

ValueObject::Identity::UUIDv4 provides Value Object for validation of version 4
UUIDs

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Identity::UUIDv4::Exception::Invalid if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Base>

=cut
