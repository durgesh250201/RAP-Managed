@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forEmpl'
define root view entity ZR_EmplTP
  as select from ZDRM_EMPTB as Empl
  composition [0..*] of ZR_Skills02TP as _Skills
{
  key EID as EID,
  FNAME as Fname,
  LNAME as Lname,
  GENDER as Gender,
  DEPT as Dept,
  STATUS as Status,
  DOJ as Doj,
  DOL as Dol,
  SALARY as Salary,
  CURRENCY as Currency,
  @Semantics.user.createdBy: true
  LOCAL_CREATED_BY as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  LOCAL_CREATED_AT as LocalCreatedAt,
  @Semantics.user.lastChangedBy: true
  LOCAL_LAST_CHANGED_BY as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  _Skills
  
}
