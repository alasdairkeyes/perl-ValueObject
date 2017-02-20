# perl-ValueObjects

A collection of Value Objects for common data types

## Usage

* Valid post code
```
use ValueObject::PostCode;

my $valid_post_code = ValueObject::PostCode->new('E14 4PA');
print $valid_post_code->value();    # prints E14 4PA
print $valid_post_code;             # prints E14 4PA
```

* Invalid post code
```
use ValueObject::PostCode;

my $invalid_post_code = eval{
    ValueObject::PostCode->new('AAA 111');
} || print $@;
# Throws ValueObject::PostCode::Exception::Invalid exception with stack trace
# caught into $@
```

## Available ValueObject modules

* ValueObject::Boolean
* ValueObject::Boolean::TrueFalse
* ValueObject::Boolean::OnOff
* ValueObject::Boolean::YesNo
* ValueObject::Finance::Currency::Code
* ValueObject::Finance::Money
* ValueObject::Finance::Money::Comma
* ValueObject::Finance::Money::Period
* ValueObject::Finance::BIC
* ValueObject::Finance::BIC::Generic
* ValueObject::Finance::BIC::Passive
* ValueObject::Finance::BIC::Reverse
* ValueObject::Finance::BIC::Test
* ValueObject::Finance::IBAN
* ValueObject::Gender
* ValueObject::Geography::Continent
* ValueObject::Geography::Country::Codes::2Character
* ValueObject::Geography::Country::Codes::3Character
* ValueObject::Identity::UUID
* ValueObject::Identity::UUIDv1
* ValueObject::Identity::UUIDv2
* ValueObject::Identity::UUIDv3
* ValueObject::Identity::UUIDv4
* ValueObject::Identity::UUIDv5
* ValueObject::Inet::Domain
* ValueObject::Inet::EmailAddress
* ValueObject::Inet::Hostname
* ValueObject::Inet::Port
* ValueObject::Inet::MacAddress
* ValueObject::Inet::IP
* ValueObject::Inet::IPv4
* ValueObject::Inet::IPv6
* ValueObject::PostCode

## Site:

https://github.com/alasdairkeyes/perl-ValueObject

## License

- Released Under GPL Version 3 - See included LICENSE file

## Dependencies

- Email::Valid
- Net::IP
- Data::Validate::Domain

## Changelog

- 2017-02-12 :: 0.1.0       :: First release

## Author

- Alasdair Keyes - https://akeyes.co.uk/
