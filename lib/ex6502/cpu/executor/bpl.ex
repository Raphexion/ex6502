defmodule Ex6502.CPU.Executor.BPL do
  @moduledoc """
  Branch on result plus

  Take a conditional branch if the N bit is reset (clear/0)

  ## Table

      BPL | Branch on Result Plus
      ================================================

                                       N V - B D I Z C
                                       - - - - - - - -

      addressing       assembler    opc  bytes  cycles
      ------------------------------------------------
      relative         BPL $nnnn    10     2     2 tp

      p: +1 if page is crossed
      t: +1 if branch is taken

  """

  alias Ex6502.{Computer, CPU}
  import CPU.Executor.Branching

  # addressing       assembler    opc  bytes  cycles
  # relative         BPL $nnnn    10     2     2 tp
  def execute(%Computer{data_bus: 0x10} = c), do: branch(c, !CPU.flag(c, :n))
end
