///|
fn main {
  let tpl : String = "你好，{{name}}！欢迎使用 {{project}}。"
  let keys : Array[String] = ["name", "project"]
  let vals : Array[String] = ["MoonBit 开发者", "MiniTPL"]
  let output : String = @src.render(tpl, keys, vals)
  println(output)
}
