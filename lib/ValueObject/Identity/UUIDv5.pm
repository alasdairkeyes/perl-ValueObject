package ValueObject::Identity::UUIDv5;

use strict;
use warnings;
use Carp;
use base qw/ ValueObject::Base /;
use ValueObject::Identity::UUIDv5::Exception::Invalid;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Identity::UUIDv5::Exception::Invalid->new($value))
        unless ($value =~ /^[0-9a-f]{8}\-[0-9a-f]{4}\-5[0-9a-f]{3}\-[89ab][0-9a-f]{3}\-[0-9a-f]{12}$/);
    return 1;
}

1;

=head1 NAME

ValueObject::Identity::UUIDv5 - Value object for V5 UUIDs

=head1 SYNOPSIS

  use ValueObject::Identity::UUIDv5;

  my $vo = ValueObject::Identity::UUIDv5->new('27134617-b2ff-5f27-aa2a-9fb4732b197a');

=head1 DESCRIPTION

ValueObject::Identity::UUIDv5 provides Value Object for validation of version 5
UUIDs

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Identity::UUIDv5::Exception::Invalid if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Base>

=cut
