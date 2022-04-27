import string
o = []
def print_(x): o.append(x)
WHITESPACE = [" ","\\t","\\n"]

print_('''module Deku.Pursx where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Profunctor (lcmap)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Deku.Attribute (Attribute, unsafeUnAttribute)
import Deku.Control (class Plant, plant)
import Deku.Core (DOMInterpret(..), Element(..), Child)
import Deku.DOM (class TagToDeku)
import Deku.Internal (__internalDekuFlatten)
import FRP.Event (Event, bang, subscribe, makeEvent)
import Foreign.Object as Object
import Prim.Boolean (False, True)
import Prim.Row as Row
import Prim.RowList as RL
import Prim.Symbol as Sym
import Record (get)
import Type.Proxy (Proxy(..))

newtype PursxElement lock payload = PursxElement
  (Event (Event (Child lock payload)))

nut
  :: forall seed lock payload
   . Plant seed (Event (Event (Child lock payload)))
  => seed
  -> PursxElement lock payload
nut seed = PursxElement (plant seed)
''')

print_('pursx :: forall s. Proxy s')
print_('pursx = Proxy')
print_('class DoVerbForAttr  (verb :: Symbol) (tag :: Symbol) (acc :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (newTail :: Symbol) | verb acc head tail pursi -> purso newTail')
print_('instance (TagToDeku tag deku,  Row.Cons acc (Event (Attribute deku)) pursi purso) => DoVerbForAttr verb tag acc verb tail pursi purso tail')
print_('else instance (Sym.Append acc anything acc2, Sym.Cons x y tail, DoVerbForAttr verb tag acc2 x y pursi purso newTail) => DoVerbForAttr verb tag acc anything tail pursi purso newTail')
print_('--')
print_('class DoVerbForDOM  (lock :: Type) (payload :: Type) (verb :: Symbol) (acc :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (newTail :: Symbol) | lock payload verb acc head tail pursi -> purso newTail')
print_('instance (Row.Cons acc (PursxElement lock payload) pursi purso) => DoVerbForDOM lock payload verb acc verb tail pursi purso tail')
print_('else instance (Sym.Append acc anything acc2, Sym.Cons x y tail, DoVerbForDOM lock payload verb acc2 x y pursi purso newTail) => DoVerbForDOM lock payload verb acc anything tail pursi purso newTail')
print_('--')
print_('class IsWhiteSpace (space :: Symbol)')
print_('instance IsWhiteSpace ""')
print_('else instance (Sym.Cons x y s, IsSingleWhiteSpace x, IsWhiteSpace y) => IsWhiteSpace s')
print_('class IsSingleWhiteSpace (s :: Symbol)')
for x in WHITESPACE:
    print_('instance IsSingleWhiteSpace "%s"' % (x,))

print_('class PXStart  (lock :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (purs :: Row Type) | lock payload verb head tail -> purs')
for x in WHITESPACE:
    print_('instance (Sym.Cons x y tail, PXStart lock payload verb x y purs) => PXStart lock payload verb "%s" tail purs' % (x,))
print_("""instance
  ( Sym.Cons x y tail
  , PXTagPreName lock payload verb x y () purso trailing
  , IsWhiteSpace trailing
  ) => PXStart lock payload verb "<" tail purso
""")
print_("--")
print_('class PXTagPreName  (lock :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb head tail pursi -> purso trailing')
for x in WHITESPACE:
    print_('instance (Sym.Cons x y tail, PXTagPreName lock payload verb x y pursi purso trailing) => PXTagPreName lock payload verb "%s" tail pursi purso trailing' % (x,))
for x in string.ascii_lowercase:
  print_('instance (PXTagName lock payload verb "" "%s" tail pursi purso trailing) => PXTagPreName lock payload verb "%s" tail pursi purso trailing' % (x,x))
print_('--')
print_('class PXTagName  (lock :: Type) (payload :: Type) (verb :: Symbol) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb tag head tail pursi -> purso trailing')
print_('instance (Sym.Cons q r tail, PXBody lock payload verb q r pursi purso trailing, Sym.Cons x y trailing, PreEndTagFromTrailing x y tag newTrailing) => PXTagName lock payload verb tag ">" tail pursi purso newTrailing')
for x in string.ascii_lowercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, Sym.Append tag_ "%s" tag, PXTagName lock payload verb tag x y pursi purso trailing) => PXTagName lock payload verb tag_ "%s" tail pursi purso trailing' % (x,x))
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPreAttrName lock payload verb False tag x y pursi purso trailing) => PXTagName lock payload verb tag "%s" tail pursi purso trailing' % x)
print_('--')
print_('class PreEndTagFromTrailing (head :: Symbol) (tail :: Symbol) (tag :: Symbol) (newTrailing :: Symbol) | head tail -> tag newTrailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PreEndTagFromTrailing x y tag trailing) => PreEndTagFromTrailing "%s" tail tag trailing' % x)
for x in string.ascii_lowercase+'-':
  print_('instance (EndTagFromTrailing "%s" tail "" tag trailing) => PreEndTagFromTrailing "%s" tail tag trailing' % (x,x))
