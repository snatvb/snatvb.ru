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

let unknownString = "UNKNOWN_STRING"

let read = (obj: {..}, path: array<string>): string => {
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
