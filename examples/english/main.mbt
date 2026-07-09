///|
fn main {
  let tpl : String = "Hello {{name}}, welcome to {{project}}."
  let keys : Array[String] = ["name", "project"]
  let vals : Array[String] = ["MoonBit developer", "MiniTPL"]
  let output : String = @src.render(tpl, keys, vals)
  println(output)
}
