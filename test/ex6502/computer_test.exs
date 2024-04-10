defmodule Ex6502.ComputerTest do
  use ExUnit.Case, async: true

  alias Ex6502.Computer
  alias Ex6502.Memory

  test "init computer with specific memory" do
    memory =
      Memory.init(0xFFFF)
      |> Memory.set_reset_vector(0x8000)

    assert %Computer{memory: ^memory} = Computer.init(memory: memory)
    assert is_list(memory)
  end

  test "init computer without specific memory" do
    assert %Computer{memory: memory} = Computer.init()
    assert is_list(memory)
  end
end
