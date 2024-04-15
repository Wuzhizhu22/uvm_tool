import os
from mako.lookup import TemplateLookup


def gen_intf(name, root_dir):
    path_dir = root_dir + "\\interfaces\\"

    agent_srcs = [
        (name + "_", "intf", ".sv"),
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
                print("intf generate success!")
