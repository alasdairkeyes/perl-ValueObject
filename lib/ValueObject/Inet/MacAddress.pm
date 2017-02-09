package ValueObject::Inet::MacAddress;

use strict;
use warnings;
use Carp;
use ValueObject::Inet::MacAddress::Exception::Invalid;
use base qw/ ValueObject::Base /;

my $dash_regex = qr/^([0-9a-f][0-9a-f]-){5}([0-9a-f][0-9a-f])$/i;
my $colon_regex = qr/^([0-9a-f][0-9a-f]:){5}([0-9a-f][0-9a-f])$/i;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    foreach my $regex ($dash_regex, $colon_regex) {
        return 1
            if ($value =~ /$regex/);
    }

    croak (ValueObject::Inet::MacAddress::Exception::Invalid->new($value))
}

1;

=head1 NAME

ValueObject::Inet::MacAddress - Value object to represent a MAC address

=head1 SYNOPSIS

  use ValueObject::Inet::MacAddress;

  my $vo = ValueObject::Inet::MacAddress->new('01-02-03-04-05-06');

=head1 DESCRIPTION

ValueObject::Inet::MacAddress provides Value Object for validation of a mac
addres.

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Inet::MacAddress::Exception::Invalid if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Base>

=cut
