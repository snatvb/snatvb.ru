@module("./Main.module.scss") external styles: {..} = "default"
open CX

@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()
  let transitions = RSpring.useTransition(
    url,
    RSpring.makeOptions(
      ~from=ReactDOM.Style.make(~opacity="0", ()),
      ~enter=ReactDOM.Style.make(~opacity="1", ()),
      ~leave=ReactDOM.Style.make(~opacity="0", ()),
      ~config=Some(RSpring.makeConfig(~duration=150, ())),
      (),
    ),
  )

  <div className={styles["base"]}>
    <header className={styles["header"]}> <Menu /> </header>
    <main className={cx([styles["content"], Some("full-size")])}>
      <div className={styles["body"]}>
        {transitions((style, item) => {
          <RSpring.Animated.Div style className="page">
            {switch item["path"] {
            | list{} => <Home />
            | list{"deal"} => <Deal />
            | _ => <Home />
            }}
          </RSpring.Animated.Div>
        })}
      </div>
    </main>
  </div>
}
