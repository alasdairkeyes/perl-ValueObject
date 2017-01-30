package ValueObject::Boolean::Exception::InvalidYesNo;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid yes/no boolean';
    return $class->SUPER::new($message, @_);
}

1;
