package ValueObject::PostCode;

use strict;
use warnings;
use Carp;
use base qw/ ValueObject::Base /;
use ValueObject::PostCode::Exception::Invalid;

# Guide to valid regex format taken from https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/283357/ILRSpecification2013_14Appendix_C_Dec2012_v1.pdf

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::PostCode::Exception::Invalid->new($value))
        unless ($value =~ /^([A-Z][0-9]|[A-Z][0-9]{2}|[A-Z]{2}[0-9]|[A-Z]{2}[0-9]{2}|[A-Z][0-9][A-Z]|[A-Z][A-Z][0-9][A-Z])\s?\d[ABDEFGHJLNPQRSTUWXYZ]{2}$/i);
    return 1;
}

1;
