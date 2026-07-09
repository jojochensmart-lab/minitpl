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
test "render missing variables as empty string" {
  assert_eq(render("Hello {{name}}!", [], []), "Hello !")
}
