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

let animationGreetingKey = "greetingDone"

@react.component
let make = () => {
  let (animationDone, setAnimationDone) = React.useState(_ => Helpers.loadNeedGreeting())

  React.useEffect1(() => {
    Helpers.setNeedGreeting(animationDone)
    None
  }, [animationDone])

  let onAimationDone = () => setAnimationDone(_ => true)

  <LocaleContext.Provider>
    <MediaContext.Provider>
      {if !animationDone {
        <Greeting onAimationDone />
      } else {
        <Routes />
      }}
    </MediaContext.Provider>
  </LocaleContext.Provider>
}
