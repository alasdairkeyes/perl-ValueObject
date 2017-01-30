package ValueObject::Inet::MacAddress;

use strict;
use warnings;
use Carp;
use ValueObject::Inet::MacAddress::Exception::Invalid;
use base qw/ ValueObject::Base /;

my $dash_regex = qr/^([0-9a-f][0-9a-f]-){5}([0-9a-f][0-9a-f])$/i;
my $colon_regex = qr/^([0-9a-f][0-9a-f]:){5}([0-9a-f][0-9a-f])$/i;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    foreach my $regex ($dash_regex, $colon_regex) {
        return 1
            if ($value =~ /$regex/);
    }

    croak (ValueObject::Inet::MacAddress::Exception::Invalid->new($value))
}

1;
