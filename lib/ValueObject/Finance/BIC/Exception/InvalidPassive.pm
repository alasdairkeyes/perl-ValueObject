package ValueObject::Finance::BIC::Exception::InvalidPassive;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid passive BIC';
    return $class->SUPER::new($message, @_);
}

1;
