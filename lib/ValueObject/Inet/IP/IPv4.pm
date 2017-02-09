package ValueObject::Inet::IP::IPv4;

use strict;
use warnings;
use Carp;
use Net::IP;
use ValueObject::Inet::IP::Exception::InvalidIPv4;
use base qw/ ValueObject::Inet::IP::Base /;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    my $ip = Net::IP->new($value);
    croak (ValueObject::Inet::IP::Exception::InvalidIPv4->new($value))
        unless (
            $ip &&
            $ip->size == 1 &&
            $ip->version == 4
        );
    return 1;
}

1;

=head1 NAME

ValueObject::Inet::IP::IPv4 - Value object to represent IPv4 addresses

=head1 SYNOPSIS

  use ValueObject::Inet::IP::IPv4;

  my $vo = ValueObject::Inet::IP::IPv4->new('192.168.0.1');

=head1 DESCRIPTION

ValueObject::Inet::IP::IPv4 provides Value Object for IPv4 address

Uses Net::IP for validation

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Inet::IP::Exception::InvalidIPv4 if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Inet::IP::Base>

=cut
