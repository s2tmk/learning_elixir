defmodule Counter do
  use GenServer

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

# プロセスを起動する
# GenServer.start_link(Counter, 0)
