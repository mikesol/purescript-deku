from svg2 import A
import os

d = os.listdir('./src/Deku/DOM/Elt/')
for x in d:
    #print('  , module Deku.DOM.Elt.%s' % x[:-5])
    bg = x[:-5]
    sm = bg[0].lower()+bg[1:]
    #print('import Deku.DOM.Elt.%s (%s_,%s,%s_)' % (bg,bg,sm,sm))
    print(f'instance tagToDeku{bg}_ :: TagToDeku "{sm}" {bg}_')
d = os.listdir('./src/Deku/DOM/Attr/')
for x in d:
    #print('  , module Deku.DOM.Attr.%s' % x[:-5])
    bg = x[:-5]
    # print('import Deku.DOM.Attr.%s (%s(..))' % (bg,bg))
