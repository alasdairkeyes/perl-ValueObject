package ValueObject::Base;

use strict;
use warnings;
use Carp;
use overload
    fallback    => 1,
    '""'        => \&value;

sub new {
    my $class   = shift;
    my $value   = shift;

    my $vars    = {
        value   => $value
    };

    my $self = bless $vars, $class;
    $self->validate($value);
    return $self;
}

sub validate {
    my $self = shift;
    croak "Invalid validator for " . ref($self);
}

sub value {
    my $self = shift;
    return $self->{ value };
}

1;
