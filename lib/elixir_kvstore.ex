defmodule ElixirKvstore do
  @moduledoc """
  Documentation for `ElixirKvstore`.
  """
  NimbleCSV.define(MyParser, separator: ",", escape: "\\")

  @doc """
  Hello world.

  ## Examples

      iex> ElixirKvstore.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  Read a simple CSV file into a map.
  """
  def read_data(filepath) do
    File.stream!(filepath)
    |> Enum.drop(1)
    |> Stream.map(&String.trim_trailing/1) # or Stream.map(&String.trim_trailing(&1))
    |> Stream.map(&String.split(&1, ","))
    |> Enum.to_list()
    |> Map.new(fn [k, v] -> {k, v} end)
  end

  @doc """
  Read a simple CSV file into a map using a library.
  """
  def read_data_using_library(filepath) do
    File.stream!(filepath)
    |> MyParser.parse_stream()
    |> Enum.to_list()
    |> Map.new(fn [k, v] -> {k, v} end)
  end
end
