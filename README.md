# uvm_tool
    出于验证工程师繁复搭建验证环境的工作需求，本项目旨在创建一个适用的uvm自动化脚本。
    但由于自身能力问题，本项目初期只是对谷歌opentitan中自动化工具的拙劣模仿。
    同时本项目在行为上也会集百家之短。未来可期。

## v0.99
    文件总体结构按照曾做过的小项目来
    脚本行为模仿谷歌opentitan中自动化工具uvmdvgen
    部分代码模板模仿vcs自带uvmgen

## Help switch (-h)
    usage: uvmgen.py [-h] [-o [outdir]] [ip/block name]

    positional arguments:
    [ip/block name]       Name of the ip/block

    options:
    -h, --help            show this help message and exit
    -o [outdir], --outdir [outdir]
                            Path to place the code.(default set to './<name>')

## structural
    ├─interfaces
    │      xxxx_intf.sv
    │      
    ├─rtl
    │      xxxx.sv
    │
    ├─scripts
    │      filelist.f
    │
    ├─sim
    │      run.do
    │
    ├─src
    │  ├─agents
    │  │  ├─in_agent
    │  │  │      xxxx_in_agent.sv
    │  │  │      xxxx_in_driver.sv
    │  │  │      xxxx_in_monitor.sv
    │  │  │      xxxx_in_trans.sv
    │  │  │      xxxx_sequencer.sv
    │  │  │      in_pkg.sv
    │  │  │
    │  │  └─out_agent
    │  │          xxxx_out_agent.sv
    │  │          xxxx_out_monitor.sv
    │  │          xxxx_out_trans.sv
    │  │          xxxx_ref_mdl.sv
    │  │          xxxx_scb.sv
    │  │          out_pkg.sv
    │  │
    │  ├─env
    │  │      xxxx_env.sv
    │  │      env_pkg.sv
    │  │
    │  └─seq
    │          seq_pkg.sv
    │          seq_exp.sv
    │
    ├─tb
    │      top_tb.sv
    │
    └─tests
            base_test.sv
            tc_xxxx_case.sv
            test_lib.sv
            test_pkg.sv