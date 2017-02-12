package ValueObject::Finance::Money::Comma;

use strict;
use warnings;
use Carp;
use ValueObject::Finance::Money::Exception::InvalidComma;
use base qw/ ValueObject::Finance::Money::Base /;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Finance::Money::Exception::InvalidComma->new($value))
        unless ($value =~ /^\d+(\,\d{1,2})?$/);
    return 1;
}

sub full_value {
    my $self = shift;

    my $adjusted_value = $self->value();
    $adjusted_value =~ s/,/\./g;
    $adjusted_value = sprintf('%.2f', $adjusted_value);
    $adjusted_value =~ s/\./,/g;

    return $adjusted_value;
}

1;

=head1 NAME

ValueObject::Finance::Money::Comma - Value Object for comma separated money amounts

=head1 SYNOPSIS

  use ValueObject::Finance::Money::Comma

  my $vo = ValueObject::Finance::Money::Comma->new(45,23);

=head1 DESCRIPTION

Provides Value Object for validation of monetary amounts using commas.

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Finance::Money::Exception::InvalidComma if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Finance::Money::Base>

=cut
