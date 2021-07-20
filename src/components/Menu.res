@module("./Menu.module.scss") external styles: {..} = "default"
open CX

@react.component
let make = React.memo(() => {
  <aside className={styles["base"]}>
    <div className={styles["top"]}> <Logo className={styles["logo"]} /> <LanguageSelector /> </div>
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
          <NavLink
            href="https://t.me/snatvb" title="Telegram" target="blank" className={styles["link"]}>
            <Icon.Solid.Telegram
              className={cx([styles["icon"], styles["small"], styles["solid"]])}
            />
          </NavLink>
        </li>
        <li>
          <NavLink
            href="https://www.linkedin.com/in/snatvb/"
            title="LinkedIn Andrey Avsenin"
            target="blank"
            className={styles["link"]}>
            <Icon.Solid.LinkedIn
              className={cx([styles["icon"], styles["small"], styles["solid"]])}
            />
          </NavLink>
        </li>
      </ul>
    </div>
  </aside>
})
