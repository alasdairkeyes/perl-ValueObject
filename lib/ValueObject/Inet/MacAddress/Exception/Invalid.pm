package ValueObject::Inet::MacAddress::Exception::Invalid;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid MAC Address';
    return $class->SUPER::new($message, @_);
}

1;
