@react.component
let make = (
  ~href: string,
  ~children: React.element,
  ~onClick: option<ReactEvent.Mouse.t => unit>=?,
  ~className: option<string>=?,
  ~title: option<string>=?,
  ~target: option<string>=?,
) => {
  let url = RescriptReactRouter.useUrl()

  let handleClick = event => {
    ReactEvent.Mouse.preventDefault(event)
    if "/" ++ Helpers.joinList(url.path, "/") != href {
      RescriptReactRouter.push(href)
      onClick->Belt.Option.forEach(onClick => onClick(event))
    }
  }

  <a href ?className ?title ?target onClick={handleClick}> children </a>
}
