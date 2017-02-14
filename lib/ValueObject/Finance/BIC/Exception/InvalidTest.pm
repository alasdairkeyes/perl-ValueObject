package ValueObject::Finance::BIC::Exception::InvalidTest;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid test BIC';
    return $class->SUPER::new($message, @_);
}

1;
