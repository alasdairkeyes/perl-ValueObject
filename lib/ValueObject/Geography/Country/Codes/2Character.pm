package ValueObject::Geography::Country::Codes::2Character;

use strict;
use warnings;
use Carp;
use ValueObject::Geography::Country::Codes::Exception::Invalid2Character;
use base qw/ ValueObject::Geography::Country::Codes::Base /;

my @codes = qw/
    AF
    AX
    AL
    DZ
    AS
    AD
    AO
    AI
    AQ
    AG
    AR
    AM
    AW
    AU
    AT
    AZ
    BS
    BH
    BD
    BB
    BY
    BE
    BZ
    BJ
    BM
    BT
    BO
    BQ
    BA
    BW
    BV
    BR
    IO
    BN
    BG
    BF
    BI
    CV
    KH
    CM
    CA
    KY
    CF
    TD
    CL
    CN
    CX
    CC
    CO
    KM
    CG
    CD
    CK
    CR
    CI
    HR
    CU
    CW
    CY
    CZ
    DK
    DJ
    DM
    DO
    EC
    EG
    SV
    GQ
    ER
    EE
    ET
    FK
    FO
    FJ
    FI
    FR
    GF
    PF
    TF
    GA
    GM
    GE
    DE
    GH
    GI
    GR
    GL
    GD
    GP
    GU
    GT
    GG
    GN
    GW
    GY
    HT
    HM
    VA
    HN
    HK
    HU
    IS
    IN
    ID
    IR
    IQ
    IE
    IM
    IL
    IT
    JM
    JP
    JE
    JO
    KZ
    KE
    KI
    KP
    KR
    KW
    KG
    LA
    LV
    LB
    LS
    LR
    LY
    LI
    LT
    LU
    MO
    MK
    MG
    MW
    MY
    MV
    ML
    MT
    MH
    MQ
    MR
    MU
    YT
    MX
    FM
    MD
    MC
    MN
    ME
    MS
    MA
    MZ
    MM
    NA
    NR
    NP
    NL
    NC
    NZ
    NI
    NE
    NG
    NU
    NF
    MP
    NO
    OM
    PK
    PW
    PS
    PA
    PG
    PY
    PE
    PH
    PN
    PL
    PT
    PR
    QA
    RE
    RO
    RU
    RW
    BL
    SH
    KN
    LC
    MF
    PM
    VC
    WS
    SM
    ST
    SA
    SN
    RS
    SC
    SL
    SG
    SX
    SK
    SI
    SB
    SO
    ZA
    GS
    SS
    ES
    LK
    SD
    SR
    SJ
    SZ
    SE
    CH
    SY
    TW
    TJ
    TZ
    TH
    TL
    TG
    TK
    TO
    TT
    TN
    TR
    TM
    TC
    TV
    UG
    UA
    AE
    GB
    US
    UM
    UY
    UZ
    VU
    VE
    VN
    VG
    VI
    WF
    EH
    YE
    ZM
    ZW
/;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Geography::Country::Codes::Exception::Invalid2Character->new($value))
        unless (grep { lc($_) eq lc($value) } @codes);
    return 1;
}

1;

=head1 NAME

ValueObject::Geography::Country::Codes::2Character - Value Object for ISO-3166-1 alpha-2 codes

=head1 SYNOPSIS

  use ValueObject::Geography::Country::Codes::2Character;

  my $vo = ValueObject::Geography::Country::Codes::2Character->new('GB');

=head1 DESCRIPTION

ValueObject::Geography::Country::Codes::2Character provides Value Object for
validation of ISO-3166-1 alpha-2 codes (Case insensitive)

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Geography::Country::Codes::Exception::Invalid2Character
if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Geography::Country::Codes::Base>

=cut
