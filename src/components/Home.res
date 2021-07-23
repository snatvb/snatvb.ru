@module("./Home.module.scss") external styles: {..} = "default"
@module("./images/home_photo.png") external photoSrc: string = "default"

let photoDefaultSize: Common.size = {width: 810.0, height: 1080.0}

let photoMediumSize: Common.size = {
  width: photoDefaultSize.width /. 1.5,
  height: photoDefaultSize.height /. 1.5,
}

@react.component
let make = React.memo(() => {
  let (photoSize, setPhotoSize) = React.useState(_ => photoDefaultSize)
  let locale = LocaleContext.useLocale()
  let windowSize = MediaContext.useMedia()

  React.useEffect1(() => {
    if windowSize.width > 1100 && windowSize.height > 700 {
      setPhotoSize(_ => photoDefaultSize)
    } else if windowSize.width > 700 {
      setPhotoSize(_ => photoMediumSize)
    }
    None
  }, [windowSize])

  <div className={styles["base"]}>
    <div className={styles["photo-container"]}>
      <PhotoRaining
        size={photoSize}
        src={photoSrc}
        className={styles["photo"]}
        key={photoSize.width->Belt.Float.toString ++ photoSize.height->Belt.Float.toString}
      />
    </div>
    <div className={styles["body"]}>
      <section className={styles["content"]}>
        <h1 className={styles["name-title"]}>
          {locale
          ->LocaleContext.get(["author", "first-name"])
          ->LocaleContext.toString
          ->React.string}
          <br />
          {locale->LocaleContext.get(["author", "last-name"])->LocaleContext.toString->React.string}
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
