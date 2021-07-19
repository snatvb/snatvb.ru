module Animated = {
  type t = {"div": React.component<ReactDOM.Props.domProps>}
  @module("react-spring") @scope("default")
  external animated: t = "animated"

  module Div = {
    @obj
    external makeProps: (
      ~style: ReactDOM.Style.t=?,
      ~key: string=?,
      ~className: string=?,
      ~children: React.element,
      unit,
    ) => ReactDOM.Props.domProps = ""

    let make = animated["div"]
  }
}

type config
@obj
external makeConfig: (~duration: int, unit) => config = ""

type options
@obj
external makeOptions: (
  ~from: ReactDOM.Style.t,
  ~enter: ReactDOM.Style.t,
  ~leave: ReactDOM.Style.t,
  ~delay: option<int>=?,
  ~config: option<config>=?,
  unit,
) => options = ""

type item
type mapItem = {
  item: item,
  props: ReactDOM.Style.t,
  key: string,
}

type transitions<'a, 'b> = @uncurry ((('a, 'b) => React.element) => React.element)

@module("react-spring") @scope("default")
external useTransition: ('t, options) => transitions<'a, 'b> = "useTransition"

// @send external map: (transitions, mapItem => React.element) => React.element = "map"