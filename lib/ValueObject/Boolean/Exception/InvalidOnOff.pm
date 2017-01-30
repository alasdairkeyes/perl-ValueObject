package ValueObject::Boolean::Exception::InvalidOnOff;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid on/off boolean';
    return $class->SUPER::new($message, @_);
}

1;
