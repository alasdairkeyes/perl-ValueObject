#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Test::Exception;

use FindBin qw($Bin);
use lib "$Bin/../lib";


# Setup

use constant V1 => '27134617-b2ff-1f27-aa2a-9fb4732b197a';
use constant V2 => '27134617-b2ff-2f27-aa2a-9fb4732b197a';
use constant V3 => '27134617-b2ff-3f27-aa2a-9fb4732b197a';
use constant V4 => '27134617-b2ff-4f27-aa2a-9fb4732b197a';
use constant V5 => '27134617-b2ff-5f27-aa2a-9fb4732b197a';

require_ok('ValueObject::Identity::UUID');
require_ok('ValueObject::Identity::UUIDv1');
require_ok('ValueObject::Identity::UUIDv2');
require_ok('ValueObject::Identity::UUIDv3');
require_ok('ValueObject::Identity::UUIDv4');
require_ok('ValueObject::Identity::UUIDv5');

my $uuid = ValueObject::Identity::UUID->new(V1);
my $uuidv1 = ValueObject::Identity::UUIDv1->new(V1);
my $uuidv2 = ValueObject::Identity::UUIDv2->new(V2);
my $uuidv3 = ValueObject::Identity::UUIDv3->new(V3);
my $uuidv4 = ValueObject::Identity::UUIDv4->new(V4);
my $uuidv5 = ValueObject::Identity::UUIDv5->new(V5);

isa_ok($uuid, 'ValueObject::Identity::UUID');
isa_ok($uuidv1, 'ValueObject::Identity::UUIDv1');
isa_ok($uuidv2, 'ValueObject::Identity::UUIDv2');
isa_ok($uuidv3, 'ValueObject::Identity::UUIDv3');
isa_ok($uuidv4, 'ValueObject::Identity::UUIDv4');
isa_ok($uuidv5, 'ValueObject::Identity::UUIDv5');


# Test return values

ok($uuid->value() eq V1, 'value function for UUID');
ok($uuid eq V1, 'stringify for UUID');

ok($uuidv1->value() eq V1, 'value function for UUIDv1');
ok($uuidv1 eq V1, 'stringify for UUIDv1');

ok($uuidv2->value() eq V2, 'value function for UUIDv2');
ok($uuidv2 eq V2, 'stringify for UUIDv2');

ok($uuidv3->value() eq V3, 'value function for UUIDv3');
ok($uuidv3 eq V3, 'stringify for UUIDv3');

ok($uuidv4->value() eq V4, 'value function for UUIDv4');
ok($uuidv4 eq V4, 'stringify for UUIDv4');

ok($uuidv5->value() eq V5, 'value function for UUIDv5');
ok($uuidv5 eq V5, 'stringify for UUIDv5');

my $tests_run_count = 24;

my $tests = {
    'ValueObject::Identity::UUID'    => {
        'ok'    => [
            'bbf4eded-6bfb-1593-9d34-f8b184562572',
            'bbf4eded-6bfb-2593-9d34-f8b184562572',
            'bbf4eded-6bfb-3593-9d34-f8b184562572',
            'bbf4eded-6bfb-4593-9d34-f8b184562572',
            'bbf4eded-6bfb-5593-9d34-f8b184562572',
            'd44466bb-62b0-42aa-a4aa-783fa0580b2e',
            'd44466bb-62b0-42aa-b4aa-783fa0580b2e',
            'd44466bb-62b0-42aa-84aa-783fa0580b2e',
            'd44466bb-62b0-42aa-94aa-783fa0580b2e',
        ],
        'error'    => [
        ],
    },
    'ValueObject::Identity::UUIDv1'    => {
        'ok'    => [
            'bbf4eded-6bfb-1593-8d34-f8b184562572',
            'bbf4eded-6bfb-1593-9d34-f8b184562572',
            'bbf4eded-6bfb-1593-ad34-f8b184562572',
            'bbf4eded-6bfb-1593-bd34-f8b184562572',
        ],
        'error'    => [
            'bbf4eded-6bfb-2593-8d34-f8b184562572',
            'bbf4eded-6bfb-3593-8d34-f8b184562572',
            'bbf4eded-6bfb-4593-8d34-f8b184562572',
            'bbf4eded-6bfb-5593-8d34-f8b184562572',
        ],
    },
    'ValueObject::Identity::UUIDv2'    => {
        'ok'    => [
            'bbf4eded-6bfb-2593-8d34-f8b184562572',
            'bbf4eded-6bfb-2593-9d34-f8b184562572',
            'bbf4eded-6bfb-2593-ad34-f8b184562572',
            'bbf4eded-6bfb-2593-bd34-f8b184562572',
        ],
        'error'    => [
            'bbf4eded-6bfb-1593-8d34-f8b184562572',
            'bbf4eded-6bfb-3593-8d34-f8b184562572',
            'bbf4eded-6bfb-4593-8d34-f8b184562572',
            'bbf4eded-6bfb-5593-8d34-f8b184562572',
        ],
    },
    'ValueObject::Identity::UUIDv3'    => {
        'ok'    => [
            'bbf4eded-6bfb-3593-8d34-f8b184562572',
            'bbf4eded-6bfb-3593-9d34-f8b184562572',
            'bbf4eded-6bfb-3593-ad34-f8b184562572',
            'bbf4eded-6bfb-3593-bd34-f8b184562572',
        ],
        'error'    => [
            'bbf4eded-6bfb-1593-8d34-f8b184562572',
            'bbf4eded-6bfb-2593-8d34-f8b184562572',
            'bbf4eded-6bfb-4593-8d34-f8b184562572',
            'bbf4eded-6bfb-5593-8d34-f8b184562572',
        ],
    },
    'ValueObject::Identity::UUIDv4'    => {
        'ok'    => [
            'bbf4eded-6bfb-4593-8d34-f8b184562572',
            'bbf4eded-6bfb-4593-9d34-f8b184562572',
            'bbf4eded-6bfb-4593-ad34-f8b184562572',
            'bbf4eded-6bfb-4593-bd34-f8b184562572',
        ],
        'error'    => [
            'bbf4eded-6bfb-1593-8d34-f8b184562572',
            'bbf4eded-6bfb-2593-8d34-f8b184562572',
            'bbf4eded-6bfb-3593-8d34-f8b184562572',
            'bbf4eded-6bfb-5593-8d34-f8b184562572',
        ],
    },
    'ValueObject::Identity::UUIDv5'    => {
        'ok'    => [
            'bbf4eded-6bfb-5593-8d34-f8b184562572',
            'bbf4eded-6bfb-5593-9d34-f8b184562572',
            'bbf4eded-6bfb-5593-ad34-f8b184562572',
            'bbf4eded-6bfb-5593-bd34-f8b184562572',
        ],
        'error'    => [
            'bbf4eded-6bfb-1593-8d34-f8b184562572',
            'bbf4eded-6bfb-2593-8d34-f8b184562572',
            'bbf4eded-6bfb-3593-8d34-f8b184562572',
            'bbf4eded-6bfb-4593-8d34-f8b184562572',
        ],
    },
};

