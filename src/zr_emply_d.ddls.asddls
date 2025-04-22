@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Draft query view forEmply'
@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST ]
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAA', 
  allowNewDatasources: false, 
  allowNewCompositions: false, 
  dataSources: [ 'Emply' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define view entity ZR_Emply_D
  as select from ZEMPLY00D as Emply
{
  key EID as EID,
  Fname as Fname,
  Lname as Lname,
  Gender as Gender,
  Dept as Dept,
  Status as Status,
  Doj as Doj,
  Dol as Dol,
  Salary as Salary,
  Currency as Currency,
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
