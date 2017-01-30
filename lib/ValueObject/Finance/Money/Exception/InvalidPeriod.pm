package ValueObject::Finance::Money::Exception::InvalidPeriod;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid period separated money';
    return $class->SUPER::new($message, @_);
}

1;
