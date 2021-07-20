@module("./Timeline.module.scss") external styles: {..} = "default"
open CX

@unwrap
type dateToSafe = [
  | #Now
  | #Timestamp(int)
]

type dateTo

external toStringDateTo: dateTo => string = "%identity"
external toIntDateTo: dateTo => int = "%identity"

let convertDateTo = (to_: dateTo) => {
  if to_->toStringDateTo == "now" {
    #Now
  } else {
    to_->toIntDateTo->#Timestamp
  }
}

module Item = {
  type date = {
    from: int,
    @as("to") to_: dateTo,
  }

  @react.component
  let make = (
    ~name: string,
    ~position: string,
    ~date: date,
    ~stack: array<string>,
    ~city: string,
    ~country: string,
    ~description: string,
  ) => {
    let {locale} = LocaleContext.useLocaleContext()
    let dateTo = date.to_->convertDateTo
    let isActive = dateTo == #Now
    <article
      className={cx([styles["item"], Some(styles["active"])->Helpers.filterOption(_ => isActive)])}>
      <div className={styles["date"]}>
        <div className={styles["date-from"]}> <Date timestamp={date.from} /> </div>
        {switch dateTo {
        | #Now =>
          <div className={styles["date-to"]}>
            {locale->LocaleContext.get(["now-date"])->LocaleContext.toString->React.string}
          </div>
        | #Timestamp(date) => <div className={styles["date-to"]}> <Date timestamp={date} /> </div>
        }}
      </div>
      <div className={styles["timeline"]} />
      <div className={styles["work"]}>
        <h2 className={styles["name"]}> {name->React.string} </h2>
        <h3 className={styles["position"]}> {position->React.string} </h3>
        <div className={styles["location"]}> {`${city}, ${country}`->React.string} </div>
        <p className={styles["description"]}> {description->React.string} </p>
        <div className={styles["stack"]}>
          {stack
          ->Belt.Array.map(item =>
            <div className={styles["stack-item"]} key={item}> {item->React.string} </div>
          )
          ->React.array}
        </div>
      </div>
    </article>
  }
}

@react.component
let make = (~children: option<React.element>=?) => {
  <div className={styles["base"]}> {children->Belt.Option.getWithDefault(React.null)} </div>
}
