@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forEmply'
@ObjectModel.sapObjectNodeType.name: 'ZEmply'
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAA', 
  allowNewDatasources: false, 
  allowNewCompositions: true, 
  dataSources: [ '_Extension' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define root view entity ZR_Emply01TP
  as select from ZDRM_EMPTB as Emply
  association [1] to ZE_Emply as _Extension on $projection.EID = _Extension.EID
  composition [0..*] of ZR_EmpSklTP as _EmpSkl
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
  _EmpSkl,
  _Extension
  
}
