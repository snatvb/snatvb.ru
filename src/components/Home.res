@module("./Home.module.scss") external styles: {..} = "default"
@module("./photo.png") external photoSrc: string = "default"

let photoSize: Common.size = {width: 810.0, height: 1080.0}

@react.component
let make = React.memo(() => {
  let {locale} = LocaleContext.useLocaleContext()
  <div className={styles["base"]}>
    <div className={styles["photo-container"]}>
      <Photo size={photoSize} src={photoSrc} className={styles["photo"]} />
    </div>
    <div className={styles["body"]}>
      <section className={styles["content"]}>
        <h1 className={styles["name-title"]}>
          {locale->LocaleContext.get(["author", "name"])->LocaleContext.toString->React.string}
        </h1>
        <h2 className={styles["author-description"]}>
          {locale
          ->LocaleContext.get(["author", "description"])
          ->LocaleContext.toString
          ->React.string}
        </h2>
      </section>
    </div>
  </div>
})
