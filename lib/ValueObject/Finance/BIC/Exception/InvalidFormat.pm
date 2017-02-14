package ValueObject::Finance::BIC::Exception::InvalidFormat;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid format for BIC';
    return $class->SUPER::new($message, @_);
}

1;
