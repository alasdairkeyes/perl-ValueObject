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

=head1 NAME

ValueObject::Exception::Base - Base object for all value object exceptions

=head1 SYNOPSIS

  package ValueObject::CustomType::Exception::Invalid;

  use strict;
  use warnings;
  use base qw/ ValueObject::Exception::Base /;

  sub new {
    my $class = shift;
    my $message = 'Invalid CustomType';
    return $class->SUPER::new($message, @_);
  }

=head1 DESCRIPTION

ValueObject::Base is a base class from which all ValueObjects exceptions extend.
Only the new() sub routine needs defining when writing a custom exception

=head1 METHODS

=over 4

=item new($message = '', $value = '')

Creates a new object 

=item message()

Returns the exception message defined in $message

=item value()

Returns the value $value that caused the exception passed in at instantiation.

=item overload_message()

Returns a string combining $message and $value including stacktrace

=back

=head1 SEE ALSO

L<Carp>

=cut
