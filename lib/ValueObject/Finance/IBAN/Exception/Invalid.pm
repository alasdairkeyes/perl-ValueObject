package ValueObject::Finance::IBAN::Exception::Invalid;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid IBAN';
    return $class->SUPER::new($message, @_);
}

1;
