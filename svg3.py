from svg2 import A
import os

def u(attr):
    x = ''.join([y[0].upper()+y[1:] for y in attr.split('-' if '-' in attr else ':')])
    return x

def eltMe(name, nameUc):
    o = f'''module Deku.DOM.Elt.{nameUc} where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Nut(..), Nut', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data {nameUc}_

{name}
  :: Event (Attribute {nameUc}_)
  -> Array Nut
  -> Nut
{name} attributes kids = Nut
  ( Element'
      ( elementify "{name}" attributes
          ( (coerce :: Nut' payload -> Nut)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

{name}_
  :: Array Nut
  -> Nut
{name}_ = {name} empty
'''
    return o

# for key in A.keys():
#     upper = key[0].upper()+key[1:]
#     e = eltMe(key, upper)
#     path = './src/Deku/DOM/Elt/%s.purs' % upper
#     with open(path,'w') as ofi:
#         ofi.write(e)

for key, val in A.items():
    upperKey = key[0].upper()+key[1:]
    val = list(set(val))
    #e = eltMe(key, upper)
    for attr in val:
        if attr[:2] == 'on': continue
        upperAttr = u(attr)
        path = './src/Deku/DOM/Attr/%s.purs' % upperAttr
        if (not os.path.exists(path)):
            print('writing', upperAttr)
            with open(path,'w') as ofi:
                ofi.write(f'''module Deku.DOM.Attr.{upperAttr} where

import Deku.Attribute (class Attr, prop', unsafeAttribute)

data {upperAttr} = {upperAttr}
''')
        with open(path,'r') as ifi:
            f = ifi.read().split('\n')
            f = f[:2] + [f'import Deku.DOM.Elt.{upperKey} ({upperKey}_)'] + f[2:]
            f = f + [f'''instance Attr {upperKey}_ {upperAttr} String where
  attr {upperAttr} value = unsafeAttribute {{ key: "{attr}", value: prop' value }}''']
            with open(path,'w') as ofi:
                ofi.write('\n'.join(f))
        # print(upperKey, attr, upperAttr)
        # path = './src/Deku/DOM/Attr/%s.purs' % upper
        # with open(path,'w') as ofi:
        #     ofi.write(e)
