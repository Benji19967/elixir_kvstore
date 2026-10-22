defmodule KvstoreServer do
  use GenServer

  # Client
  def start_link(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def put(pid, key, value) do
    GenServer.call(pid, {:put, key, value})
  end

  def keys(pid) do
    GenServer.call(pid, {:keys})
  end

  # Server
  @impl true
  def init(init_keys_and_vals) do
    initial_state = Map.new(init_keys_and_vals)
    {:ok, initial_state}
  end

  @impl true
  def handle_call({:put, key, value}, _from, state) do
    new_state = Map.put(state, key, value)
    {:reply, :ok, new_state}
  end

  @impl true
  def handle_call({:keys}, _from, state) do
    {:reply, Map.keys(state), state}
  end
end
