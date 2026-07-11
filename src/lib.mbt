///|
pub fn render(
  tpl : String,
  keys : Array[String],
  vals : Array[String],
) -> String {
  let mut result : String = ""
  let mut buf : String = ""
  let mut in_var : Bool = false
  let mut i : Int = 0

  while i < tpl.length() {
    let ch : String = tpl[i:i + 1].to_owned()

    if ch == "{" && i + 1 < tpl.length() && tpl[i + 1:i + 2].to_owned() == "{" {
      result = result + buf
      buf = ""
      in_var = true
      i = i + 2
    } else if ch == "}" &&
      i + 1 < tpl.length() &&
      tpl[i + 1:i + 2].to_owned() == "}" {
      let var_name : String = buf.trim().to_owned()
      let mut found_val : String = ""
      for j = 0; j < keys.length(); j = j + 1 {
        if keys[j] == var_name {
          found_val = vals[j]
          break
        }
      }
      result = result + found_val
      buf = ""
      in_var = false
      i = i + 2
    } else if in_var {
      buf = buf + ch
      i = i + 1
    } else {
      buf = buf + ch
      i = i + 1
    }
  }

  result + buf
}

///|
pub fn extract_vars(tpl : String) -> Array[String] {
  let vars : Array[String] = []
  let mut buf : String = ""
  let mut in_var : Bool = false
  let mut i : Int = 0

  while i < tpl.length() {
    let ch : String = tpl[i:i + 1].to_owned()

    if ch == "{" && i + 1 < tpl.length() && tpl[i + 1:i + 2].to_owned() == "{" {
      buf = ""
      in_var = true
      i = i + 2
    } else if ch == "}" &&
      i + 1 < tpl.length() &&
      tpl[i + 1:i + 2].to_owned() == "}" {
      if in_var {
        vars.push(buf.trim().to_owned())
      }
      buf = ""
      in_var = false
      i = i + 2
    } else if in_var {
      buf = buf + ch
      i = i + 1
    } else {
      i = i + 1
    }
  }

  vars
}

///|
fn has_key(keys : Array[String], name : String) -> Bool {
  for i = 0; i < keys.length(); i = i + 1 {
    if keys[i] == name {
      return true
    }
  }
  false
}

///|
pub fn lint(tpl : String, keys : Array[String]) -> Array[String] {
  let diagnostics : Array[String] = []
  let mut buf : String = ""
  let mut in_var : Bool = false
  let mut i : Int = 0

  while i < tpl.length() {
    let ch : String = tpl[i:i + 1].to_owned()

    if ch == "{" && i + 1 < tpl.length() && tpl[i + 1:i + 2].to_owned() == "{" {
      buf = ""
      in_var = true
      i = i + 2
    } else if ch == "}" &&
      i + 1 < tpl.length() &&
      tpl[i + 1:i + 2].to_owned() == "}" {
      if in_var {
        let var_name : String = buf.trim().to_owned()
        if var_name == "" {
          diagnostics.push("empty variable name")
        } else if !has_key(keys, var_name) {
          diagnostics.push("missing variable: " + var_name)
        }
      }
      buf = ""
      in_var = false
      i = i + 2
    } else if in_var {
      buf = buf + ch
      i = i + 1
    } else {
      i = i + 1
    }
  }

  if in_var {
    diagnostics.push("unclosed placeholder")
  }

  diagnostics
}

///|
test {
  let tpl : String = "Hello {{name}}!"
  let result : String = render(tpl, ["name"], ["MoonBit"])
  if result != "Hello MoonBit!" {
    abort("test failed")
  }
}

///|
test {
  let tpl : String = "{{a}} and {{b}}"
  let result : String = render(tpl, ["a", "b"], ["X", "Y"])
  if result != "X and Y" {
    abort("test failed")
  }
}

///|
test {
  let tpl : String = "Hello {{unknown}}!"
  let result : String = render(tpl, ["name"], ["MoonBit"])
  if result != "Hello !" {
    abort("test failed")
  }
}
