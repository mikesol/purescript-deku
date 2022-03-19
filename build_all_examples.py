import os
import subprocess
examples = os.listdir('examples')

def as_ps(name):
  return ''.join([x[0].capitalize()+x[1:] for x in name.split('-')])

for example in examples:
  subprocess.run(
      'npx spago -x examples.dhall bundle-app --main Deku.Example.%s --to examples/%s/index.js' % (as_ps(example), example), shell=True, check=True)
