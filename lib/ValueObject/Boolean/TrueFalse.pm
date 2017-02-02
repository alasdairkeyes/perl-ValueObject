package ValueObject::Boolean::TrueFalse;

use strict;
use warnings;
use Carp;
use ValueObject::Boolean::Exception::InvalidTrueFalse;
use base qw/ ValueObject::Boolean::Base /;

my @true = (
    't',
    'true'
);

my @false = (
    'f',
    'false',
);

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Boolean::Exception::InvalidTrueFalse->new($value))
        unless (grep { lc($_) eq lc($value) } @true, @false);
    return 1;
}

sub boolean {
    my $self = shift;
    return (grep { $_ eq lc($self->value) } @true)
        ? 1
        : 0;
}

1;

=head1 NAME

ValueObject::Boolean::TrueFalse - Boolean Value Object for true/false values

=head1 SYNOPSIS

  use base qw/ ValueObject::Boolean::TrueFalse /;

  my $vo = ValueObject::Boolean::TrueFalse->new('true');

=head1 DESCRIPTION

ValueObject::Boolean::TrueFalse provides Value Object for validation of boolean
values 'true' and 'false' (Case insensitive)

Accepts values 't', 'true', 'f', 'false' lowercase and uppercase.

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=item boolean()

Returns a boolean 0 or 1 for false/true

=back

=head1 SEE ALSO

L<ValueObject::Boolean>

=cut
