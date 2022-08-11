@AbapCatalog.sqlViewName: 'ZIFIXEDDOMVALTXT'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@AbapCatalog.preserveKey: true
@EndUserText.label: 'Fixed domain values, texts interface'
@AbapCatalog.buffering.status: #ACTIVE
@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 2
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ] }*/
define view Z_I_FixedDomainValuesTexts
  as select from dd07t
  association [1..1] to Z_I_FixedDomainValues as _FixedDomainValue
    on $projection.Name = _FixedDomainValue.Name
    and $projection.ActivationState = _FixedDomainValue.ActivationState
    and $projection.ValueKey = _FixedDomainValue.ValueKey
  association [1..1] to I_Language as _Language
    on $projection.Language = _Language.Language
  {
    key domname as Name,
    @Semantics.language: true
    @ObjectModel.foreignKey.association: '_Language'
    key ddlanguage as Language,
    key as4local as ActivationState,
    key valpos as ValueKey,
    @Semantics.text: true
    ddtext as ShortText,
    _FixedDomainValue,
    _Language
  }
