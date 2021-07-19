%%raw("import './styles/global.scss'")
@module("./App.module.scss") external styles: {..} = "default"

module Routes = {
  @react.component
  let make = () => {
    let url = RescriptReactRouter.useUrl()
    switch url.path {
    | list{} | list{_} => <Main />
    | _ => <Redirect path="/" />
    }
  }
}

@react.component
let make = () => {
  let (animationDone, setAnimationDone) = React.useState(_ => true)

  let onAimationDone = () => setAnimationDone(_ => true)

  <LocaleContext.Provider value={LocaleContext.initialContext.locale}>
    {if !animationDone {
      <Greeting onAimationDone />
    } else {
      <Routes />
    }}
  </LocaleContext.Provider>
}
