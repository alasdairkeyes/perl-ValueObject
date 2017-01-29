package ValueObject::Inet::Port;

use strict;
use warnings;
use Carp;
use ValueObject::Inet::Port::Exception::Invalid;
use base qw/ ValueObject::Base /;

my $min_port = 0;
my $max_port = 65535;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Inet::Port::Exception::Invalid->new($value))
        unless (
            $value =~ /^\d+$/ &&
            $value >= $min_port &&
            $value <= $max_port
        );
    return 1;
}

1;
