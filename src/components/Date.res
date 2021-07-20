let monthes = {
  "en": [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ],
  "ru": [
    `Январь`,
    `Февраль`,
    `Март`,
    `Апрель`,
    `Май`,
    `Июнь`,
    `Июль`,
    `Август`,
    `Сентябрь`,
    `Октябрь`,
    `Ноябрь`,
    `Декабрь`,
  ],
}

@react.component
let make = (~timestamp: int) => {
  let {locale} = LocaleContext.useLocaleContext()
  let date = timestamp->Belt.Int.toFloat->Js.Date.fromFloat
  let month = date->Js.Date.getMonth->Belt.Float.toInt
  let year = date->Js.Date.getFullYear->Belt.Float.toString
  let convert = x =>
    Belt.Option.map(x, month => `${month} ${year}`)->Belt.Option.mapWithDefault(
      React.string("UNKNOWN"),
      React.string,
    )
  switch locale {
  | #en => month->Belt.Array.get(monthes["en"], _)->convert
  | #ru => month->Belt.Array.get(monthes["ru"], _)->convert
  }
}
