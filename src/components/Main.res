@module("./Main.module.scss") external styles: {..} = "default"
open CX

let inList = (list_: list<string>, str: string) =>
  switch list_ {
  | list{str} => true
  | _ => false
  }

@react.component
let make = () => {
  let nodeRef = React.useRef(Js.Nullable.null)
  let url = RescriptReactRouter.useUrl()
  Js.log(url.path->Belt.List.reduce("", Js.String.concat))

  <div className={styles["base"]}>
    <header className={styles["header"]}> <Menu /> </header>
    <main className={cx([styles["content"], Some("full-size")])}>
      <CSSTransition.Group className={styles["group"]}>
        // <CSSTransition
        //   nodeRef={ReactDOM.Ref.domRef(nodeRef)}
        //   unmountOnExit={true}
        //   \"in"={true}
        //   key={url.path->Belt.List.reduce("", Js.String.concat)}
        //   classNames="page"
        //   timeout={3000}>
        //   <div ref={ReactDOM.Ref.domRef(nodeRef)} className="page">
        //     {switch url.path {
        //     | list{} => <Home />
        //     | list{"deal"} => <Deal />
        //     | _ => <Home />
        //     }}
        //   </div>
        // </CSSTransition>
        // <CSSTransition
        //   unmountOnExit={true}
        //   // \"in"={true}
        //   key={inList(url.path, "")}
        //   classNames="page"
        //   timeout={3000}>
        //   <div className="page"> <Home /> </div>
        // </CSSTransition>
        // <CSSTransition
        //   unmountOnExit={true}
        //   // \"in"={true}
        //   key={inList(url.path, "deal")}
        //   classNames="page"
        //   timeout={3000}>
        //   <div className="page"> <Deal /> </div>
        // </CSSTransition>
        <CSSTransition
          unmountOnExit={true}
          \"in"={true}
          key={url.path->Belt.List.reduce("", Js.String.concat)}
          classNames="page"
          timeout={3000}>
          <div className="page">
            {switch url.path {
            | list{} => <Home />
            | list{"deal"} => <Deal />
            | _ => <Home />
            }}
          </div>
        </CSSTransition>
      </CSSTransition.Group>
    </main>
  </div>
}
