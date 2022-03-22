import requests
from bs4 import BeautifulSoup
GENERATE_DOM_DECL = 0
GENERATE_DOM_DEFS = 1
GENERATE_CREATES = 2
GENERATE_CREATETS = 3
GENERATE_CHANGES = 4
GENERATE_PATCHES = 5
GENERATE_VALIDATION = 6
GENERATE_ATTR_DECL = 7
GENERATE_ATTR_DEFS = 8
GENERATE_SHORTHAND = 9

CG_MAP = {GENERATE_DOM_DECL: 'src/Deku/Graph/DOM.purs',
          GENERATE_DOM_DEFS: 'src/Deku/Graph/DOM.purs',
          GENERATE_CREATES: 'src/Deku/Create.purs',
          GENERATE_CREATETS: 'src/Deku/CreateT.purs',
          GENERATE_CHANGES: 'src/Deku/Change.purs',
          GENERATE_PATCHES: 'src/Deku/Patch.purs',
          GENERATE_VALIDATION: 'src/Deku/Validation.purs',
          GENERATE_ATTR_DECL: 'src/Deku/Graph/DOM.purs',
          GENERATE_ATTR_DEFS: 'src/Deku/Graph/DOM.purs',
          GENERATE_SHORTHAND: 'src/Deku/Graph/DOM/Shorthand.purs'
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
    AMAP[attr.strip()] = [thing for thing in [normalize(x.strip())
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


def cg(CODEGEN_TARGET):
    o = []
    def print_(x): return o.append(x)
    if CODEGEN_TARGET == GENERATE_DOM_DECL:
        for x in TAGS:
            term = bigtag(x)
            typ = 'T'+term
            print_(f'''  , {term}
  , {typ}
  , {x}
  , {x}'attr
  , unsafeUn{term}''')
    elif CODEGEN_TARGET == GENERATE_SHORTHAND:
      for x in TAGS:
        term = bigtag(x)
        print_(f'''{x}
  :: forall children
   . Array (Attribute D.{term})
  -> {{ | children }}
  -> {{ {x} :: D.Element D.{term} children }}
{x} attrs children = {{ {x}: _ }} $ D.{x} attrs children''')
    elif CODEGEN_TARGET == GENERATE_DOM_DEFS:
        for x in TAGS:
            term = bigtag(x)
            typ = 'T'+term
            print_(f'''type {term}' =
  ( tag :: String
  , attributes :: Array (Attribute {term})
  )
newtype {term} = {term} {{ | {term}' }}
unsafeUn{term} :: {term} -> {{ | {term}' }}
unsafeUn{term} ({term} unsafe) = unsafe

instance typeToSym{term} ::
  TypeToSym {term} "{astag(x)}"

{x}
  :: forall children
   . Array (Attribute {term})
  -> {{ | children }}
  -> Element {term} children
{x} = makeElt {term} "{astag(x)}"

{x}'attr
  :: Array (Attribute {term})
  -> Array (Attribute {term})
{x}'attr = identity

data {typ} = {typ}

instance typeToSym{typ} :: TypeToSym {typ} "{typ}"

instance semigroup{typ} :: Semigroup {typ} where
  append _ _ = {typ}

instance monoid{typ} :: Monoid {typ} where
  mempty = {typ}

instance reify{typ} :: ReifyAU {term} {typ} where
  reifyAU = const mempty''')
    elif CODEGEN_TARGET == GENERATE_CREATES:
        for x in TAGS:
            term = bigtag(x)
            typ = 'T'+term
            print_(f'''instance create{term} ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.{typ} {{}}) graphi grapho
  ) =>
  Create' ptr CTOR.{term} graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "{astag(x)}"
    where
    {{ context: i, value }} = unsafeUnDOM w
    {{ attributes }} = CTOR.unsafeUn{term} value''')
    elif CODEGEN_TARGET == GENERATE_CREATETS:
        for x in TAGS:
            term = bigtag(x)
            typ = 'T'+term
            print_(f'''instance create{typ} ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.{typ} {{}}) graphi grapho
  ) =>
  CreateT' ptr CTOR.{term} graphi grapho''')
    elif CODEGEN_TARGET == GENERATE_CHANGES:
        for x in TAGS:
            term = bigtag(x)
            typ = 'T'+term
            print_(f'''instance change{term} ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.{typ} ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.{term})) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    {{ context: i, value }} = unsafeUnDOM w''')
    elif CODEGEN_TARGET == GENERATE_PATCHES:
        for x in TAGS:
            term = bigtag(x)
            typ = 'T'+term
            print_(f'''data Make{term} (ptr :: Symbol) = Make{term} (Proxy ptr)
instance doCreateMake{term} :: DoCreate ptr CTOR.{typ} (Make{term} ptr)
instance toGraphEffectsMake{term} ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (Make{term} ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "{astag(x)}"''')
    elif CODEGEN_TARGET == GENERATE_VALIDATION:
        for x in TAGS:
            term = bigtag(x)
            typ = 'T'+term
            print_(f'''instance allNodesAreSaturatedCons_{typ} ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.{typ}) {{ | r }}) tail)
''')
    elif CODEGEN_TARGET == GENERATE_ATTR_DECL:
        for x in AMAP.keys():
            term = bigat(x)
            print_(f'''  , {term}(..)''')
        for x in GLOBAL_EVENT_HANDLERS:
            term = 'On'+x.capitalize()
            print_(f'''  , {term}(..)''')
    elif CODEGEN_TARGET == GENERATE_ATTR_DEFS:
        for x in AMAP.keys():
            term = bigat(x)
            print_(f'''data {term} = {term}''')
        for x in GLOBAL_EVENT_HANDLERS:
            term = 'On'+x.capitalize()
            print_(f'''data {term} = {term}''')
        for k, v in AMAP.items():
            term = bigat(k)
            if v == []:
                v = TAGS
            for att in v:
                term2 = bigtag(att)
                print_(f'''instance Attr {term2} {term} String where
  attr {term} value = unsafeAttribute {{ key: "{asattr(k)}", value: prop' value }}
''')
        for x in GLOBAL_EVENT_HANDLERS:
            term = 'On'+x.capitalize()
            print_(f'''instance Attr anything {term} Cb where
  attr {term} value = unsafeAttribute {{ key: "{x}", value: cb' value }}''')
    else:
      raise ValueError('wat')
    return '\n'.join(o)


if __name__ == '__main__':
    for z in range(10):
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
