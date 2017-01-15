package ValueObject::Identity::UUIDv5;

use strict;
use warnings;
use Carp;
use base qw/ ValueObject::Base /;
use ValueObject::Identity::UUIDv5::Exception::Invalid;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
	croak (ValueObject::Identity::UUIDv5::Exception::Invalid->new($value))
        unless ($value =~ /^[0-9a-f]{8}\-[0-9a-f]{4}\-5[0-9a-f]{3}\-[89ab][0-9a-f]{3}\-[0-9a-f]{12}$/);
    return 1;
}

1;
