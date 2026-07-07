pub fn render(tpl : String, keys : Array[String], vals : Array[String]) -> String {
  let mut result : String = ""
  let mut buf : String = ""
  let mut in_var : Bool = false
  let mut i : Int = 0
  
  while i < tpl.length() {
    let ch : String = tpl[i:i+1].to_owned()
    
    if ch == "{" && i + 1 < tpl.length() && tpl[i+1:i+2].to_owned() == "{" {
      result = result + buf
      buf = ""
      in_var = true
      i = i + 2
    } else if ch == "}" && i + 1 < tpl.length() && tpl[i+1:i+2].to_owned() == "}" {
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
