@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forEmpSkl'
@ObjectModel.sapObjectNodeType.name: 'ZEmpSkl'
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAB', 
  allowNewDatasources: false, 
  allowNewCompositions: true, 
  dataSources: [ '_Extension' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define view entity ZR_EmpSklTP
  as select from ZDRM_EMPSK as EmpSkl
  association to parent ZR_Emply01TP as _Emply on $projection.EID = _Emply.EID
  association [1] to ZE_EmpSkl as _Extension on $projection.EID = _Extension.EID and $projection.SID = _Extension.SID
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
  _Emply,
  _Extension
  
}
