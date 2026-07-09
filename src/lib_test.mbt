///|
test "render replaces variables" {
  let tpl = "Hello {{name}}! You are {{age}} years old."
  let keys = ["name", "age"]
  let vals = ["MiniTPL", "5"]
  assert_eq(render(tpl, keys, vals), "Hello MiniTPL! You are 5 years old.")
}

///|
test "render keeps plain text" {
  assert_eq(render("plain text", [], []), "plain text")
}

///|
test "render replaces repeated variables" {
  let tpl = "{{name}} likes {{name}}."
  let keys = ["name"]
  let vals = ["MiniTPL"]
  assert_eq(render(tpl, keys, vals), "MiniTPL likes MiniTPL.")
}

///|
test "render empty template" {
  assert_eq(render("", ["name"], ["MiniTPL"]), "")
}

///|
test "render Chinese variable value" {
  let tpl = "你好，{{name}}！"
  let keys = ["name"]
  let vals = ["月兔"]
  assert_eq(render(tpl, keys, vals), "你好，月兔！")
}

///|
test "render missing variables as empty string" {
  assert_eq(render("Hello {{name}}!", [], []), "Hello !")
}
