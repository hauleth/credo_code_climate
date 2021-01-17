# CredoCodeClimate

Generate CodeClimate report of the Credo lint.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `credo_code_climate` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:credo_code_climate, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/credo_code_climate](https://hexdocs.pm/credo_code_climate).

## Usage

Add `{CredoCodeClimate, []}` to list of plugins in `.credo.exs` (if you have no
such file then first generate it via `mix credo.gen.config`).

### Options

- `:path` - where the generated report will be stored. Defaults to
  `codeclimate.json` in the root directory.
