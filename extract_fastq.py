#!/usr/bin/env python

import sys
import gzip

def main():
    names_fname, fastq_fname, out_fname = sys.argv[1:4]
    names = set([line.rstrip().encode('utf8') for line in open(names_fname)])
    print(names)
    fs = gzip.open(fastq_fname, 'rb')
    capture = False
    output = gzip.open(out_fname, 'wb')
    for i, line in enumerate(fs):
        if i % 4 == 0:
            name = line.rstrip()[1:-2]
            if i == 0:
                print(name)
            if name in names:
                capture = True
        if capture:
            output.write(line)
            if i % 4 == 3:
                capture = False
    fs.close()
    output.close()

main()