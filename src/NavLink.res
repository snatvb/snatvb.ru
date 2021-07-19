@react.component
let make = (
  ~href: string,
  ~children: React.element,
  ~onClick: option<ReactEvent.Mouse.t => unit>=?,
  ~className: option<string>=?,
  ~title: option<string>=?,
  ~target: option<string>=?,
) => {
  let handleClick = event => {
    ReactEvent.Mouse.preventDefault(event)
    RescriptReactRouter.push(href)
    onClick->Belt.Option.forEach(onClick => onClick(event))
  }

  <a href ?className ?title ?target onClick={handleClick}> children </a>
}
