defmodule Queue do
  use GenServer

  # Client
  def start_link(initial_state \\ []) when is_list(initial_state) do
    GenServer.start_link(__MODULE__, initial_state)
  end

  def enqueue(pid, element) do
    GenServer.cast(pid, {:enqueue, element})
  end

  def dequeue(pid) do
    GenServer.call(pid, :dequeue)
  end

  # Server

  @impl true
  def init(initial_queue) do
    {:ok, initial_queue}
  end

  @impl true
  def handle_cast({:enqueue, element}, queue) do
    {:noreply, queue ++ [element]}
  end

  @impl true
  def handle_call(:dequeue, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_call(:dequeue, _from, []), do: {:reply, nil, []}
end
