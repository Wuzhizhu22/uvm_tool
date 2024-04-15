import argparse
import gen_intf
import gen_env
import gen_agt


def main():
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )

    parser.add_argument(
        "name",
        metavar="[ip/block name]",
        help="""Name of the ip/block""",
    )

    parser.add_argument(
        "-o",
        "--outdir",
        metavar="[outdir]",
        help="""Path to place the code.(default set to './<name>')""",
    )

    args = parser.parse_args()

    if not args.outdir:
        args.outdir = args.name

    gen_intf.gen_intf(
        args.name,
        args.outdir,
    )

    gen_env.gen_env(
        args.name,
        args.outdir,
    )

    gen_agt.gen_in_agt(
        args.name,
        args.outdir,
    )

    gen_agt.gen_out_agt(
        args.name,
        args.outdir,
    )


if __name__ == "__main__":
    main()
