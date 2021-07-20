@module("./locales/en.json") external en: {..} = "default"
@module("./locales/ru.json") external ru: {..} = "default"

type locale = [#ru | #en]

let locales = {
  "ru": ru,
  "en": en,
}

let genTextsByLocale = (locale: locale): option<{..}> => {
  ignore(locale)
  Js.undefinedToOption(%raw(`locales[locale]`))
}

type readed
let unknownString: readed = %raw(`"UNKNOWN_STRING"`)
// let unknownString = "UNKNOWN_STRING"

external toFloat: readed => float = "%identity"
external toInt: readed => int = "%identity"
external toArray: readed => array<readed> = "%identity"
external toObject: readed => {..} = "%identity"
external toString: readed => string = "%identity"

let read = (obj: {..}, path: array<string>): readed => {
  switch Helpers.path(Some(obj), path) {
  | Some(value) => value
  | None => unknownString
  }
}

let get = (locale: locale, path: array<string>) =>
  locale->genTextsByLocale->Belt.Option.mapWithDefault(unknownString, read(_, path))

type context = {
  locale: locale,
  changeLocale: locale => unit,
}

let initialContext: context = {locale: #en, changeLocale: _ => ()}

let context = React.createContext(initialContext)

module Provider = {
  let provider = React.Context.provider(context)

  @react.component
  let make = (~value, ~children) => {
    let (locale, setLocale) = React.useState(_ => value)
    let changeLocale = loc => setLocale(_ => loc)

    React.createElement(
      provider,
      {"value": {locale: locale, changeLocale: changeLocale}, "children": children},
    )
  }
}

let useLocaleContext = () => React.useContext(context)
let useLocale = () => React.useContext(context).locale
