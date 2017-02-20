package ValueObject::Inet::Domain::Exception::Invalid;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid domain name';
    return $class->SUPER::new($message, @_);
}

1;
