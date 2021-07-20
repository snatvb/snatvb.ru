@module("./Deal.module.scss") external styles: {..} = "default"

@react.component
let make = React.memo(() => {
  let {locale} = LocaleContext.useLocaleContext()

  <div className={styles["base"]}>
    <section className={styles["content"]}>
      <Timeline>
        {locale
        ->LocaleContext.get(["works"])
        ->LocaleContext.toArray
        ->Belt.Array.mapWithIndex((index, item) => {
          React.createElement(
            Timeline.Item.make,
            Js.Obj.assign(
              LocaleContext.toObject(item),
              {
                "key": index->Belt.Int.toString,
              },
            ),
          )
        })
        ->React.array}
      </Timeline>
    </section>
  </div>
})
