@module("./Main.module.scss") external styles: {..} = "default"
open CX

@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()
  let transitions = RSpring.useTransition(
    url,
    RSpring.makeOptions(
      ~from=ReactDOM.Style.make(~opacity="0", ~transform="scale(1.1)", ()),
      ~enter=ReactDOM.Style.make(~opacity="1", ~transform="scale(1)", ()),
      ~leave=ReactDOM.Style.make(~opacity="0", ()),
      ~config=Some(RSpring.makeConfig(~duration=200, ())),
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
            | _ => <About />
            }}
          </RSpring.Animated.Div>
        })}
      </div>
      <div className={styles["in-dev"]}> {React.string("Still development")} </div>
    </main>
  </div>
}
