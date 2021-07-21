@module("./Menu.module.scss") external styles: {..} = "default"
open CX

@react.component
let make = React.memo(() => {
  let onClick = _ => {
    Helpers.setNeedGreeting(false)
    %raw(`window.location = '/'`)
  }

  <aside className={styles["base"]}>
    <div className={styles["top"]}>
      <Logo className={styles["logo"]} onClick /> <LanguageSelector />
    </div>
    <nav className={styles["elements"]}>
      <ul>
        <li>
          <NavLink href="/" className={styles["link"]}>
            <Icon.Avenger className={styles["icon"]} />
          </NavLink>
        </li>
        <li>
          <NavLink href="/deal" className={styles["link"]}>
            <Icon.DealGlass className={styles["icon"]} />
          </NavLink>
        </li>
        <li>
          <NavLink href="/about" className={styles["link"]}>
            <Icon.Creed className={styles["icon"]} />
          </NavLink>
        </li>
      </ul>
    </nav>
    <div className={styles["elements"]}>
      <ul>
        <li>
          <a
            href="https://github.com/snatvb"
            title="Github"
            target="blank"
            className={styles["link"]}>
            <Icon.Github
              className={cx([styles["icon"], styles["small"], styles["solid"], styles["github"]])}
            />
          </a>
        </li>
        <li>
          <a href="https://t.me/snatvb" title="Telegram" target="blank" className={styles["link"]}>
            <Icon.Solid.Telegram
              className={cx([styles["icon"], styles["small"], styles["solid"]])}
            />
          </a>
        </li>
        <li>
          <a
            href="https://www.linkedin.com/in/snatvb/"
            title="LinkedIn Andrey Avsenin"
            target="blank"
            className={styles["link"]}>
            <Icon.Solid.LinkedIn
              className={cx([styles["icon"], styles["small"], styles["solid"]])}
            />
          </a>
        </li>
      </ul>
    </div>
  </aside>
})
