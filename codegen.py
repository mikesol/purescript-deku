import requests
import glob
import os
from bs4 import BeautifulSoup
GENERATE_DOM_DECL = 0
GENERATE_DOM_DEFS = 1
GENERATE_DOM_TL = 2
GENERATE_DOM_TTD = 3
GENERATE_ATTR_DECL = 7
GENERATE_ATTR_DEFS = 8
GENERATE_ATTR_TL = 9
GENERATE_HANDLER_DEFS = 10

CG_MAP = {GENERATE_DOM_DECL: 'src/Deku/DOM.purs',
          GENERATE_DOM_TL: 'src/Deku/DOM.purs',
          GENERATE_DOM_TTD: 'src/Deku/DOM.purs',
          GENERATE_ATTR_DECL: 'src/Deku/DOM.purs',
          GENERATE_ATTR_TL: 'src/Deku/DOM.purs',
          }

url = ('https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes')

r = requests.get(url)
page = r.text

soup = BeautifulSoup(page, features="html.parser")
table = soup.find('table')

# variable to check length of rows
x = (len(table.findAll('tr')) - 1)
# set to run through x


def normalize(x):
    y = x[1:] if x[0] == '<' else x
    z = y[:-1] if y[-1] == '>' else y
    return z


GLOBAL_ATTRIBUTE = 'Global attribute'
GLOBAL_EVENT_HANDLERS = ['abort', 'animationcancel ', 'animationend ', 'animationiteration ', 'animationstart ', 'auxclick ', 'blur', 'error', 'focus', 'cancel', 'canplay', 'canplaythrough', 'change', 'click', 'close', 'contextmenu', 'dblclick', 'drag', 'dragend', 'dragenter', 'dragleave', 'dragover', 'dragstart', 'drop', 'durationchange', 'emptied', 'ended', 'formdata', 'gotpointercapture', 'input', 'invalid', 'keydown', 'keypress', 'keyup', 'load', 'loadeddata', 'loadedmetadata', 'loadend', 'loadstart', 'lostpointercapture', 'mousedown', 'mouseenter', 'mouseleave', 'mousemove', 'mouseout', 'mouseover',
                         'mouseup', 'mousewheel  ', 'wheel', 'pause', 'play', 'playing', 'pointerdown', 'pointermove', 'pointerup', 'pointercancel', 'pointerover', 'pointerout', 'pointerenter', 'pointerleave', 'pointerlockchange ', 'pointerlockerror ', 'progress', 'ratechange', 'reset', 'resize', 'scroll', 'securitypolicyviolation', 'seeked', 'seeking', 'select', 'selectstart', 'selectionchange', 'show ', 'slotchange', 'stalled', 'submit', 'suspend', 'timeupdate', 'volumechange', 'touchcancel  ', 'touchend  ', 'touchmove  ', 'touchstart  ', 'transitioncancel', 'transitionend', 'transitionrun', 'transitionstart', 'waiting']
TAGS = ['<a>', '<abbr>', '<acronym>', '<address>', '<applet>', '<area>', '<article>', '<aside>', '<audio>', '<b>', '<base>', '<basefont>', '<bdi>', '<bdo>', '<big>',  '<blockquote>', '<body>', '<br>', '<button>', '<canvas>', '<caption>', '<center>', '<cite>', '<code>', '<col>', '<colgroup>', '<data>', '<datalist>', '<dd>', '<del>', '<details>', '<dfn>', '<dialog>', '<dir>',  '<div>', '<dl>', '<dt>', '<em>', '<embed>', '<fieldset>', '<figcaption>', '<figure>', '<font>', '<footer>', '<form>', '<frame>', '<frameset>', '<h1>', '<h2>', '<h3>', '<h4>', '<h5>', '<h6>', '<head>', '<header>', '<hr>', '<html>', '<i>', '<iframe>', '<img>', '<input>', '<ins>', '<kbd>', '<label>', '<legend>', '<li>', '<link>', '<main>',
        '<map>', '<mark>', '<meta>', '<meter>', '<nav>', '<noframes>', '<noscript>', '<object>', '<ol>', '<optgroup>', '<option>', '<output>', '<p>', '<param>', '<picture>', '<pre>', '<progress>', '<q>', '<rp>', '<rt>', '<ruby>', '<s>', '<samp>', '<script>', '<section>', '<select>', '<small>', '<source>', '<span>', '<strike>', '<strong>', '<style>', '<sub>', '<summary>', '<sup>', '<svg>', '<table>', '<tbody>', '<td>', '<template>', '<textarea>', '<tfoot>', '<th>', '<thead>', '<time>', '<title>', '<tr>', '<track>', '<tt>', '<u>', '<ul>', '<var>', '<video>', '<wbr>']
TAGS = [normalize(x) for x in TAGS]
TAGS[TAGS.index('data')] = 'xdata'
AMAP = {}
for row in table.findAll('tr')[1:x]:
    col = row.findAll('td')
    attr = col[0].getText().replace('*', '')
    name = col[1].getText()
    AMAP[attr.strip().split('\n')[0]] = [thing for thing in [normalize(x.strip())
                                              for x in name.split(',')] if thing in TAGS]

# don't need it...
del AMAP['data-']
AMAP['xtype'] = AMAP['type']
del AMAP['type']

def asattr(x):
    return 'type' if x == 'xtype' else x


def astag(x):
    return 'data' if x == 'xdata' else x


def bigat(x):
    y = [z.capitalize() for z in x.split('-')]
    return ''.join(y)


def bigtag(x):
    y = [z.capitalize() for z in x.split('-')]
    return ''.join(y)+'_'


