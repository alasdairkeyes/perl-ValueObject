package ValueObject::Exception::Base;

use strict;
use warnings;
use Carp;
use overload
    fallback    => 1,
    '""'        => \&overload_message;

sub new {
    my $class = shift;
    my $message = shift || '';
    my $value = shift;

    $value = (defined($value))
        ? $value
        : 'undef';

    return bless {
        message    => $message,
        value    => $value,
    }, $class;
}

sub message {
    my $self = shift;
    return $self->{ message };
}

sub value {
    my $self = shift;
    return $self->{ value };
}

sub overload_message {
    my $self = shift;
    return (ref($self) || $self) . ' - ' . $self->message . ' (' . $self->value . ')' . Carp::longmess();
}

1;
