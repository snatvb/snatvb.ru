let head = Belt.Array.get(_, 0)

let headWithTail = arr => {
  switch head(arr) {
  | Some(first) => (Some(first), Belt.Array.sliceToEnd(arr, 1))
  | None => (None, [])
  }
}
