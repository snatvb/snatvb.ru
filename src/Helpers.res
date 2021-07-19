@get external getCanvas: Webapi__Canvas.Canvas2d.t => Dom.element = "canvas"
@get @scope("canvas") external getWidth: Webapi__Canvas.Canvas2d.t => int = "width"
@get @scope("canvas") external getWidthf: Webapi__Canvas.Canvas2d.t => float = "width"
@get @scope("canvas") external getHeight: Webapi__Canvas.Canvas2d.t => int = "height"
@get @scope("canvas") external getHeightf: Webapi__Canvas.Canvas2d.t => float = "height"
@val @scope("window")
external requestAnimationFrame: (float => 'a) => int = "requestAnimationFrame"
@val @scope("window")
external cancelAnimationFrame: int => unit = "cancelAnimationFrame"
open Promise

let thenTap = (promise, fn) => {
  promise->then(x => {
    fn(x)
    resolve(x)
  })
}

let eq = (a, b) => a === b

let identity = x => x
let call = fn => fn()

let sideEffect = (a, fn) => {
  fn(a)
  a
}

let tap = sideEffect

module Range = {
  let map = (from, to_, fn: 'a => 'b): array<'b> => {
    let result = []
    for i in from to to_ {
      let _ = Js.Array2.push(result, fn(i))
    }
    result
  }
}

let __prop = %raw(`function(obj, key) { return obj[key] }`)
let prop = (obj, key: string) => __prop(obj, key)

@val external setTimeout: (unit => unit, int) => float = "setTimeout"
@val external clearTimeout: float => unit = "clearTimeout"

@inline
let propSafe = (obj: {..}, key: string): option<{..}> => {
  ignore(obj)
  ignore(key)
  Js.undefinedToOption(%raw(`obj[key]`))
}

@inline
let rec __path = (obj: option<{..}>, path_: array<string>, currentIndex: int): option<'t> => {
  switch obj {
  | Some(obj) =>
    ignore(obj)
    if Belt.Array.length(path_) - 1 == currentIndex {
      %raw(`obj[path_[currentIndex]]`)
    } else {
      __path(%raw(`obj[path_[currentIndex]]`), path_, currentIndex + 1)
    }
  | None => None
  }
}

let path = (obj, path) => __path(obj, path, 0)