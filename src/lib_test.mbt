///|
fn assert_string_array_eq(
  actual : Array[String],
  expected : Array[String],
) -> Unit {
  if actual.length() != expected.length() {
    abort("array length mismatch")
  }
  for i = 0; i < actual.length(); i = i + 1 {
    if actual[i] != expected[i] {
      abort("array item mismatch")
    }
  }
}

///|
test "render replaces variables" {
  let tpl = "Hello {{name}}! You are {{age}} years old."
  let keys = ["name", "age"]
  let vals = ["MiniTPL", "5"]
  assert_eq(render(tpl, keys, vals), "Hello MiniTPL! You are 5 years old.")
}

///|
test "render trims variable names" {
  let tpl = "Hello {{ name }}! You are {{  age  }} years old."
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

///|
test "render known and missing variables" {
  let tpl = "{{name}} uses {{tool}}."
  let keys = ["name"]
  let vals = ["MiniTPL"]
  assert_eq(render(tpl, keys, vals), "MiniTPL uses .")
}

///|
test "render multiple missing variables as empty strings" {
  let tpl = "{{first}}-{{second}}-{{third}}"
  let keys = ["second"]
  let vals = ["B"]
  assert_eq(render(tpl, keys, vals), "-B-")
}

///|
test "extract single variable" {
  assert_string_array_eq(extract_vars("Hello {{name}}!"), ["name"])
}

///|
test "extract multiple variables" {
  assert_string_array_eq(extract_vars("Hello {{name}}, {{age}}"), [
    "name", "age",
  ])
}

///|
test "extract trims variable names" {
  assert_string_array_eq(extract_vars("Hello {{ name }}, {{  age  }}"), [
    "name", "age",
  ])
}

///|
test "extract keeps repeated variables" {
  assert_string_array_eq(extract_vars("{{name}} and {{name}}"), ["name", "name"])
}

///|
test "lint detects empty variable name" {
  assert_string_array_eq(lint("Hello {{}}!", []), ["empty variable name"])
}

///|
test "lint detects unclosed placeholder" {
  assert_string_array_eq(lint("Hello {{name", ["name"]), [
    "unclosed placeholder",
  ])
}

///|
test "lint reports missing variable" {
  assert_string_array_eq(lint("Hello {{name}}!", []), ["missing variable: name"])
}

///|
test "lint treats variable spacing as valid" {
  assert_string_array_eq(lint("Hello {{ name }}!", ["name"]), [])
}
