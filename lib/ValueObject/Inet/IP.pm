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

=head1 NAME

ValueObject::Inet::IP - Inet::IP Value Object

=head1 SYNOPSIS

  use ValueObject::Inet::IP;

  my $vo = ValueObject::Inet::IP->new('192.168.0.1');

=head1 DESCRIPTION

ValueObject::Inet::IP provides Value Object for validation of IP addresses

Returns one of 
ValueObject::Inet::IP::IPv4
ValueObject::Inet::IP::IPv6

or Exception object ValueObject::Inet::IP::Exception::Invalid

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Inet::IP::Exception::Invalid if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Inet::IP::IPv4>, L<ValueObject::Inet::IP::IPv6>

=cut
