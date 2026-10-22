# KV store using a GenServer

## Prerequisite

Make sure you have followed the first part, `INSTRUCTIONS.md`

## Goals

- Understand GenServer: what they are, when to use them, and how to implement them

## Implement the KV store

Add the file `lib/kvstore_server.ex`

Launch an interactive shell:

```
iex -S mix
```

Add the `Server` part of the code and run:
```
iex> {:ok, pid} = GenServer.start_link(KvstoreServer, %{"Fribourg": 1700, "Neuchatel": 2000})
iex> GenServer.call(pid, {:put, "Bern", 3000})
iex> GenServer.call(pid, {:keys})
```

Add the `Client` part of the code and run:

```
iex> {:ok, pid1} = KvstoreServer.start_link(%{"Fribourg": 1700})
iex> {:ok, pid2} = KvstoreServer.start_link(%{"Bern": 3000})

iex> KvstoreServer.put(pid1, :Neuchatel, 2000)

iex> KvstoreServer.keys(pid1)
iex> KvstoreServer.keys(pid2)
```