using { anubhav.common as anubhavcommon } from './common';
using { cuid,Currency} from '@sap/cds/common';
namespace anubhav.db;

type Guid : String(32);
//rajesh change
context master {
    entity businesspartner: cuid {
        BP_ROLE:String(2);
        EMAIL_ADDRESS:String(125);
        PHONE_NUMBER:String(32);
        FAX_NUMBER:String(32);
        WEB_ADDRESS:String(44);
        ADDRESS_GUID: Association to one address;
        BP_ID:String(32);
        COMPANY_NAME:String(250);
    }

    entity address: cuid {
        CITY: String(44);
        POSTAL_CODE: String(8);
        STREET: String(44);
        BUILDING: String(128);
        COUNTRY: String(44);
        ADDRESS_TYPE: String(44);
        VAL_START_DATE: Date;
        VAL_END_DATE: Date;
        LATITUDE: Decimal;
        LONGITUDE: Decimal;
        businesspartner: Association to one businesspartner on businesspartner.ADDRESS_GUID = $self;
    }

    entity employees: cuid{
        nameFirst: String(256);
        nameMiddle: String(256);
        nameLast: String(256);
        nameInitials: String(40);
        sex:anubhavcommon.gender;
        language: String(1);
        phoneNumber:anubhavcommon.phoneNumber;
        email:anubhavcommon.email;
        loginName: String(12);
        Currency: Currency;
        salaryAmount:Decimal(10, 2) @( Semantic.amount.currencyCode: Currency_code ) ;
        accountNumber: String(40);
        bankId: String(40);
        bankName: String(64);
        country: String(3);
    }

entity product{
        key NODE_KEY :anubhavcommon.Guid;
        PRODUCT_ID: String(28);
        TYPE_CODE: String(2);
        CATEGORY: String(32);
        //capm will automatically create a text table with this field
        DESCRIPTION: localized String(255);
        SUPPLIER_GUID: Association to one businesspartner;
        TAX_TARIF_CODE: Integer;
        MEASURE_UNIT: String(2);
        WEIGHT_MEASURE: Decimal(5,2) @(Semantic.quantity.unit: 'WEIGHT_UNIT');
        WEIGHT_UNIT: String(2);
        CURRENCY: Currency;
        PRICE: Decimal(15,2) @(Semantic.amount.currencyCode: 'CURRENCY_code');
        WIDTH: Decimal(5,2) @(Semantic.quantity.unit: 'DIM_UNIT');
        HEIGHT: Decimal(5,2) @(Semantic.quantity.unit: 'DIM_UNIT');
        DEPTH: Decimal(5,2) @(Semantic.quantity.unit: 'DIM_UNIT');
        DIM_UNIT: String(2);
    }    
}

context transaction{

    entity purchaseorder: anubhavcommon.Amount{
        key NODE_KEY : anubhavcommon.Guid;
        PO_ID: String(32);
        PARTNER_GUID: Association to one master.businesspartner;
        LIFECYCLE_STATUS: String(1);
        OVERALL_STATUS: String(1);
        NOTE: String(255);
        Items: Association to many poitems on
                        Items.PARENT_KEY = $self;        
    }

    entity poitems: anubhavcommon.Amount{
        key NODE_KEY : anubhavcommon.Guid;
        PARENT_KEY: Association to one purchaseorder;
        PO_ITEM_POS: Integer;
        PRODUCT_GUID: Association to one master.product;

        
    }

}