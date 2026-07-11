# Release Checklist

## Repository

- GitHub repository: ready.
- Gitlink repository: ready.
- CI status: passing on GitHub Actions.
- License: Apache License 2.0, see [LICENSE](LICENSE).

## Local Validation

- `moon check`: passing locally.
- `moon test`: passing locally.
- `moon build`: passing locally.
- Examples: available under `examples/english` and `examples/chinese`.

## Package Configuration

- `moon.mod` defines the module name: `jojochensmart-lab/minitpl`.
- `moon.mod` defines version: `0.1.0`.
- `moon.mod` defines license: `Apache-2.0`.
- Generated package interfaces are present as `pkg.generated.mbti` files.

## mooncakes.io

- Publish status: not published yet.
- Recommended pre-publish check:

```powershell
moon check
moon test
moon build
moon publish --dry-run
```

- Publish command after login:

```powershell
moon login
moon publish
```

## Difference From Mustache-like Template Engines

- MiniTPL does not aim for full Mustache syntax compatibility.
- MiniTPL focuses on lightweight, predictable, easy-to-test template behavior.
- MiniTPL provides template variable analysis through `extract_vars`.
- MiniTPL provides error and warning diagnostics through `lint`.
- MiniTPL is intended for CI or build workflows where missing template variables
  should be detected before rendering generated configuration, documentation, or
  code snippets.
