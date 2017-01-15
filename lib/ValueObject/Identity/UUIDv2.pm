package ValueObject::Identity::UUIDv2;

use strict;
use warnings;
use Carp;
use base qw/ ValueObject::Base /;
use ValueObject::Identity::UUIDv2::Exception::Invalid;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
	croak (ValueObject::Identity::UUIDv2::Exception::Invalid->new($value))
        unless ($value =~ /^[0-9a-f]{8}\-[0-9a-f]{4}\-2[0-9a-f]{3}\-[89ab][0-9a-f]{3}\-[0-9a-f]{12}$/);
    return 1;
}

1;
