package ValueObject::Finance::BIC::Exception::InvalidReverse;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid reverse BIC';
    return $class->SUPER::new($message, @_);
}

1;