print_('--')
print_('class EndTagFromTrailing (head :: Symbol) (tail :: Symbol) (tagAcc :: Symbol) (tag :: Symbol) (newTrailing :: Symbol) | head tail tagAcc -> tag newTrailing')
for x in string.ascii_lowercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, Sym.Append tag_ "%s" tag, EndTagFromTrailing x y tag otag trailing) => EndTagFromTrailing "%s" tail tag_ otag trailing' % (x,x))
print_('instance EndTagFromTrailing ">" tail tag tag tail')
print_('--')
print_('class PXTagPreAttrName  (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb hasAttributed tag head tail pursi -> purso trailing')
print_('instance (Sym.Cons ">" trailing tail) => PXTagPreAttrName lock payload verb hasAttributed tag "/" tail purs purs trailing')
print_('-- trailing will be by definition whatever comes after the closing tag, ie </ foo> will be " foo>"')
print_('else instance (Sym.Cons q r tail, PXBody lock payload verb q r pursi purso trailing, Sym.Cons x y trailing, PreEndTagFromTrailing x y tag newTrailing) => PXTagPreAttrName lock payload verb hasAttributed tag ">" tail pursi purso newTrailing')
print_('--')
for x in WHITESPACE:
  print_('else instance (Sym.Cons x y tail, PXTagPreAttrName lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrName lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
for x in string.ascii_letters:
  print_('else instance (PXTagAttrName lock payload verb hasAttributed tag "%s" tail pursi purso trailing) => PXTagPreAttrName lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % (x,x))
print_('else instance (Sym.Cons x y tail, DoVerbForAttr verb tag "" x y pursi pursx newTail, Sym.Cons xx yy newTail, PXTagPreAttrName lock payload verb True tag xx yy pursx purso trailing) => PXTagPreAttrName lock payload verb False tag verb tail pursi purso trailing')
print_('--')
print_('class PXTagAttrName  (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in string.ascii_lowercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, PXTagAttrName lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrValue lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName lock payload verb hasAttributed tag "=" tail pursi purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPostAttrName lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('--')
print_('class PXTagPostAttrName  (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPostAttrName lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPostAttrName lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrValue lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPostAttrName lock payload verb hasAttributed tag "=" tail pursi purso trailing')
print_('--')
print_('class PXTagPreAttrValue  (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPreAttrValue lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrValue lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagAttrValue lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrValue lock payload verb hasAttributed tag "\\"" tail pursi purso trailing')
print_('--')
print_('class PXTagAttrValue  (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in [y for y in (string.ascii_lowercase+string.ascii_uppercase+string.digits+':,;\'!@#$%^&*()_-=`~<>/.')]+['\\\\']+WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagAttrValue lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrValue lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrName lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrValue lock payload verb hasAttributed tag "\\"" tail pursi purso trailing')
print_('class PXBody  (lock :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb tail pursi -> purso trailing')
print_('''
class CommendEndCandidate2 (head :: Symbol) (tail :: Symbol) (trailing :: Symbol) | head tail -> trailing
instance CommendEndCandidate2 ">" tail tail
else instance (Sym.Cons x y tail, SkipUntilCommentEnd x y trailing) => CommendEndCandidate2 anything tail trailing
class CommendEndCandidate1 (head :: Symbol) (tail :: Symbol) (trailing :: Symbol) | head tail -> trailing
instance (Sym.Cons x y tail, CommendEndCandidate2 x y trailing) => CommendEndCandidate1 "-" tail trailing
else instance (Sym.Cons x y tail, SkipUntilCommentEnd x y trailing) => CommendEndCandidate1 anything tail trailing
class SkipUntilCommentEnd (head :: Symbol) (tail :: Symbol) (trailing :: Symbol) | head tail -> trailing
instance (Sym.Cons x y tail, CommendEndCandidate1 x y trailing)  => SkipUntilCommentEnd "-" tail trailing
else instance (Sym.Cons x y tail, SkipUntilCommentEnd x y trailing) => SkipUntilCommentEnd anything tail trailing
class CloseOrRepeat  (lock :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb head tail pursi -> purso trailing
instance CloseOrRepeat lock payload verb "/" tail purs purs tail
else instance
  ( Sym.Cons "-" y tail
  , Sym.Cons "-" yy y
  , Sym.Cons x yyy yy
  , SkipUntilCommentEnd x yyy trailing
  , Sym.Cons mm bb trailing
  , PXBody lock payload verb mm bb pursi purso newTrailing
  ) =>
  CloseOrRepeat lock payload verb "!" tail pursi purso newTrailing
else instance (PXTagPreName lock payload verb anything tail () pursm trailing, Row.Union pursi pursm pursz, Sym.Cons x y trailing, PXBody lock payload verb x y pursz purso newTrailing) => CloseOrRepeat lock payload verb anything tail pursi purso newTrailing
instance (Sym.Cons x y tail, CloseOrRepeat lock payload verb x y pursi purso trailing) => PXBody lock payload verb "<" tail pursi purso trailing
else instance (Sym.Cons x y tail, DoVerbForDOM lock payload verb "" x y pursi pursx newTail, Sym.Cons xx yy newTail, PXBody lock payload verb xx yy pursx purso trailing) => PXBody lock payload verb verb tail pursi purso trailing
else instance (Sym.Cons x y tail, PXBody lock payload verb x y pursi purso trailing) => PXBody lock payload verb anything tail pursi purso trailing''')
print_('''
class
  PursxToElement lock payload (rl :: RL.RowList Type) (r :: Row Type)
  | rl -> lock payload r where
  pursxToElement
    :: forall proxy
     . String
    -> proxy rl
    -> { | r }
    -> { cache :: Object.Object Boolean, element :: Element lock payload }

instance pursxToElementConsInsert ::
  ( Row.Cons key (PursxElement lock payload) r' r
  , PursxToElement lock payload rest r
  , IsSymbol key
  ) =>
  PursxToElement lock payload (RL.Cons key (PursxElement lock payload) rest) r where
  pursxToElement pxScope _ r =
    let
      { cache, element } = pursxToElement pxScope (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectSymbol pxk) false cache
      , element: Element \info di ->
          __internalDekuFlatten (reflectSymbol pxk <> pxScope) di pxe
            <|> (let Element y = element in y) info di
      }
    where
    pxk = Proxy :: _ key
    PursxElement pxe = get pxk r

else instance pursxToElementConsAttr ::
  ( Row.Cons key (Event (Attribute deku)) r' r
  , PursxToElement lock payload rest r
  , IsSymbol key
  ) =>
  PursxToElement lock payload (RL.Cons key (Event (Attribute deku)) rest) r where
  pursxToElement pxScope _ r =
    let
      { cache, element } = pursxToElement pxScope (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectSymbol pxk) true cache
      , element: Element \parent di@(DOMInterpret { setAttribute }) ->
          map
            ( lcmap unsafeUnAttribute
                ( \{ key, value } -> setAttribute
                    { id: ((reflectSymbol pxk) <> pxScope)
                    , key
                    , value
                    }
                )
            )
            (get pxk r)
            <|> (let Element y = element in y) parent di
      }
    where
    pxk = Proxy :: _ key

instance pursxToElementNil ::
  PursxToElement lock payload RL.Nil r where
  pursxToElement _ _ _ = { cache: Object.empty, element: Element \_ _ -> empty }

psx
  :: forall lock payload proxy (html :: Symbol)
   . IsSymbol html
  => PXStart lock payload "~" " " html ()
  => PursxToElement lock payload RL.Nil ()
  => proxy html
  -> Element lock payload
psx px = makePursx px {}

makePursx
  :: forall lock payload proxy (html :: Symbol) r rl
   . IsSymbol html
  => PXStart lock payload "~" " " html r
  => RL.RowToList r rl
  => PursxToElement lock payload rl r
  => proxy html
  -> { | r }
  -> Element lock payload
makePursx = makePursx' (Proxy :: _ "~")

makePursx'
  :: forall lock payload verb proxyA proxyB (html :: Symbol) r rl
   . IsSymbol html
  => IsSymbol verb
  => PXStart lock payload verb " " html r
  => RL.RowToList r rl
  => PursxToElement lock payload rl r
  => proxyA verb
  -> proxyB html
  -> { | r }
  -> Element lock payload
makePursx' verb html r = Element go
  where
  go
    z@{ parent, scope, raiseId }
    di@(DOMInterpret { makePursx: mpx, ids, deleteFromCache }) =
    makeEvent \k1 -> do
      me <- ids
      pxScope <- ids
      raiseId me
      let
        { cache, element: Element element } = pursxToElement
          pxScope
          (Proxy :: _ rl)
          r
      map ((*>) (k1 (deleteFromCache { id: me }))) $
        subscribe
          ( ( bang $
                mpx
                  { id: me
                  , parent
                  , cache
                  , scope: pxScope
                  , dkScope: scope
                  , html: reflectSymbol html
                  , verb: reflectSymbol verb
                  }
            ) <|> element z di
          )
          k1

infixr 5 makePursx as ~~

''')
with open('src/Deku/Pursx.purs', 'w') as f:
  for x in o: f.write(x+'\n')
import subprocess
subprocess.call('npx purs-tidy format-in-place src/Deku/Pursx.purs', shell=True)