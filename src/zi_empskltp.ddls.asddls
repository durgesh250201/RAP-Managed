@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection View forEmpSkl'
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAB', 
  allowNewDatasources: false, 
  allowNewCompositions: true, 
  dataSources: [ 'EmpSkl' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define view entity ZI_EmpSklTP
  as projection on ZR_EmpSklTP as EmpSkl
{
  key EID,
  key SID,
  Sname,
  Exp,
  Hotskill,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt,
  _Emply : redirected to parent ZI_Emply01TP
  
}
