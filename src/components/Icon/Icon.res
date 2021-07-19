// type props = {className: option<string>}
// @obj external makeProps: (~className: option<string>=?, unit) => props = ""

// type kind = Avenger(props)

// let make = props => {
//   let {className} = props
//   <div ?className />
// }

module Solid = Icon__Solid

module Avenger = {
  @react.component
  let make = (~className: option<string>=?, ~fill: string="none") => {
    <svg
      ?className
      enableBackground="new 0 0 24 24"
      version="1.1"
      viewBox="0 0 24 24"
      xmlns="http://www.w3.org/2000/svg">
      <g>
        <path
          d="M16.5,5.8000002   c2.3869038,1.5050354,4,4.1696901,4,7.1999998c0,4.694397-3.805603,8.5-8.5,8.5   c-1.132019,0-2.2102051-0.2258301-3.197998-0.6275024l-0.788269,1.8392944C9.2434082,23.2171021,10.5881348,23.5,12,23.5   c5.7990112,0,10.5-4.7010498,10.5-10.5c0-4.1765337-2.4691105-7.8026972-6-9.4941177V0.5h-3l-0.956336,1.9996123l0,0   C12.3741608,2.4914808,12.1715164,2.5,12,2.5C6.2009888,2.5,1.5,7.2009888,1.5,13   c0,1.8676758,0.4929199,3.617981,1.3478394,5.1375122l1.1270142-2.3565063C3.6724243,14.9085693,3.5,13.9754028,3.5,13   c0-4.5466099,3.5962243-8.2681293,8.0857525-8.4974823l0,0L2.5,23.5h3l3-7H14v1l2.5-2l-2.5-2v1H9.5l4.5-10v7l2.5,2V5.8000002z"
          fill
          stroke="currentColor"
          strokeLinecap="round"
          strokeLinejoin="round"
          strokeMiterlimit="10"
        />
        <polygon
          fill
          points="14,19.5    16.5,19.5 16.5,17.5  "
          stroke="currentColor"
          strokeLinecap="round"
          strokeLinejoin="round"
          strokeMiterlimit="10"
        />
      </g>
    </svg>
  }
}

module Creed = {
  @react.component
  let make = (~className: option<string>=?, ~fill: string="none") => {
    <svg
      ?className
      enableBackground="new 0 0 24 24"
      version="1.1"
      viewBox="0 0 24 24"
      xmlSpace="preserve"
      xmlns="http://www.w3.org/2000/svg"
      xmlnsXlink="http://www.w3.org/1999/xlink">
      <path
        d="M11.5,5.4998851  c0,0,5.5801792,9.6045036,6.5,13c0.9244804,3.412693-3.9999018,5-3.9999018,5c3.9978857,0.0177937,4.500001-1,6.000001-2  s3.4999008-1,3.4999008-1c-1.5-2,0-5.000001,0-5.000001s-0.5000992,0.9985304-2,0.9985304  c-1.5000992,0-2.4999008-1.9985304-2.4999008-1.9985304l-7.000001-14L5,14.4998846c0,0-1,2.000001-2.5,2.000001  s-2-1.000001-2-1.000001s1.5,3.000001,0,5.000001c0,0,2,0,3.5,1s2.0021138,2.0177937,6,2c0,0-4.92448-1.587307-4-5  C6.9528885,14.9823217,11.5,5.4998851,11.5,5.4998851z"
        fill
        stroke="currentColor"
        strokeLinecap="round"
        strokeLinejoin="round"
        strokeMiterlimit="10"
      />
    </svg>
  }
}

module DealGlass = {
  @react.component
  let make = (~className: option<string>=?, ~fill: string="none") => {
    <svg
      ?className
      enableBackground="new 0 0 24 24"
      version="1.1"
      viewBox="0 0 24 24"
      xmlSpace="preserve"
      xmlns="http://www.w3.org/2000/svg"
      xmlnsXlink="http://www.w3.org/1999/xlink">
      <g>
        <polygon
          fill
          points="8.5,16.5    8.5,15.5 9.5,15.5 9.5,14.5 10.5,14.5 10.5,11.5 13.5,11.5 13.5,14.5 14.5,14.5 14.5,15.5 15.5,15.5 15.5,16.5 20.5,16.5    20.5,15.5 21.5,15.5 21.5,14.5 22.5,14.5 22.5,13.5 23.5,13.5 23.5,11.5 0.5,11.5 0.5,13.5 1.5,13.5 1.5,14.5 2.5,14.5 2.5,15.5    3.5,15.5 3.5,16.5  "
          stroke="currentColor"
          strokeLinecap="round"
          strokeLinejoin="round"
          strokeMiterlimit="10"
        />
        <rect fill="currentColor" height="1" width="1" x="15" y="12.5" />
        <rect fill="currentColor" height="1" width="1" x="16" y="13.5" />
        <rect fill="currentColor" height="1" width="1" x="17" y="14.5" />
        <rect fill="currentColor" height="1" width="1" x="3" y="12.5" />
        <rect fill="currentColor" height="1" width="1" x="4" y="13.5" />
        <rect fill="currentColor" height="1" width="1" x="5" y="14.5" />
        <polyline
          fill
          points="0.5,11.5    8.5,7.5 10.5,7.5 10.5,8.5  "
          stroke="currentColor"
          strokeLinecap="round"
          strokeLinejoin="round"
          strokeMiterlimit="10"
        />
        <polyline
          fill
          points="23.5,11.5    15.5,7.5 13.5,7.5 13.5,8.5  "
          stroke="currentColor"
          strokeLinecap="round"
          strokeLinejoin="round"
          strokeMiterlimit="10"
        />
      </g>
    </svg>
  }
}
