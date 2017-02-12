package ValueObject::Geography::Country::Codes::Exception::Invalid3Character;

use strict;
use warnings;
use base qw/ ValueObject::Exception::Base /;

sub new {
    my $class = shift;
    my $message = 'Invalid ISO-3166 alpha-3 code';
    return $class->SUPER::new($message, @_);
}

1;
