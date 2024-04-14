import argparse

parser = argparse.ArgumentParser(
    description=__doc__,
    formatter_class=argparse.RawDescriptionHelpFormatter,
)
parser.add_argument("tens", type=str, help="tens", default="9")
parser.add_argument("ones", type=str, help="ones", default="5")
parser.add_argument(
    "-v",
    "--verbosity",
    type=int,
    help="increase output verbosity",
    choices=[0, 1, 2, 3],
    default=0,
)
args = parser.parse_args()

# print(parser.__doc__)

if args.verbosity == 0:
    print(args.tens + args.ones)
elif args.verbosity == 1:
    print(int(args.ones) ** 2)
elif args.verbosity == 2:
    print(int(args.tens) ** 2)
else:
    print(int(args.ones) * int(args.tens))
