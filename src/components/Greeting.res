@module("./Greeting.module.scss") external styles: {..} = "default"
open CX

// React.useEffect0(() => {
//   let shape = Mo.makeShape(
//     Mo.config(
//       ~parent="#root",
//       ~shape=#circle,
//       ~fill=Js.Dict.fromList(list{("#F64040", "#FC46AD")}),
//       ~radius=Js.Dict.fromList(list{("20", 80)}),
//       ~duration=2000,
//       ~isYoyo=true,
//       ~isShowStart=true,
//       ~easing="elastic.inout",
//       ~repeat=1,
//       (),
//     ),
//   )
//   Mo.play(shape)
//   None
// })

@inline let animationTime = 2000

@react.component
let make = (~onAimationDone: option<unit => unit>=?) => {
  React.useEffect0(() => {
    let timeoutId = Helpers.setTimeout(() => {
      onAimationDone->Belt.Option.forEach(Helpers.call)
    }, animationTime)

    Some(() => timeoutId->Helpers.clearTimeout)
  })
  <div className={styles["container"]}>
    <Logo className={styles["logo"]} />
    <div className={styles["logo-fake"]}>
      {Helpers.Range.map(1, 20, i => {
        <div
          key={i->Belt.Int.toString}
          className={cx([styles["line"], Helpers.prop(styles, `line-${i->Belt.Int.toString}`)])}
        />
      })->React.array}
    </div>
  </div>
}
