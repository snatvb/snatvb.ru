type t

type mo

@module("@mojs/core") external mo: mo = "default"

type shape

@send external play: shape => unit = "play"

type shapeType = [#circle]
@deriving(abstract)
type config = {
  @optional parent: string,
  @optional shape: shapeType,
  @optional fill: Js.Dict.t<string>,
  @optional radius: Js.Dict.t<int>,
  @optional duration: int,
  @optional isYoyo: bool,
  @optional isShowStart: bool,
  @optional easing: string,
  @optional repeat: int,
}

// module Shape = {
//   type bar
// }
@module("@mojs/core") @scope("default") @new external makeShape: config => shape = "Shape"

// type __createShape = (mo, config) => shape
// let __createShape: __createShape = %raw(`function(mo, config) { return new mo.Shape(config) }`)

// let makeShape = make
