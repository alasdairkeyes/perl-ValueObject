package ValueObject::Finance::Currency::Code;

use strict;
use warnings;
use Carp;
use ValueObject::Finance::Currency::Exception::InvalidCode;
use base qw/ ValueObject::Base /;

my $currency_codes = {
    aed => 1, 
    afn => 1, 
    all => 1, 
    amd => 1, 
    ang => 1, 
    aoa => 1, 
    ars => 1, 
    aud => 1, 
    awg => 1, 
    azn => 1, 
    bam => 1, 
    bbd => 1, 
    bdt => 1, 
    bgn => 1, 
    bhd => 1, 
    bif => 1, 
    bmd => 1, 
    bnd => 1, 
    bob => 1, 
    brl => 1, 
    bsd => 1, 
    btn => 1, 
    bwp => 1, 
    byr => 1, 
    bzd => 1, 
    cad => 1, 
    cdf => 1, 
    chf => 1, 
    clf => 1, 
    clp => 1, 
    cny => 1, 
    cop => 1, 
    crc => 1, 
    cup => 1, 
    cve => 1, 
    czk => 1, 
    djf => 1, 
    dkk => 1, 
    dop => 1, 
    dzd => 1, 
    eek => 1, 
    egp => 1, 
    etb => 1, 
    eur => 1, 
    fjd => 1, 
    fkp => 1, 
    gbp => 1, 
    gel => 1, 
    ghs => 1, 
    gip => 1, 
    gmd => 1, 
    gnf => 1, 
    gtq => 1, 
    gyd => 1, 
    hkd => 1, 
    hnl => 1, 
    hrk => 1, 
    htg => 1, 
    huf => 1, 
    idr => 1, 
    ils => 1, 
    inr => 1, 
    iqd => 1, 
    irr => 1, 
    isk => 1, 
    jep => 1, 
    jmd => 1, 
    jod => 1, 
    jpy => 1, 
    kes => 1, 
    kgs => 1, 
    khr => 1, 
    kmf => 1, 
    kpw => 1, 
    krw => 1, 
    kwd => 1, 
    kyd => 1, 
    kzt => 1, 
    lak => 1, 
    lbp => 1, 
    lkr => 1, 
    lrd => 1, 
    lsl => 1, 
    ltl => 1, 
    lvl => 1, 
    lyd => 1, 
    mad => 1, 
    mdl => 1, 
    mga => 1, 
    mkd => 1, 
    mmk => 1, 
    mnt => 1, 
    mop => 1, 
    mro => 1, 
    mur => 1, 
    mvr => 1, 
    mwk => 1, 
    mxn => 1, 
    myr => 1, 
    mzn => 1, 
    nad => 1, 
    ngn => 1, 
    nio => 1, 
    nok => 1, 
    npr => 1, 
    nzd => 1, 
    omr => 1, 
    pab => 1, 
    pen => 1, 
    pgk => 1, 
    php => 1, 
    pkr => 1, 
    pln => 1, 
    pyg => 1, 
    qar => 1, 
    ron => 1, 
    rsd => 1, 
    rub => 1, 
    rwf => 1, 
    sar => 1, 
    sbd => 1, 
    scr => 1, 
    sdg => 1, 
    sek => 1, 
    sgd => 1, 
    shp => 1, 
    sll => 1, 
    sos => 1, 
    srd => 1, 
    std => 1, 
    svc => 1, 
    syp => 1, 
    szl => 1, 
    thb => 1, 
    tjs => 1, 
    tmt => 1, 
    tnd => 1, 
    top => 1, 
    try => 1, 
    ttd => 1, 
    twd => 1, 
    tzs => 1, 
    uah => 1, 
    ugx => 1, 
    usd => 1, 
    uyu => 1, 
    uzs => 1, 
    vef => 1, 
    vnd => 1, 
    vuv => 1, 
    wst => 1, 
    xaf => 1, 
    xcd => 1, 
    xdr => 1, 
    xof => 1, 
    xpf => 1, 
    yer => 1, 
    zar => 1, 
    zmk => 1, 
    zwl => 1, 
};

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Finance::Currency::Exception::InvalidCode->new($value))
        unless ($currency_codes->{ lc($value) });
    return 1;
}

1;

=head1 NAME

ValueObject::Finance::Currency::Code - Value Object for Currency Codes

=head1 SYNOPSIS

  use ValueObject::Finance::Currency::Code;

  my $vo = ValueObject::Finance::Currency::Code->new('gbp');

=head1 DESCRIPTION

Provides Value Object for validation of ISO 4217 currency codes. Case insensitive.

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Finance::Currency::Exception::InvalidCode if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Base>

=cut
