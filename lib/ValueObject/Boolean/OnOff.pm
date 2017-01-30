package ValueObject::Boolean::OnOff;

use strict;
use warnings;
use Carp;
use ValueObject::Boolean::Exception::InvalidOnOff;
use base qw/ ValueObject::Boolean::Base /;

my @on = (
    'on',
);

my @off = (
    'off',
);

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Boolean::Exception::InvalidOnOff->new($value))
        unless (grep { lc($_) eq lc($value) } @on, @off);
    return 1;
}

sub boolean {
    my $self = shift;
    return (grep { $_ eq lc($self->value) } @on)
        ? 1
        : 0;
}

1;
