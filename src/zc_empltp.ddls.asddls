@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forEmpl'
@ObjectModel.semanticKey: [ 'EID' ]
@Search.searchable: true
define root view entity ZC_EmplTP
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_EmplTP as Empl
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
  _Skills : redirected to composition child ZC_Skills02TP
  
}
