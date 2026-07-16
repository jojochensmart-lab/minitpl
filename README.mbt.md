# MiniTPL

MiniTPL is a lightweight MoonBit template toolkit for configuration generation,
document generation, and code snippet generation.

## Features

- `render` replaces `{{name}}` placeholders and trims surrounding whitespace.
- Missing variables render as empty strings.
- `extract_vars` returns template variables in source order.
- `lint` diagnoses empty names, unclosed placeholders, and missing variables.
- No external dependencies.

## Installation And Running

```powershell
moon check
moon test
moon build
```

## Examples

```powershell
moon run cmd/main
moon run examples/english
moon run examples/chinese
```

Expected output:

```text
Hello MiniTPL! You are 5 years old.
Hello MoonBit developer, welcome to MiniTPL.
你好，MoonBit 开发者！欢迎使用 MiniTPL。
```

## API Example

Render a template:

```moonbit nocheck
///|
let output = @src.render("Hello {{name}}!", ["name"], ["MiniTPL"])
```

Extract variables:

```moonbit nocheck
///|
let vars = @src.extract_vars("Hello {{ name }}, {{age}}")
```

Lint a template:

```moonbit nocheck
///|
let diagnostics = @src.lint("Hello {{name}} {{tool}}", ["name"])
```

## Publishing

MiniTPL is published to mooncakes.io as:

`joanna/minitpl@0.1.2`

Package page:

https://mooncakes.io/docs/joanna/minitpl@0.1.2

## Current Limitations

- Only simple `{{name}}` placeholders are supported.
- MiniTPL does not aim for full Mustache compatibility.
- `if`, `each`, filters, and nested data are not supported yet.
- Missing variables render as empty strings by default.

## License

MiniTPL is licensed under Apache-2.0.
