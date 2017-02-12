package ValueObject::Geography::Country::Codes::Base;

use strict;
use warnings;
use Carp;
use base qw/ ValueObject::Base /;

1;

=head1 NAME

ValueObject::Geography::Country::Codes::Base - Base object for all Boolean Value Objects

=head1 SYNOPSIS

  use base qw/ ValueObject::Geography::Country::Codes::Base /;

  sub validate {
    my $self    = shift;
    my $value   = shift || '';

    # if $value validates
    #     return 1
    # else
    #     Throw exception on failer
  }

=head1 DESCRIPTION

ValueObject::Geography::Country::Codes::Base is a base class from which all
Country Code ValueObjects extend.
The validate() sub routine needs overriding

=head1 METHODS

=over 4

=item validate()

Called during instantiation to validate $value

=back

=head1 SEE ALSO

L<Carp>,
L<ValueObject::Base>

=cut
