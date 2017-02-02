package ValueObject::Boolean::Base;

use strict;
use warnings;
use Carp;
use base qw/ ValueObject::Base /;

sub boolean {
    my $self = shift;
    croak "Invalid boolean function for " . (ref($self) || $self);
}

1;

=head1 NAME

ValueObject::Boolean::Base - Base object for all Boolean Value Objects

=head1 SYNOPSIS

  use base qw/ ValueObject::Boolean::Base /;

  sub validate {
    my $self    = shift;
    my $value   = shift || '';
    
    # if $value validates
    #     return 1
    # else
    #     Throw exception on failer
  }

  sub boolean {
    my $self = shift;
    return 1 if ($self->value eq 'xx');
    return 0;
  }

=head1 DESCRIPTION

ValueObject::Boolean::Base is a base class from which all Boolean ValueObjects extend.
The validate() and boolean() sub routine needs overriding

=head1 METHODS

=over 4

=item validate()

Called during instantiation to validate $value

=item boolean()

Needs to return a 0 or 1 value based on the value of the Boolean Value Object

=back

=head1 SEE ALSO

L<Carp>,
L<ValueObject::Base>

=cut
