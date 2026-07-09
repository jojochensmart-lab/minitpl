# MiniTPL

MiniTPL is a simple template renderer implemented in MoonBit.

It focuses on a small core goal: given a template string and data, render the
final string output.

## Features

- Replaces variables in `{{name}}` form.
- Keeps plain text unchanged.
- Supports passing variable names and values as arrays.

## Installation And Running

Make sure MoonBit is installed and available in your terminal:

```powershell
moon version
```

Check the project:

```powershell
moon check
```

Build the project:

```powershell
moon build
```

Run the example command:

```powershell
moon run cmd/main
```

Expected output:

```text
Hello MiniTPL! You are 5 years old.
```

Run the English example:

```powershell
moon run examples/english
```

Expected output:

```text
Hello MoonBit developer, welcome to MiniTPL.
```

Run the Chinese example:

```powershell
moon run examples/chinese
```

Expected output:

```text
你好，MoonBit 开发者！欢迎使用 MiniTPL。
```

## Running Tests

Run all tests with:

```powershell
moon test
```

## CI

GitHub Actions runs project checks, tests, and builds on push and pull request.
For local development, run `moon fmt` before committing MoonBit source changes.

## API Example

```moonbit
let tpl : String = "Hello {{name}}!"
let keys : Array[String] = ["name"]
let vals : Array[String] = ["MiniTPL"]
let output : String = @src.render(tpl, keys, vals)
println(output)
```

Output:

```text
Hello MiniTPL!
```

## Missing Variables

If a variable name does not exist in the provided keys, MiniTPL renders that
variable as an empty string.

For example, `Hello {{name}}!` with no `name` value becomes `Hello !`.

## Current Limitations

- Only simple `{{name}}` variable replacement is supported.
- Missing variables render as an empty string.
- There is no escaping syntax yet.
- There is no support for conditionals, loops, filters, or nested data.
- The current API receives keys and values as parallel arrays.

## Roadmap

- Improve the public API for passing template data.
- Add clearer error handling for malformed templates and mismatched data.
- Support escaping literal braces.
- Add more tests for edge cases.
- Expand examples and documentation.
- Add CI for automatic check, test, and build.

## License

This project is licensed under the Apache License 2.0. See [LICENSE](LICENSE)
for details.
