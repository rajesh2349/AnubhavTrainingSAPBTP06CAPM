using { anubhav.db.master, anubhav.db.transaction } from '../db/datamodel';

service CatalogService @(path: 'CatalogService') {

    entity PurchaseOrderSet as projection on transaction.purchaseorder;
    entity PurchaseOrderItemSet as projection on transaction.poitems;
    // entity Product as projection on master.product;
    entity BusinessPartnerSet as projection on master.businesspartner;
    entity AddressSet as projection on master.address;
    entity EmployeeSet as projection on master.employees;
    entity ProductSet as projection on master.product;

    //expose the view
    // entity POWorklist as projection on anubhav.cds.POWorklist;
    // entity ItemView as projection on anubhav.cds.ItemView;
    // entity ProductView as projection on anubhav.cds.ProductView;
    // entity CProductView as projection on anubhav.cds.CProductView;

    

}