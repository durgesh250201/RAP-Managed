@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Draft query view forEmpSkl'
@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST ]
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAB', 
  allowNewDatasources: false, 
  allowNewCompositions: false, 
  dataSources: [ 'EmpSkl' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define view entity ZR_EmpSkl_D
  as select from ZEMPSKL00D as EmpSkl
{
  key EID as EID,
  key SID as SID,
  Sname as Sname,
  Exp as Exp,
  Hotskill as Hotskill,
  LocalCreatedBy as LocalCreatedBy,
  LocalCreatedAt as LocalCreatedAt,
  LocalLastChangedBy as LocalLastChangedBy,
  LocalLastChangedAt as LocalLastChangedAt,
  LastChangedAt as LastChangedAt,
  draftentitycreationdatetime as Draftentitycreationdatetime,
  draftentitylastchangedatetime as Draftentitylastchangedatetime,
  draftadministrativedatauuid as Draftadministrativedatauuid,
  draftentityoperationcode as Draftentityoperationcode,
  hasactiveentity as Hasactiveentity,
  draftfieldchanges as Draftfieldchanges
  
}
