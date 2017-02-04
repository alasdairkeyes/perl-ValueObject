package ValueObject::Boolean::OnOff;

use strict;
use warnings;
use Carp;
use ValueObject::Boolean::Exception::InvalidOnOff;
use base qw/ ValueObject::Boolean::Base /;

my @on = (
    'on',
);

my @off = (
    'off',
);

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Boolean::Exception::InvalidOnOff->new($value))
        unless (grep { lc($_) eq lc($value) } @on, @off);
    return 1;
}

sub boolean {
    my $self = shift;
    return (grep { $_ eq lc($self->value) } @on)
        ? 1
        : 0;
}

1;

=head1 NAME

ValueObject::Boolean::OnOff - Boolean Value Object for on/off values

=head1 SYNOPSIS

  use ValueObject::Boolean::OnOff;

  my $vo = ValueObject::Boolean::OnOff->new('on');

=head1 DESCRIPTION

ValueObject::Boolean::OnOff provides Value Object for validation of boolean
values 'on' and 'off' (Case insensitive)

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Boolean::Exception::InvalidOnOff if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=item boolean()

Returns a boolean 0 or 1 for off/on

=back

=head1 SEE ALSO

L<ValueObject::Boolean>

=cut
