package ValueObject::Finance::BIC::Exception::InvalidCountry;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid country for BIC';
    return $class->SUPER::new($message, @_);
}

1;
