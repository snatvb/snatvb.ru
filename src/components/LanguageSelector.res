@module("./LanguageSelector.module.scss") external styles: {..} = "default"

@react.component
let make = React.memo(() => {
  let {locale, changeLocale} = LocaleContext.useLocaleContext()
  let onClick = _ => {
    switch locale {
    | #en => changeLocale(#ru)
    | #ru => changeLocale(#en)
    }
  }

  <div onClick className={styles["base"]}>
    <button className={styles["button"]}>
      <span className={styles["current-lang"]}> {(locale :> string)->React.string} </span>
      <Icon.Translation className={styles["icon"]} />
    </button>
  </div>
})
