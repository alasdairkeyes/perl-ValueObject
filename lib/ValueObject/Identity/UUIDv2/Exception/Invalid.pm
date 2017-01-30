package ValueObject::Identity::UUIDv2::Exception::Invalid;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid version 2 UUID';
    return $class->SUPER::new($message, @_);
}

1;
