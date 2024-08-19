defmodule Sequence.Server do
  use GenServer
    # Client API

    def start_link(initial_value) do
      GenServer.start_link(__MODULE__, initial_value, name: __MODULE__)
    end

    def increment_number(value) do
      GenServer.cast(__MODULE__, {:increment, value})
    end

    def next_number do
      GenServer.cast(__MODULE__, :next_number)
    end

    # Server Callbacks

    def init(initial_value) do
      {:ok, [data: initial_value]}
    end

    def handle_cast({:increment, value}, state) do
      [data: current_value] = state
      new_state = [data: current_value + value]
      {:noreply, new_state}
    end

    def handle_cast(:next_number, state) do
      [data: current_value] = state
      new_state = [data: current_value + 1]
      IO.puts("State incremented to #{new_state[:data]}")
      {:noreply, new_state}
    end
  end
