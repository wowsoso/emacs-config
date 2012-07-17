#!/usr/bin/env python
from binascii import a2b_base64, b2a_base64

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 3:
        raise Exception("two arg! two arg!!")
    if sys.argv[1] == "a2b":
        sys.stdout.write(a2b_base64(sys.argv[2]))
    if sys.argv[1] == "b2a":
        sys.stdout.write(b2a_base64(sys.argv[2]))
