@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection View forEmpl'
define root view entity ZI_EmplTP
  provider contract TRANSACTIONAL_INTERFACE
  as projection on ZR_EmplTP as Empl
{
  key EID,
  Fname,
  Lname,
  Gender,
  Dept,
  Status,
  Doj,
  Dol,
  Salary,
  Currency,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt,
  _Skills : redirected to composition child ZI_Skills02TP
  
}
