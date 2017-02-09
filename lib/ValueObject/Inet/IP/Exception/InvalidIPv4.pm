package ValueObject::Inet::IP::Exception::InvalidIPv4;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid IPv4 address';
    return $class->SUPER::new($message, @_);
}

1;
