package ValueObject::Geography::Country::Codes::3Character;

use strict;
use warnings;
use Carp;
use ValueObject::Geography::Country::Codes::Exception::Invalid3Character;
use base qw/ ValueObject::Geography::Country::Codes::Base /;

my @codes = qw/
    AFG
    ALA
    ALB
    DZA
    ASM
    AND
    AGO
    AIA
    ATA
    ATG
    ARG
    ARM
    ABW
    AUS
    AUT
    AZE
    BHS
    BHR
    BGD
    BRB
    BLR
    BEL
    BLZ
    BEN
    BMU
    BTN
    BOL
    BES
    BIH
    BWA
    BVT
    BRA
    IOT
    BRN
    BGR
    BFA
    BDI
    CPV
    KHM
    CMR
    CAN
    CYM
    CAF
    TCD
    CHL
    CHN
    CXR
    CCK
    COL
    COM
    COG
    COD
    COK
    CRI
    CIV
    HRV
    CUB
    CUW
    CYP
    CZE
    DNK
    DJI
    DMA
    DOM
    ECU
    EGY
    SLV
    GNQ
    ERI
    EST
    ETH
    FLK
    FRO
    FJI
    FIN
    FRA
    GUF
    PYF
    ATF
    GAB
    GMB
    GEO
    DEU
    GHA
    GIB
    GRC
    GRL
    GRD
    GLP
    GUM
    GTM
    GGY
    GIN
    GNB
    GUY
    HTI
    HMD
    VAT
    HND
    HKG
    HUN
    ISL
    IND
    IDN
    IRN
    IRQ
    IRL
    IMN
    ISR
    ITA
    JAM
    JPN
    JEY
    JOR
    KAZ
    KEN
    KIR
    PRK
    KOR
    KWT
    KGZ
    LAO
    LVA
    LBN
    LSO
    LBR
    LBY
    LIE
    LTU
    LUX
    MAC
    MKD
    MDG
    MWI
    MYS
    MDV
    MLI
    MLT
    MHL
    MTQ
    MRT
    MUS
    MYT
    MEX
    FSM
    MDA
    MCO
    MNG
    MNE
    MSR
    MAR
    MOZ
    MMR
    NAM
    NRU
    NPL
    NLD
    NCL
    NZL
    NIC
    NER
    NGA
    NIU
    NFK
    MNP
    NOR
    OMN
    PAK
    PLW
    PSE
    PAN
    PNG
    PRY
    PER
    PHL
    PCN
    POL
    PRT
    PRI
    QAT
    REU
    ROU
    RUS
    RWA
    BLM
    SHN
    KNA
    LCA
    MAF
    SPM
    VCT
    WSM
    SMR
    STP
    SAU
    SEN
    SRB
    SYC
    SLE
    SGP
    SXM
    SVK
    SVN
    SLB
    SOM
    ZAF
    SGS
    SSD
    ESP
    LKA
    SDN
    SUR
    SJM
    SWZ
    SWE
    CHE
    SYR
    TWN
    TJK
    TZA
    THA
    TLS
    TGO
    TKL
    TON
    TTO
    TUN
    TUR
    TKM
    TCA
    TUV
    UGA
    UKR
    ARE
    GBR
    USA
    UMI
    URY
    UZB
    VUT
    VEN
    VNM
    VGB
    VIR
    WLF
    ESH
    YEM
    ZMB
    ZWE
/;

sub validate {
    my $self    = shift;
    my $value   = shift || '';
    croak (ValueObject::Geography::Country::Codes::Exception::Invalid3Character->new($value))
        unless (grep { lc($_) eq lc($value) } @codes);
    return 1;
}

1;

=head1 NAME

ValueObject::Geography::Country::Codes::3Character - Value Object for ISO-3166-1 alpha-3 codes

=head1 SYNOPSIS

  use ValueObject::Geography::Country::Codes::3Character;

  my $vo = ValueObject::Geography::Country::Codes::3Character->new('GB');

=head1 DESCRIPTION

ValueObject::Geography::Country::Codes::3Character provides Value Object for
validation of ISO-3166-1 alpha-3 codes (Case insensitive)

=head1 METHODS

=over 4

=item new($value = '')

Creates a new object

Throws ValueObject::Geography::Country::Codes::Invalid3Character if $value is invalid

=item validate()

Called during instantiation to validate $value

=item value()

Returns the raw value as passed in at instantiation

=back

=head1 SEE ALSO

L<ValueObject::Geography::Country::Codes::Base>

=cut
