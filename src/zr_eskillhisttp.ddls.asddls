@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forESkillHist'
define view entity ZR_ESkillHistTP
  as select from ZDRM_EMPSH as ESkillHist
  association to parent ZR_Skills02TP as _Skills on $projection.EID = _Skills.EID and $projection.SID = _Skills.SID
  association [1] to ZR_EmplTP as _Empl on $projection.EID = _Empl.EID
{
  key SID as SID,
  key SHID as ShID,
  key EID as EID,
  PROJNAME as Projname,
  PROJYEAR as Projyear,
  LOCAL_CREATED_BY as LocalCreatedBy,
  LOCAL_CREATED_AT as LocalCreatedAt,
  LOCAL_LAST_CHANGED_BY as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  LAST_CHANGED_AT as LastChangedAt,
  _Skills,
  _Empl
  
}
