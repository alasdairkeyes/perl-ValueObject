package ValueObject::Geography::Country::Codes::Exception::Invalid2Character;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid ISO-3166 alpha-2 code';
    return $class->SUPER::new($message, @_);
}

1;
