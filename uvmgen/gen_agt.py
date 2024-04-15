import os
from mako.lookup import TemplateLookup


def gen_in_agt(name, root_dir):

    path_dir = root_dir + "\\src\\agents\\in_agent"

    agent_srcs = [
        (name + "_", "in_agent", ".sv"),
        (name + "_", "in_driver", ".sv"),
        (name + "_", "in_monitor", ".sv"),
        (name + "_", "in_trans", ".sv"),
        (name + "_", "sequencer", ".sv"),
        (name + "_", "in_pkg", ".sv"),
    ]
    for tup in agent_srcs:
        src_prefix = tup[0]
        src = tup[1]
        src_suffix = tup[2]

        fname_prefix = src_prefix + src
        fname = src_prefix + src + src_suffix
        ftpl = src + src_suffix + ".tpl"

        lookup = TemplateLookup(
            directories=[os.path.dirname(__file__) + "\\tpl"],
        )
        tpl = lookup.get_template(ftpl)

        if not os.path.exists(path_dir):
            mkcmd = "mkdir " + path_dir
            os.system(mkcmd)
        with open(path_dir + "\\" + fname, "w") as fout:
            try:
                fout.write(
                    tpl.render(
                        name=name,
                        fname_prefix=(fname_prefix).upper(),
                    )
                )
            finally:
                print(fname + "generate success!")


def gen_out_agt(name, root_dir):

    path_dir = root_dir + "\\src\\agents\\out_agent"

    agent_srcs = [
        (name + "_", "out_agent", ".sv"),
        (name + "_", "out_monitor", ".sv"),
        (name + "_", "out_trans", ".sv"),
        (name + "_", "ref_mdl", ".sv"),
        (name + "_", "scb", ".sv"),
        (name + "_", "out_pkg", ".sv"),
    ]
    for tup in agent_srcs:
        src_prefix = tup[0]
        src = tup[1]
        src_suffix = tup[2]

        fname_prefix = src_prefix + src
        fname = src_prefix + src + src_suffix
        ftpl = src + src_suffix + ".tpl"

        lookup = TemplateLookup(
            directories=[os.path.dirname(__file__) + "\\tpl"],
        )
        tpl = lookup.get_template(ftpl)

        if not os.path.exists(path_dir):
            mkcmd = "mkdir " + path_dir
            os.system(mkcmd)
        with open(path_dir + "\\" + fname, "w") as fout:
            try:
                fout.write(
                    tpl.render(
                        name=name,
                        fname_prefix=(fname_prefix).upper(),
                    )
                )
            finally:
                print(fname + "generate success!")
