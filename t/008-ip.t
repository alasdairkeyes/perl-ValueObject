#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 18;
use Test::Exception;

use FindBin qw($Bin);
use lib "$Bin/../lib";



# Setup

require_ok('ValueObject::Inet::IP::IPv4');
require_ok('ValueObject::Inet::IP::IPv6');
require_ok('ValueObject::Inet::IP');

my $valid_ipv4_address = '192.168.0.1';
my $valid_ipv6_address = 'fe80::5827:407e:d149:9d23';

my $direct_ipv4 = ValueObject::Inet::IP::IPv4->new($valid_ipv4_address);
my $direct_ipv6 = ValueObject::Inet::IP::IPv6->new($valid_ipv6_address);
my $factory_ipv4 = ValueObject::Inet::IP->new($valid_ipv4_address);
my $factory_ipv6 = ValueObject::Inet::IP->new($valid_ipv6_address);



# Instantiation Test

isa_ok($direct_ipv4, 'ValueObject::Inet::IP::IPv4');
isa_ok($direct_ipv4, 'ValueObject::Inet::IP::Base');

isa_ok($direct_ipv6, 'ValueObject::Inet::IP::IPv6');
isa_ok($direct_ipv6, 'ValueObject::Inet::IP::Base');

isa_ok($factory_ipv4, 'ValueObject::Inet::IP::IPv4');
isa_ok($factory_ipv4, 'ValueObject::Inet::IP::Base');

isa_ok($factory_ipv6, 'ValueObject::Inet::IP::IPv6');
isa_ok($factory_ipv6, 'ValueObject::Inet::IP::Base');




## Test return values

ok($direct_ipv4->value() eq $valid_ipv4_address, "value function for object '$valid_ipv4_address'");
ok($direct_ipv4 eq $valid_ipv4_address, "stringify for object '$valid_ipv4_address'");

ok($direct_ipv6->value() eq $valid_ipv6_address, "value function for object '$valid_ipv6_address'");
ok($direct_ipv6 eq $valid_ipv6_address, "stringify for object '$valid_ipv6_address'");



## Test Exceptions

throws_ok { ValueObject::Inet::IP::IPv4->new('sdfa') }
    'ValueObject::Inet::IP::Exception::Invalid',
    'Invalid string exception for IPv4';

throws_ok { ValueObject::Inet::IP::IPv6->new('sdfa') }
    'ValueObject::Inet::IP::Exception::Invalid',
    'Invalid string exception for IPv6';

throws_ok { ValueObject::Inet::IP->new('sdfa') }
    'ValueObject::Inet::IP::Exception::Invalid',
    'Invalid string exception for IP';
