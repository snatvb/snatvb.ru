@module("./About.module.scss") external styles: {..} = "default"

@react.component
let make = React.memo(() => {
  let {locale} = LocaleContext.useLocaleContext()
  <section className={styles["base"]}>
    <h2 className={styles["short-story"]}>
      {locale->LocaleContext.getAsReactStr(["author", "about", "short-story"])}
    </h2>
    <article className={styles["story"]}>
      {locale->LocaleContext.getAsReactStr(["author", "about", "story-continue"])}
    </article>
  </section>
})
