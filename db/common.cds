using { Currency } from '@sap/cds/common';
namespace anubhav.common;

type Guid: String(32);

type gender: String(1) enum { male = 'M';
                              female = 'F';
                              unknown = 'U';
                              };

type phoneNumber: String(30);
type email:String(250);

type amount:Decimal(10, 2) @( Semantic.amount.currencyCode: currency ) ;

aspect Amount{
    GROSS_AMOUNT: Decimal(15,2) @(Semantic.amount.currency: 'CURRENCY_code');
    NET_AMOUNT: Decimal(15,2) @(Semantic.amount.currency: 'CURRENCY_code');
    TAX_AMOUNT: Decimal(15,2) @(Semantic.amount.currency: 'CURRENCY_code');
    CURRENCY: Currency;
}