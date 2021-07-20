// @module("./Photo.module.scss") external styles: {..} = "default"
open Common
open Helpers
module Image = Webapi.Dom.HtmlImageElement
module ImageData = Webapi.Dom.Image
module Canvas2d = Webapi.Canvas.Canvas2d

@send external drawImage: (Canvas2d.t, Image.t, int, int, int, int) => unit = "drawImage"
// @send external getDataPixels: (Webapi__Dom__Image.t, int) => float = "getDataPixels"

let calculateRelativeBrightness = (red, green, blue) => {
  Js.Math.sqrt(red *. red *. 0.299 +. green *. green *. 0.587 +. blue *. blue *. 0.144) /. 100.0
}

let calculateParticlesCount = size => Belt.Float.toInt(size.width *. size.height *. 0.0137174211)

let getMappedImage = ctx => {
  let pixels = Canvas2d.getImageData(ctx, ~sx=0.0, ~sy=0.0, ~sw=getWidthf(ctx), ~sh=getHeightf(ctx))
  let mappedImage = []
  let heightIndex = getHeight(ctx) - 1
  let widthIndex = getWidth(ctx) - 1
  for y in 0 to heightIndex {
    let row = []
    for x in 0 to widthIndex {
      ignore(x)
      ignore(y)
      let yf = y->Belt.Int.toFloat
      let xf = x->Belt.Int.toFloat
      let offset = yf *. 4.0 *. ImageData.width(pixels)
      let x4 = xf *. 4.0
      let red =
        pixels
        ->ImageData.data
        ->Js.TypedArray2.Uint8ClampedArray.unsafe_get(Belt.Float.toInt(offset +. x4))
      let green =
        pixels
        ->ImageData.data
        ->Js.TypedArray2.Uint8ClampedArray.unsafe_get(Belt.Float.toInt(offset +. (x4 +. 1.0)))
      let blue =
        pixels
        ->ImageData.data
        ->Js.TypedArray2.Uint8ClampedArray.unsafe_get(Belt.Float.toInt(offset +. (x4 +. 2.0)))
      let brightness = calculateRelativeBrightness(
        red->Belt.Int.toFloat,
        green->Belt.Int.toFloat,
        blue->Belt.Int.toFloat,
      )
      let _ = Js.Array2.push(row, brightness)
    }
    let _ = Js.Array2.push(mappedImage, row)
  }
  mappedImage
}

let work = (ctx: Canvas2d.t, src, particlesCount) => {
  let image = Image.make()
  let width = getWidth(ctx)
  let height = getHeight(ctx)
  let rafId = ref(0)
  let mappedImage = ref([])
  let particles = Particles.make(particlesCount, {canvasSize: {width: width, height: height}})

  let rec animate = _ => {
    let _ =
      ctx
      // ->tap(drawImage(_, image, 0, 0, width, height))
      ->tap(Canvas2d.globalAlpha(_, 0.05))
      ->tap(Canvas2d.setFillStyle(_, Canvas2d.String, "rgb(0, 0, 0)"))
      ->tap(Canvas2d.fillRect(~x=0.0, ~y=0.0, ~w=getWidthf(ctx), ~h=getHeightf(ctx)))
      ->tap(Particles.render(particles, mappedImage.contents))
    rafId := requestAnimationFrame(animate)
  }

  let _ =
    image
    ->tap(Image.setSrc(_, src))
    ->tap(Image.setWidth(_, width))
    ->tap(Image.setHeight(_, height))
    ->tap(
      Image.addLoadEventListener(_ => {
        let _ = ctx->tap(drawImage(_, image, 0, 0, width, height))
        mappedImage := getMappedImage(ctx)
        let _ = ctx->Canvas2d.clearRect(~x=0.0, ~y=0.0, ~w=getWidthf(ctx), ~h=getHeightf(ctx))
        animate(0.0)
      }),
    )
  Some(() => cancelAnimationFrame(rafId.contents))
}

@react.component
let make = React.memo((
  ~className: option<string>=?,
  ~size: size,
  ~src: string,
  ~particlesCount=calculateParticlesCount(size),
) => {
  let ref = React.useRef(Js.Nullable.null)

  React.useEffect0(() =>
    ref.current
    ->Js.Nullable.toOption
    ->Belt.Option.map(Webapi.Canvas.CanvasElement.getContext2d)
    ->Belt.Option.flatMap(work(_, src, particlesCount))
  )

  <canvas
    ?className
    ref={ref->ReactDOM.Ref.domRef}
    width={size.width->Belt.Float.toString}
    height={size.height->Belt.Float.toString}
  />
})
