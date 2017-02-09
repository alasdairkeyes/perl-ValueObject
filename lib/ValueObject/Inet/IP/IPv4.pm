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
