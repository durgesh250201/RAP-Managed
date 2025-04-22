@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forSkills'
@ObjectModel.semanticKey: [ 'SID' ]
@Search.searchable: true
define view entity ZC_Skills02TP
  as projection on ZR_Skills02TP as Skills
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
  _ESkillHist : redirected to composition child ZC_ESkillHistTP,
  _Empl : redirected to parent ZC_EmplTP
  
}
