module Switch = {
  @react.component @module("react-transition-group")
  external make: (
    ~children: option<React.element>=?,
    ~className: option<string>=?,
    ~ref: option<ReactDOM.domRef>=?,
    ~mode: string,
  ) => React.element = "SwitchTransition"
}

module Group = {
  @react.component @module("react-transition-group")
  external make: (
    ~children: option<React.element>=?,
    ~className: option<string>=?,
    ~ref: option<ReactDOM.domRef>=?,
  ) => React.element = "TransitionGroup"
}

@react.component @module("react-transition-group")
external make: (
  ~timeout: int,
  ~key: option<string>=?,
  ~nodeRef: option<ReactDOM.domRef>=?,
  ~className: option<string>=?,
  ~classNames: option<string>=?,
  ~unmountOnExit: option<bool>=?,
  ~\"in": option<bool>=?,
  ~children: option<React.element>=?,
) => React.element = "CSSTransition"
