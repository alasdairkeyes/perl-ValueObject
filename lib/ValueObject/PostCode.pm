package ValueObject::PostCode;

use strict;
use warnings;
use Carp;
use base qw/ ValueObject::Base /;
use ValueObject::PostCode::Exception::Invalid;



sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::PostCode::Exception::Invalid->new($value))
        unless ($value =~ /^([A-Z][0-9]|[A-Z][0-9]{2}|[A-Z]{2}[0-9]|[A-Z]{2}[0-9]{2}|[A-Z][0-9][A-Z]|[A-Z][A-Z][0-9][A-Z])\s?\d[ABDEFGHJLNPQRSTUWXYZ]{2}$/i);
    return 1;
}

1;

=head1 NAME

ValueObject::PostCode - Value object to represent uk post codes

=head1 SYNOPSIS

  use ValueObject::PostCode;

  my $vo = ValueObject::PostCode->new('B1 1BG');

=head1 DESCRIPTION

ValueObject::PostCode provides Value Object for validation of uk
post codes - case insensitive.

# Guide to valid regex format taken from https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/283357/ILRSpecification2013_14Appendix_C_Dec2012_v1.pdf

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::PostCode::Exception::Invalid if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Base>

=cut
