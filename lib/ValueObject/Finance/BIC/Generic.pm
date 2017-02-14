package ValueObject::Finance::BIC::Generic;

use strict;
use warnings;
use Carp;
use base qw/ ValueObject::Finance::BIC::Base /;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
        ## Validate format from parent module, on error rethrow
    my $parts = eval {
        $self->validate_format($value);
    } || croak ($@);

    croak (ValueObject::Finance::BIC::Exception::Invalid->new($value))
        if ($parts->{ location } =~ /^.(0|1|2)$/);

    return 1;
}

1;

=head1 NAME

ValueObject::Finance::BIC::Generic - Value object for Generic BIC codes

=head1 SYNOPSIS

  use ValueObject::Finance::BIC::Generic;

  my $vo = ValueObject::Finance::BIC::Generic->new('DEUTDEFF');

=head1 DESCRIPTION

ValueObject::Finance::BIC::Generic provides Value Object for validation of BIC
codes, trditionally with the 2nd character of the location as '1'

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Finance::BIC::Exception::Invalid
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
