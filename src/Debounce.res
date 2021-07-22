// type t<'a, 'b> = {call: 'a => 'b, cancel: unit => unit}

// let make = (fn: 't => 'b, timeout: int) => {
//   let timerId = ref(0)
//   {
//     call: () => timerId := Js.Global.setTimeout(fn, timeout),
//     cancel: () => Js.Global.clearTimeout(timerId),
//   }
// }

external intToTimeoutId: int => Js.Global.timeoutId = "%identity"

let useDebounce = (fn, timeout) => {
  let timeoutId = React.useRef(0->intToTimeoutId)

  React.useEffect0(() => Some(() => Js.Global.clearTimeout(timeoutId.current)))

  x => {
    Js.Global.clearTimeout(timeoutId.current)
    timeoutId.current = Js.Global.setTimeout(() => fn(x), timeout)
  }
}
