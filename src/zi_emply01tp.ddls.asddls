@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection View forEmply'
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAA', 
  allowNewDatasources: false, 
  allowNewCompositions: true, 
  dataSources: [ 'Emply' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define root view entity ZI_Emply01TP
  provider contract TRANSACTIONAL_INTERFACE
  as projection on ZR_Emply01TP as Emply
{
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
  _EmpSkl : redirected to composition child ZI_EmpSklTP
  
}
