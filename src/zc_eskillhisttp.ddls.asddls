@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forESkillHist'
@ObjectModel.semanticKey: [ 'ShID' ]
@Search.searchable: true
define view entity ZC_ESkillHistTP
  as projection on ZR_ESkillHistTP as ESkillHist
{
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90 
  key SID,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90 
  key ShID,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90 
  key EID,
  Projname,
  Projyear,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt,
  _Skills : redirected to parent ZC_Skills02TP,
  _Empl : redirected to ZC_EmplTP
  
}
