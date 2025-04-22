@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
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
@ObjectModel.semanticKey: [ 'SID' ]
@Search.searchable: true
define view entity ZC_EmpSklTP
  as projection on ZR_EmpSklTP as EmpSkl
{
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90 
  key EID,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90 
  key SID,
  Sname,
  Exp,
  Hotskill,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt,
  _Emply : redirected to parent ZC_Emply01TP
  
}
