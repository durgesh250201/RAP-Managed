@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forEmply'
/* @AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAA', 
  allowNewDatasources: false, 
  allowNewCompositions: true, 
  dataSources: [ 'Emply' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
} */
@ObjectModel.semanticKey: [ 'EID' ]
@Search.searchable: true
define root view entity ZC_Emply01TP
  provider contract transactional_query
  as projection on ZR_Emply01TP as Emply
{
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90 
  key EID,
  Fname,
  Lname,
  Gender,
  Dept,
  Status,
  Doj,
  Dol,
  Salary,
  Currency,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt,
  _EmpSkl : redirected to composition child ZC_EmpSklTP
  
}