my $always_fail = [
    '',
    0,
    'sdfgdf',
    '2323523',
    undef,

    # Too long format
    'bbf4eded-6bfb-6593-ad34-f8b184562572a',
    'bbf4eded-6bfb-6593-ad34-f8b1845625726',
    'bbf4eded-6bfb-6593-ad34a-f8b184562572',
    'bbf4eded-6bfb-6593-ad346-f8b184562572',
    'bbf4eded-6bfb-6593a-ad34-f8b184562572',
    'bbf4eded-6bfb-65936-ad34-f8b184562572',
    'bbf4eded-6bfba-6593-ad34-f8b184562572',
    'bbf4eded-6bfb6-6593-ad34-f8b184562572',
    'bbf4ededa-6bfb-6593-ad34-f8b184562572',
    'bbf4eded6-6bfb-6593-ad34-f8b184562572',

    # Too short format
    'bbf4eded-6bfb-6593-ad34-f8b18456257',
    'bbf4eded-6bfb-6593-ad34-f8b18456257',
    'bbf4eded-6bfb-6593-ad3-f8b184562572',
    'bbf4eded-6bfb-6593-ad3-f8b184562572',
    'bbf4eded-6bfb-659-ad34-f8b184562572',
    'bbf4eded-6bfb-659-ad34-f8b184562572',
    'bbf4eded-6bf-6593-ad34-f8b184562572',
    'bbf4eded-6bf-6593-ad34-f8b184562572',
    'bbf4ede-6bfb-6593-ad34-f8b184562572',
    'bbf4ede-6bfb-6593-ad34-f8b184562572',

    # Check for right format, invalid characters
    'gbf4eded-6bfb-6593-ad34-f8b184562572',
    'bbf4eded-6gfb-6593-ad34-f8b184562572',
    'bbf4eded-6bfb-g593-ad34-f8b184562572',
    'bbf4eded-6bfb-6593-ag34-f8b184562572',
    'bbf4eded-6bfb-6593-ad34-g8b184562572',

    # Invalid version and first character of 4th block
    'bbf4eded-6bfb-6593-ad34-f8b184562572',
    'bbf4eded-6bfb-7593-ad34-f8b184562572',
    'bbf4eded-6bfb-8593-ad34-f8b184562572',
    'bbf4eded-6bfb-9593-ad34-f8b184562572',
    'bbf4eded-6bfb-9593-cd34-f8b184562572',
    'bbf4eded-6bfb-9593-zd34-f8b184562572',
    'bbf4eded-6bfb-9593-0d34-f8b184562572',
    'bbf4eded-6bfb-9593-7d34-f8b184562572',

];

foreach my $class (sort(keys(%$tests))) {
    my $test = $tests->{ $class };
    my $ok_tests     = $test->{ ok         };
    my $error_tests = $test->{ error     };

    foreach my $ok_test_uuid (@$ok_tests) {
        $tests_run_count++;
        isa_ok($class->new($ok_test_uuid), $class);
    }

    # Test Exceptions
    foreach my $error_test_uuid (@$error_tests, @$always_fail) {
        $tests_run_count++;
        my $error_value = $error_test_uuid || '';
        my $error_class = join('', $class, '::Exception::Invalid');
        throws_ok { $class->new($error_test_uuid) }
            $error_class,
            "Invalid value '$error_value' generates error class '$error_class' from '$class'";
    }
}

done_testing($tests_run_count);

