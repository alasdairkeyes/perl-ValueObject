package ValueObject::Inet::IP::Exception::InvalidIPv6;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid IPv6 address';
    return $class->SUPER::new($message, @_);
}

1;
