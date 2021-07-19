@module("./Sphere.module.scss") external styles: {..} = "default"
open CX

@react.component
let make = (~className: option<string>=?) => {
  <div className={cx([styles["base"], className])}> <div className={styles["flare"]} /> </div>
}
