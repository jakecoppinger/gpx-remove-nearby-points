#!/usr/bin/env python3

import sys
assert(len(sys.argv) == 3)
number,decimalPlaces = sys.argv[1:]

integer, decimal = number.split('.')

decimal = decimal[0:min(len(decimal), int(decimalPlaces))]

print(f'{integer}\.{decimal}')
