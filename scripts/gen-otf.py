#!/usr/bin/env python

import sys
import os
import fontforge

sfd_file = sys.argv[1]
otf_file = os.path.basename(sfd_file).replace(".sfd", ".otf")

f = fontforge.open(sfd_file)
f.generate(otf_file, layer="Cube")
