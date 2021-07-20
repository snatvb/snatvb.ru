@module("./About.module.scss") external styles: {..} = "default"
@module("./images/about_photo.png") external photoSrc: string = "default"

let photoSize: Common.size = {width: 400.0, height: 524.0}

@react.component
let make = React.memo(() => {
  let {locale} = LocaleContext.useLocaleContext()
  <section className={styles["base"]}>
    <div className={styles["photo-container"]}>
      <img alt="Photo Andrew Avsenin" src={photoSrc} className={styles["photo"]} />
    </div>
    <h2 className={styles["short-story"]}>
      {locale->LocaleContext.getAsReactStr(["author", "about", "short-story"])}
    </h2>
    <article className={styles["story"]}>
      {locale->LocaleContext.getAsReactStr(["author", "about", "story-continue"])}
    </article>
  </section>
})
