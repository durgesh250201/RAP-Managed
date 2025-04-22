@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forSkills'
define view entity ZR_Skills02TP
  as select from ZDRM_EMPSK as Skills
  association to parent ZR_EmplTP as _Empl on $projection.EID = _Empl.EID
  composition [0..*] of ZR_ESkillHistTP as _ESkillHist
{
  key EID as EID,
  key SID as SID,
  SNAME as Sname,
  EXP as Exp,
  HOTSKILL as Hotskill,
  LOCAL_CREATED_BY as LocalCreatedBy,
  LOCAL_CREATED_AT as LocalCreatedAt,
  LOCAL_LAST_CHANGED_BY as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  LAST_CHANGED_AT as LastChangedAt,
  _ESkillHist,
  _Empl
  
}
