package ValueObject::Finance::BIC::Passive;

use strict;
use warnings;
use Carp;
use ValueObject::Finance::BIC::Exception::InvalidPassive;
use base qw/ ValueObject::Finance::BIC::Base /;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
        ## Validate format from parent module, on error rethrow
    my $parts = eval {
        $self->validate_format($value);
    } || croak ($@);

    croak (ValueObject::Finance::BIC::Exception::InvalidPassive->new($value))
        unless ($parts->{ location } =~ /^.1$/);

    return 1;
}

1;

=head1 NAME

ValueObject::Finance::BIC::Passive - Value object for Passive BIC codes

=head1 SYNOPSIS

  use ValueObject::Finance::BIC::Passive;

  my $vo = ValueObject::Finance::BIC::Passive->new('DEUTDEF1XXX');

=head1 DESCRIPTION

ValueObject::Finance::BIC::Passive provides Value Object for validation of
passive BIC codes, trditionally with the 2nd character of the location as '1'

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Finance::BIC::Exception::InvalidPassive
ValueObject::Finance::BIC::Exception::InvalidFormat
ValueObject::Finance::BIC::Exception::InvalidCountry

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Finance::BIC::Base>

=cut
