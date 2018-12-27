#!/usr/bin/env python

import sys
import os
import fontforge

sfd_file = sys.argv[1]
pfa_file = os.path.basename(sfd_file).replace(".sfd", ".pfa")

f = fontforge.open(sfd_file)
f.generate(pfa_file, layer="Cube")
