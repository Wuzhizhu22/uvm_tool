import os
from mako.lookup import TemplateLookup


def gen_tt(name, root_dir):
    tt_dir = root_dir

    agent_srcs = [
        (tt_dir + "\\tb", "", "top_tb", ".sv"),
        (tt_dir + "\\tests", "", "base_test", ".sv"),
        (tt_dir + "\\tests", "", "tc_test_exp_case", ".sv"),
        (tt_dir + "\\tests", "", "test_lib", ".sv"),
        (tt_dir + "\\tests", "", "test_pkg", ".sv"),
        (tt_dir + "\\src\\seq", "", "seq_pkg", ".sv"),
        (tt_dir + "\\src\\seq", "", "seq_exp", ".sv"),
    ]
    for tup in agent_srcs:
        path_dir = tup[0]
        src_prefix = tup[1]
        src = tup[2]
        src_suffix = tup[3]

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
                print(fname + " generate success!")
