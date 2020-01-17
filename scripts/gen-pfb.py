import sys
import os
import fontforge

sfd_file = sys.argv[1]
pfb_file = os.path.basename(sfd_file).replace(".sfd", ".pfb")

f = fontforge.open(sfd_file)
f.generate(pfb_file, layer="Cube")
