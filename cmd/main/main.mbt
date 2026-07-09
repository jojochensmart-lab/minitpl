///|
fn main {
  let tpl : String = "Hello {{name}}! You are {{age}} years old."
  let keys : Array[String] = ["name", "age"]
  let vals : Array[String] = ["MiniTPL", "5"]
  let output : String = @src.render(tpl, keys, vals)
  println(output)
}
