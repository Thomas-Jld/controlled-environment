from argparse import ArgumentParser
from display.plot import plot


parser = ArgumentParser()
parser.add_argument("-d", "--display", action="store_true")
parser.add_argument("-r", "--record", action="store_true")
args = parser.parse_args()

if args.display: plot(args.record)
