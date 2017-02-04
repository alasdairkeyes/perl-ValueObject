package ValueObject::Gender;

use strict;
use warnings;
use Carp;
use ValueObject::Gender::Exception::Invalid;
use base qw/ ValueObject::Base /;

my @enum = (
    'm',
    'male',
    'f',
    'female',
);

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Gender::Exception::Invalid->new($value))
        unless (grep { lc($_) eq lc($value) } @enum);
    return 1;
}

1;

=head1 NAME

ValueObject::Gender - Value object to represent gender

=head1 SYNOPSIS

  use ValueObject::Gender;

  my $vo = ValueObject::Gender->new('male');

=head1 DESCRIPTION

ValueObject::Gender provides Value Object for validation of gender
values 'male', 'm', 'female', 'f' (Case insensitive)

This is only to determine biological gender.

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Gender::Exception::Invalid if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Base>

=cut
