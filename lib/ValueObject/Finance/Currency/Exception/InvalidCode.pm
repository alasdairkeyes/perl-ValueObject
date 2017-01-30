package ValueObject::Finance::Currency::Exception::InvalidCode;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid currency code';
    return $class->SUPER::new($message, @_);
}

1;
