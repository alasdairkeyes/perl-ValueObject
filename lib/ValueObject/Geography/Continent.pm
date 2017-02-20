package ValueObject::Geography::Continent;

use strict;
use warnings;
use Carp;
use ValueObject::Geography::Continent::Exception::Invalid;
use base qw/ ValueObject::Base /;

my @enum = (
    'antarctica',
    'africa',
    'asia',
    'australia',
    'europe',
    'north america',
    'south america'
);

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Geography::Continent::Exception::Invalid->new($value))
        unless (grep { lc($_) eq lc($value) } @enum);
    return 1;
}

1;

=head1 NAME

ValueObject::Geography::Continent - Value object to represent continents

=head1 SYNOPSIS

  use ValueObject::Geography::Continent;

  my $vo = ValueObject::Geography::Continent->new('europe');

=head1 DESCRIPTION

ValueObject::Geography::Continent provides Value Object for validation of
continents (Case insensitive)

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Geography::Continent::Exception::Invalid if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Base>

=cut
