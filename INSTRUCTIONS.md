# KV store in Elixir

## Prerequisite

Install Elixir: https://elixir-lang.org/install/

## Goals

- Create an Elixir project from scratch using mix
- Use `mix` to add an external library
- Load data from a file and transform it using Elixir

If you follow the steps in this file, you should be able to reproduce this directory (except for this file, `INSTRUCTIONS.md`).

## Creating a project

```
mix new elixir_kvstore
```

```
mix test
```

Task: try modifying the docs and test again.

## Running code interactively

Launch the Elixir interactive shell:
```
iex -S mix
```

Load a module in the shell and run a function from that module:
```
iex> c("lib/elixir_kvstore.ex")
iex> ElixirKvstore.hello()
```

Every time you make code changes you will need to recompile to see the effects of your changes in the shell:

```
iex> recompile()
```

## Reading data from a file

Add this data in `data/cities.csv`

```
City,PostalCode
Bern,3000
Fribourg,1700
Neuchatel,2000
```

Task: add a function to read the data and run it:

```
iex> ElixirKvstore.read_data("data/cities.csv")
```

### Without external libraries

Use builtin modules `File.stream`, `Stream.map`, `Enum.drop`, `Enum.to_list`, `Map.new`, `String.split`, `String.trim_trailing`.

### With `nimble_csv`

Update deps in `mix.exs`, i.e. add `nimble_csv` as a dependency:

```
  defp deps do
  [
    {:nimble_csv, "~> 1.1"}
  ]
```

Then you can get and compile the external dependencies:
```
mix deps.get
mix deps.compile
```

Notice the newly generated `mix.lock` file.
