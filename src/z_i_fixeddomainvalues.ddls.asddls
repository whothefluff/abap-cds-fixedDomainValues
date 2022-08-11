@AbapCatalog.sqlViewName: 'ZIFIXEDDOMVALS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fixed domain values interface'
@Search.searchable: true
@AbapCatalog.buffering.status: #ACTIVE
@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 1
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ] }*/
define view Z_I_FixedDomainValues
  as select from zdd07l
  association [0..*] to Z_I_FixedDomainValuesTexts as _Texts
    on $projection.Name = _Texts.Name
    and $projection.ActivationState = _Texts.ActivationState
    and $projection.ValueKey = _Texts.ValueKey
  {
    key domname as Name,
    key as4local as ActivationState,
    @ObjectModel.text.association: '_Texts'
    key valpos as ValueKey,
    domvalue_l as SingleOrLowValue,
    domvalue_h as HighValue,
    appval as IsAppend,
    @Search: { defaultSearchElement: true,
               fuzzinessThreshold: 0.8,
               ranking: #HIGH }
    _Texts[ 1: Language = $session.system_language ].ShortText as CurrentLangShortText,
    @Search.defaultSearchElement: true
    _Texts
  }
