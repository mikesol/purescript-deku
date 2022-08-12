import os
import json
exampleFiles = ['Pursx2.purs', 'Pursx1.purs', 'Portals1.purs', 'HelloWorld.purs', 'Events3.purs', 'Events.purs', 'Effects.purs', 'Component.purs', 'SSR/App.purs', 'SSR/Build.purs', 'SSR/Live.purs']

writePath = 'examples/docs/Examples.js'
pwritePath = 'examples/docs/Examples.purs'
examplesPath = 'examples/docs/Examples/'

o = []
p = ['module Examples where','']
for f in exampleFiles:
  fullPath = os.path.join(examplesPath, f)
  with open(fullPath, 'r') as infi:
    varname = fullPath.split('/')[-1][:-5]
    varname = varname[0].lower() + varname[1:]
    dumped = json.dumps('\n'.join(
        [x if 'module Deku.Examples.Docs.Examples' not in x else 'module Main where' for x in infi.read().split('\n')]))
    o.append(f'export const {varname} = {dumped}')
    p.append(f'foreign import {varname} :: String')

with open (writePath, 'w') as oufi:
  oufi.write('\n'.join(o))

with open(pwritePath, 'w') as oufi:
  oufi.write('\n'.join(p))
