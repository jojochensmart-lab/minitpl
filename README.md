# MiniTPL

MiniTPL is a lightweight MoonBit template toolkit for configuration generation,
document fragments, and code snippets.

Besides basic variable replacement, it provides variable extraction, template
static checks, and missing-variable diagnostics so templates can be validated
early in CI or build workflows.

## Features

- Basic `{{name}}` variable replacement with `render`.
- Trims whitespace around variable names, such as `{{ name }}`.
- Leniently renders missing variables as an empty string.
- Extracts template variables in source order with `extract_vars`.
- Statically checks templates with `lint`.
- Diagnoses empty variable names.
- Diagnoses unclosed placeholders.
- Diagnoses missing variables.
- Has no external dependencies.

## Installation And Running

Make sure MoonBit is installed and available in your terminal:

```powershell
moon version
```

Format, check, test, and build the project:

```powershell
moon fmt
moon check
moon test
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

## CI

GitHub Actions runs project checks, tests, and builds on push and pull request.
For local development, run `moon fmt` before committing MoonBit source changes.

## Publishing

MiniTPL is published to mooncakes.io as:

`joanna/minitpl@0.1.1`

Package page:

https://mooncakes.io/docs/joanna/minitpl@0.1.1

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

Extract variables from a template:

```moonbit
let vars : Array[String] = @src.extract_vars("Hello {{ name }}, {{age}}")
```

The result is `["name", "age"]`. Variable names are trimmed, order is preserved,
and repeated variables are kept.

Lint a template before rendering:

```moonbit
let diagnostics : Array[String] = @src.lint("Hello {{name}} {{tool}}", ["name"])
```

The result is `["missing variable: tool"]`.

## Missing Variables

If a variable name does not exist in the provided keys, MiniTPL renders that
variable as an empty string.

For example, `Hello {{name}}!` with no `name` value becomes `Hello !`.

## Current Limitations

- Only simple `{{name}}` placeholder rendering is supported.
- MiniTPL does not aim for full Mustache compatibility.
- `if`, `each`, filters, and nested data are not supported yet.
- Missing variables render as an empty string by default.

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