def cg(CODEGEN_TARGET, ival = None, ival2 = None):
    o = []
    def print_(x): return o.append(x)
    def noop_(x): return None
    if CODEGEN_TARGET == GENERATE_DOM_DECL:
        for x in TAGS:
            term = bigtag(x)
            typ = 'T'+term
            noop_(f'''  , {term}
  , {x}
  , {x}_''')
            print_(f''', module Deku.DOM.Elt.{term.split('_')[0]}''')

    elif CODEGEN_TARGET == GENERATE_DOM_TL:
        for x in TAGS:
            term = bigtag(x)
            typ = 'T'+term
            noop_(f'''  , {term}
  , {x}
  , {x}_''')
            print_(f'''import Deku.DOM.Elt.{term.split('_')[0]}({term}, {x}, {x}_)''')

    elif CODEGEN_TARGET == GENERATE_DOM_TTD:
        for x in TAGS:
            term = bigtag(x)
            typ = 'T'+term
            print_(f'''instance tagToDeku{term} :: TagToDeku "{astag(x)}" {term}''')
    elif CODEGEN_TARGET == GENERATE_DOM_DEFS:
            x = ival
            term = bigtag(x)
            typ = 'T'+term
            print_(f'''module Deku.DOM.Elt.{term.split('_')[0]} where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data {term}

{x}
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute {term})
  -> Array (Domable m lock payload)
  -> Domable m lock payload
{x} attributes kids = Element' (elementify "{astag(x)}" attributes (FixedChildren' (FixedChildren kids)))

{x}_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
{x}_ = {x} empty

''')
    elif CODEGEN_TARGET == GENERATE_ATTR_DECL:
        for x in AMAP.keys():
            term = bigat(x)
            noop_(f'''  , {term}(..)''')
            print_(f''', module Deku.DOM.Attr.{term}''')

        for x in GLOBAL_EVENT_HANDLERS:
            term = 'On'+x.capitalize()
            noop_(f'''  , {term}(..)''')
            print_(f''', module Deku.DOM.Attr.{term}''')
    elif CODEGEN_TARGET == GENERATE_ATTR_TL:
        for x in AMAP.keys():
            term = bigat(x)
            noop_(f'''  , {term}(..)''')
            print_(f'''import Deku.DOM.Attr.{term}({term}(..))''')

        for x in GLOBAL_EVENT_HANDLERS:
            term = 'On'+x.capitalize()
            noop_(f'''  , {term}(..)''')
            print_(f'''import Deku.DOM.Attr.{term}({term}(..))''')
    elif CODEGEN_TARGET == GENERATE_ATTR_DEFS:
            x = ival
            k = ival
            v = ival2
            if v == []:
                v = TAGS
            term = bigat(x)
            print_(f'''module Deku.DOM.Attr.{term} where''')
            for att in v:
                term2 = bigtag(att)
                print_(f'''import Deku.DOM.Elt.{term2.split('_')[0]}({term2})''')
            print_(f'''import Deku.Attribute (class Attr, prop', unsafeAttribute)
data {term} = {term}''')
            term = bigat(k)
            if v == []:
                v = TAGS
            for att in v:
                term2 = bigtag(att)
                print_(f'''instance Attr {term2} {term} String where
  attr {term} value = unsafeAttribute {{ key: "{asattr(k)}", value: prop' value }}
''')
    elif CODEGEN_TARGET == GENERATE_HANDLER_DEFS:
            x = ival
            term = 'On'+x.capitalize()
            print_(f'''module Deku.DOM.Attr.{term} where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data {term} = {term}''')
            term = 'On'+x.capitalize()
            print_(f'''instance Attr anything {term} Cb where
  attr {term} value = unsafeAttribute {{ key: "{x}", value: cb' value }}''')
            print_(f'''instance Attr anything {term} (Effect Unit) where
  attr {term} value = unsafeAttribute {{ key: "{x}", value: cb' (Cb (const (value $> true))) }}''')
            print_(f'''instance Attr anything {term} (Effect Boolean) where
  attr {term} value = unsafeAttribute {{ key: "{x}", value: cb' (Cb (const value)) }}''')
    else:
      raise ValueError('wat' + str(CODEGEN_TARGET) )
    return '\n'.join(o)


if __name__ == '__main__':
    import glob

    files = glob.glob('src/Deku/DOM/Elt/*.purs')
    for f in files:
      os.remove(f)
    files = glob.glob('src/Deku/DOM/Attr/*.purs')
    for f in files:
      os.remove(f)
    for x in TAGS:
      o = cg(1, x)
      with open('src/Deku/DOM/Elt/%s.purs' % bigtag(x).split('_')[0], 'w') as wf:
        wf.write(o)
    for k,v in AMAP.items():
      o = cg(8, k,v)
      with open('src/Deku/DOM/Attr/%s.purs' % bigat(k), 'w') as wf:
        wf.write(o)
    for x in GLOBAL_EVENT_HANDLERS:
      o = cg(10, x)
      with open('src/Deku/DOM/Attr/On%s.purs' % bigat(x), 'w') as wf:
        wf.write(o)
    for z in [0,2,3,7,9]:
      o = cg(z)
      with open(CG_MAP[z], 'r') as rf:
        i = rf.read().split('\n')
        ii = []
        skip = False
        tgt = '-- codegen '+str(z)
        for x in i:
          #print(x)
          if x.strip() == tgt:
            skip = not skip
          if not skip or x.strip() == tgt:
            ii.append(x)
            if x.strip() == tgt and skip:
              ii.append(42)
        if 42 not in ii:
          raise ValueError('could not find target for %d %s' % (z, CG_MAP[z]),)
        else:
          ii[ii.index(42)] = o
          with open(CG_MAP[z], 'w') as wf:
            wf.write('\n'.join(ii))
