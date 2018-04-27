action = "simulation"
sim_tool = "ghdl"
sim_top = "fa_tb"

sim_pre_cmd = "rm -rf *.vcd *.vvp work/"

"""
open_gtkwave = False

if open_gtkwave:
    sim_post_cmd = "vvp fa_tb.vvp; gtkwave fa_tb.vcd"
else:
    sim_post_cmd = "vvp fa_tb.vvp"
"""

modules = {
    "local" : [ "../", ],
}
