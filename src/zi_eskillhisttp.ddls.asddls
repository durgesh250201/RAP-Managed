@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection View forESkillHist'
define view entity ZI_ESkillHistTP
  as projection on ZR_ESkillHistTP as ESkillHist
{
  key SID,
  key ShID,
  key EID,
  Projname,
  Projyear,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt,
  _Skills : redirected to parent ZI_Skills02TP,
  _Empl : redirected to ZI_EmplTP
  
}
