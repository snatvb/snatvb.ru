type context = {
  width: int,
  height: int,
}

let getWindowSize = (): context => {
  width: Webapi.Dom.window->Webapi.Dom.Window.outerWidth,
  height: Webapi.Dom.window->Webapi.Dom.Window.outerHeight,
}

let initialContext = getWindowSize()

let context = React.createContext(initialContext)

module Provider = {
  let provider = React.Context.provider(context)

  @react.component
  let make = (~children) => {
    let (media, setMedia) = React.useState(_ => initialContext)
    let handleResize = Debounce.useDebounce(_ => {
      setMedia(_ => getWindowSize())
    }, 200)

    React.useEffect0(() => {
      Webapi.Dom.Window.addEventListener("resize", handleResize, Webapi.Dom.window)
      None
    })

    React.createElement(provider, {"value": media, "children": children})
  }
}

let useMedia = () => React.useContext(context)
