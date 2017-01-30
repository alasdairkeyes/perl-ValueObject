package ValueObject::Inet::EmailAddress;

use strict;
use warnings;
use Carp;
use Email::Valid;
use ValueObject::Inet::EmailAddress::Exception::Invalid;
use base qw/ ValueObject::Base /;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    my $email_address = Email::Valid->address($value);
    croak (ValueObject::Inet::EmailAddress::Exception::Invalid->new($value))
        unless ($email_address);
    return 1;
}

1;
