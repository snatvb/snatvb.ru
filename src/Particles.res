open Helpers

type canvasSize = {
  width: int,
  height: int,
}

type opts = {canvasSize: canvasSize}
module Canvas2d = Webapi.Canvas.Canvas2d
let tap = Helpers.tap

let pi2 = Js.Math._PI *. 2.0

module Particle = {
  type t = {
    mutable x: float,
    mutable y: float,
    mutable speed: float,
    mutable velocity: float,
    mutable size: float,
    mutable px: int,
    mutable py: int,
  }

  let make = ({canvasSize}) => {
    let x = Js.Math.random() *. canvasSize.width->Belt.Int.toFloat
    {
      x: x,
      y: 0.0,
      speed: 0.0,
      velocity: Js.Math.random() *. 1.25,
      size: Js.Math.random() *. 1.5 +. 1.0,
      px: x->Js.Math.floor,
      py: 0,
    }
  }

  let update = (ctx, mappedImage, particle) => {
    particle.px = particle.x->Js.Math.floor
    particle.py = particle.y->Js.Math.floor
    particle.speed =
      mappedImage->Js.Array2.unsafe_get(particle.py)->Js.Array2.unsafe_get(particle.px)

    particle.y = particle.y +. (2.5 -. particle.speed +. particle.velocity)
    if particle.y >= getHeightf(ctx) {
      particle.y = 0.0
      particle.speed = 0.0
      particle.velocity = Js.Math.random() *. 2.0
      particle.x = Js.Math.random() *. getWidthf(ctx)
    }
  }

  let draw = (ctx, particle) => {
    if particle.speed *. 0.4 > 0.0 {
      let _ =
        ctx
        ->tap(Canvas2d.beginPath)
        ->tap(Canvas2d.globalAlpha(_, particle.speed *. 0.03 +. 0.03))
        ->tap(Canvas2d.setFillStyle(_, Canvas2d.String, "#fff"))
        ->tap(
          Canvas2d.arc(
            ~x=particle.x,
            ~y=particle.y,
            ~r=particle.size,
            ~startAngle=0.0,
            ~endAngle=pi2,
            ~anticw=false,
          ),
        )
        ->tap(Canvas2d.fill)
    }
  }
}

// type t = {
//   count: int,
//   particles: array<Particle.t>,
// }

let generateParticles = (count, opts) => {
  let particles = []
  for i in 0 to count {
    let _ = i
    let _ = Js.Array2.push(particles, Particle.make(opts))
  }
  particles
}

let update = (ctx, mappedImage) => Belt.Array.forEach(_, Particle.update(ctx, mappedImage))
let draw = ctx => Belt.Array.forEach(_, Particle.draw(ctx))
let render = (particles, mappedImage, ctx) => {
  update(ctx, mappedImage, particles)
  draw(ctx, particles)
}

let make = (count, opts) => generateParticles(count, opts)
