let unwrapId = id => id->Belt.Option.getWithDefault("")

@react.component
let make = React.memo((
  ~className: option<string>=?,
  ~id: option<string>=?,
  ~onClick: option<ReactEvent.Mouse.t => unit>=?,
) => {
  <svg
    ?onClick
    xmlns="http://www.w3.org/2000/svg"
    id={id->unwrapId}
    className={className->unwrapId}
    viewBox="0 0 64 64">
    <title> {React.string("Avsenin Andrey")} </title>
    <path
      d="M49.63,4H14.37A10.37,10.37,0,0,0,4,14.37V49.63A10.37,10.37,0,0,0,14.37,60H49.63A10.37,10.37,0,0,0,60,49.63V14.37A10.37,10.37,0,0,0,49.63,4ZM45.58,49.68a4,4,0,0,1-5.25-2.1L38.79,44H36a4,4,0,0,1-.61-7.94L32,28.15,23.68,47.58a4,4,0,1,1-7.35-3.15l12-28a4,4,0,0,1,7.35,0l9.43,22v0l2.56,6A4,4,0,0,1,45.58,49.68Z"
    />
  </svg>
})
