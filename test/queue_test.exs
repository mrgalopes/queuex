defmodule QueueTest do
  use ExUnit.Case

  test "should start queue with initial state" do
    {:ok, pid} = Queue.start_link([1, 2, 3])

    assert 1 == Queue.dequeue(pid)
    assert 2 == Queue.dequeue(pid)
    assert 3 == Queue.dequeue(pid)
    assert nil == Queue.dequeue(pid)
  end

  test "should insert and remove element from queue" do
    {:ok, pid} = Queue.start_link()

    assert :ok == Queue.enqueue(pid, 3)
    assert :ok == Queue.enqueue(pid, 2)
    assert :ok == Queue.enqueue(pid, 1)
    assert 3 == Queue.dequeue(pid)
    assert 2 == Queue.dequeue(pid)
    assert 1 == Queue.dequeue(pid)
    assert nil == Queue.dequeue(pid)
  end
end
