using { anubhav.cds as cds } from '../db/CDSViews';

service CDSService @(path: 'CDSService') {

    // entity POWorklist as projection on anubhav.cds.POWorklist;
    entity ItemSet as projection on cds.CDSView.ItemView;
    entity ProductSet as projection on cds.CDSView.ProductView;
    // entity CProductView as projection on anubhav.cds.CProductView;

}
