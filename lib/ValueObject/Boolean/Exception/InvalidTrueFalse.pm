package ValueObject::Boolean::Exception::InvalidTrueFalse;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid true/false boolean';
    return $class->SUPER::new($message, @_);
}

1;
