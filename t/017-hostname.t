#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Test::Exception;

use FindBin qw($Bin);
use lib "$Bin/../lib";

# Setup

require_ok('ValueObject::Inet::Hostname');

my @valid_hostnames = (
    'google.com',
    'google.co.uk',
    'google.biz',
    'google.voyage',
    'google.xn--80akhbyknj4f',
    'subdomain.google.com',
    'g-oogle.com',
    'g_oogle.com',
    'host.local',
    'gadg',
    1,
    '3',
);

my @invalid_hostnames = (
    undef,
    '',
    -5,
    'google.com.',
    '.google.com',
    '-google.com',
    'google-.com',
    'google.com-',
);

my $valid_hostname = $valid_hostnames[0];

my $valid_hostname_vo = ValueObject::Inet::Hostname->new($valid_hostname);


# Instantiation Test

isa_ok($valid_hostname_vo, 'ValueObject::Inet::Hostname');



## Test return values

ok($valid_hostname_vo->value() eq $valid_hostname, "value function for object '$valid_hostname'");
ok($valid_hostname_vo eq $valid_hostname, "stringify for object '$valid_hostname'");

my $test_count = 4;

# Test valid/invalid examples

foreach my $test_valid_hostname (@valid_hostnames) {
    $test_count++;
    isa_ok(ValueObject::Inet::Hostname->new($test_valid_hostname), "ValueObject::Inet::Hostname",  $test_valid_hostname);
}

foreach my $test_valid_hostname (@invalid_hostnames) {
    $test_count++;
    my $print_test_valid_hostname = defined($test_valid_hostname)
        ? $test_valid_hostname
        : '<undef>';

    throws_ok { ValueObject::Inet::Hostname->new($test_valid_hostname) }
        'ValueObject::Inet::Hostname::Exception::Invalid',
        "Invalid exception for ValueObject::Inet::Hostname ($print_test_valid_hostname)";
}


done_testing($test_count);
