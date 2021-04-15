defmodule Counter do
  use GenServer

  def start_link(state, opts) do
    IO.puts "--- Counter.start_link(#{inspect state}, #{inspect opts}) called ---"
    GenServer.start_link(__MODULE__, state, opts)
  end

  # GenServer起動時に実行される（処理がなければ省略可）
  def init(state) do
    IO.puts "--- init(#{inspect state}) called ---"
    {:ok, state}
  end

  def handle_call(:up, from, state) do
    IO.puts "--- handle_call(:up, #{inspect from}, #{inspect state}) called ---"
    state = state + 1
    {:reply, "result: count up to #{inspect state}", state}
  end

  def handle_call(:down, from, state) do
    IO.puts "--- handle_call(:down, #{inspect from}, #{inspect state}) called ---"
    state = state - 1
    {:reply, "result: count down to #{inspect state}", state}
  end

  def handle_cast(:up, state) do
    IO.puts "--- handle_cast(:up, #{inspect state}) called ---"
    state = state + 1
    IO.puts "--- state -> #{state} ---"
    {:noreply, state}
  end

  def handle_cast(:down, state) do
    IO.puts "--- handle_cast(:down, #{inspect state}) called ---"
    state = state - 1
    IO.puts "--- state -> #{state} ---"
    {:noreply, state}
  end

end

# iex counter_server.ex
# import Supervisor.Spec
# children = [worker(Counter, [5, [name: :counter_process]])]
# Supervisor.start_link(children, strategy: :one_for_one)
# GenServer.call(:counter_process, :up)
# GenServer.cast(:counter_process, :down)

# プロセスに命名したことでpidなしで呼び出せるようになったが、必要な場合は以下の通り呼び出せる。
# pid = :erlang.whereis(:counter_process)

# Process.exit(pid, "Can you reboot？")
