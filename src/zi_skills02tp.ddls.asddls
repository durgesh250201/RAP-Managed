@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection View forSkills'
define view entity ZI_Skills02TP
  as projection on ZR_Skills02TP as Skills
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
  _ESkillHist : redirected to composition child ZI_ESkillHistTP,
  _Empl : redirected to parent ZI_EmplTP
  
}
