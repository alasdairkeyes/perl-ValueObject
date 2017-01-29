package ValueObject::Inet::IP::IPv6;

use strict;
use warnings;
use Carp;
use Net::IP;
use ValueObject::Inet::IP::Exception::Invalid;
use base qw/ ValueObject::Inet::IP::Base /;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    my $ip = Net::IP->new($value);
	croak (ValueObject::Inet::IP::Exception::Invalid->new($value))
        unless (
            $ip &&
            $ip->size == 1 &&
            $ip->version() == 6
        );
    return 1;
}

1;
