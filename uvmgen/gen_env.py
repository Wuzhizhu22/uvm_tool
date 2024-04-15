import os
from mako.lookup import TemplateLookup


def gen_env(name, root_dir):

    path_dir = root_dir + "\\src\\env\\"

    agent_srcs = [
        (name + "_", "env", ".sv"),
        (name + "_", "env_pkg", ".sv"),
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
