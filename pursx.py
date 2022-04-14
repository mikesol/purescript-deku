import string
o = []
def print_(x): o.append(x)
WHITESPACE = [" ","\\t","\\n"]

print_('''module Deku.Pursx where

import Prelude
-- import Deku.Debug (type (^^))
-- import Prim.TypeError (class Warn, Text)
import Foreign.Object as Object
import Control.Alt ((<|>))
import Data.Profunctor (lcmap)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Deku.Attribute (Attribute, unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Element(..))
import Deku.DOM (class TagToDeku)
import Control.Plus (class Plus, empty)
import FRP.Behavior (sample_)
import FRP.Event.Class (class IsEvent, keepLatest, bang)
import Prim.Boolean (False, True)
import Prim.Row as Row
import Prim.RowList as RL
import Prim.Symbol as Sym
import Record (get)
import Type.Proxy (Proxy(..))

newtype PursxElement event payload = PursxElement (Element event payload)
nut :: forall event payload. Element event payload -> PursxElement event payload
nut = PursxElement
''')

print_('pursx :: forall s. Proxy s')
print_('pursx = Proxy')
print_('class DoVerbForAttr (event :: Type -> Type) (verb :: Symbol) (tag :: Symbol) (acc :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (newTail :: Symbol) | event verb acc head tail pursi -> purso newTail')
print_('instance (TagToDeku tag deku, IsEvent event, Row.Cons acc (event (Attribute deku)) pursi purso) => DoVerbForAttr event verb tag acc verb tail pursi purso tail')
print_('else instance (Sym.Append acc anything acc2, Sym.Cons x y tail, DoVerbForAttr event verb tag acc2 x y pursi purso newTail) => DoVerbForAttr event verb tag acc anything tail pursi purso newTail')
print_('--')
print_('class DoVerbForDOM (event :: Type -> Type) (payload :: Type) (verb :: Symbol) (acc :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (newTail :: Symbol) | event payload verb acc head tail pursi -> purso newTail')
print_('instance (Row.Cons acc (PursxElement event payload) pursi purso) => DoVerbForDOM event payload verb acc verb tail pursi purso tail')
print_('else instance (Sym.Append acc anything acc2, Sym.Cons x y tail, DoVerbForDOM event payload verb acc2 x y pursi purso newTail) => DoVerbForDOM event payload verb acc anything tail pursi purso newTail')
print_('--')
print_('class IsWhiteSpace (space :: Symbol)')
print_('instance IsWhiteSpace ""')
print_('else instance (Sym.Cons x y s, IsSingleWhiteSpace x, IsWhiteSpace y) => IsWhiteSpace s')
print_('class IsSingleWhiteSpace (s :: Symbol)')
for x in WHITESPACE:
    print_('instance IsSingleWhiteSpace "%s"' % (x,))

print_('class PXStart (event :: Type -> Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (purs :: Row Type) | event payload verb head tail -> purs')
for x in WHITESPACE:
    print_('instance (Sym.Cons x y tail, PXStart event payload verb x y purs) => PXStart event payload verb "%s" tail purs' % (x,))
print_("""instance
  ( Sym.Cons x y tail
  , PXTagPreName event payload verb x y () purso trailing
  , IsWhiteSpace trailing
  ) => PXStart event payload verb "<" tail purso
""")
print_("--")
print_('class PXTagPreName (event :: Type -> Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event payload verb head tail pursi -> purso trailing')
for x in WHITESPACE:
    print_('instance (Sym.Cons x y tail, PXTagPreName event payload verb x y pursi purso trailing) => PXTagPreName event payload verb "%s" tail pursi purso trailing' % (x,))
for x in string.ascii_lowercase:
  print_('instance (PXTagName event payload verb "" "%s" tail pursi purso trailing) => PXTagPreName event payload verb "%s" tail pursi purso trailing' % (x,x))
print_('--')
print_('class PXTagName (event :: Type -> Type) (payload :: Type) (verb :: Symbol) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event payload verb tag head tail pursi -> purso trailing')
print_('instance (Sym.Cons q r tail, PXBody event payload verb q r pursi purso trailing, Sym.Cons x y trailing, PreEndTagFromTrailing x y tag newTrailing) => PXTagName event payload verb tag ">" tail pursi purso newTrailing')
for x in string.ascii_lowercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, Sym.Append tag_ "%s" tag, PXTagName event payload verb tag x y pursi purso trailing) => PXTagName event payload verb tag_ "%s" tail pursi purso trailing' % (x,x))
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPreAttrName event payload verb False tag x y pursi purso trailing) => PXTagName event payload verb tag "%s" tail pursi purso trailing' % x)
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
print_('class PXTagPreAttrName (event :: Type -> Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event payload verb hasAttributed tag head tail pursi -> purso trailing')
print_('instance (Sym.Cons ">" trailing tail) => PXTagPreAttrName event payload verb hasAttributed tag "/" tail purs purs trailing')
print_('-- trailing will be by definition whatever comes after the closing tag, ie </ foo> will be " foo>"')
print_('else instance (Sym.Cons q r tail, PXBody event payload verb q r pursi purso trailing, Sym.Cons x y trailing, PreEndTagFromTrailing x y tag newTrailing) => PXTagPreAttrName event payload verb hasAttributed tag ">" tail pursi purso newTrailing')
print_('--')
for x in WHITESPACE:
  print_('else instance (Sym.Cons x y tail, PXTagPreAttrName event payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrName event payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
for x in string.ascii_letters:
  print_('else instance (PXTagAttrName event payload verb hasAttributed tag "%s" tail pursi purso trailing) => PXTagPreAttrName event payload verb hasAttributed tag "%s" tail pursi purso trailing' % (x,x))
print_('else instance (Sym.Cons x y tail, DoVerbForAttr event verb tag "" x y pursi pursx newTail, Sym.Cons xx yy newTail, PXTagPreAttrName event payload verb True tag xx yy pursx purso trailing) => PXTagPreAttrName event payload verb False tag verb tail pursi purso trailing')
print_('--')
print_('class PXTagAttrName (event :: Type -> Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in string.ascii_lowercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, PXTagAttrName event payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName event payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrValue event payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName event payload verb hasAttributed tag "=" tail pursi purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPostAttrName event payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName event payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('--')
print_('class PXTagPostAttrName (event :: Type -> Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPostAttrName event payload verb hasAttributed tag x y pursi purso trailing) => PXTagPostAttrName event payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrValue event payload verb hasAttributed tag x y pursi purso trailing) => PXTagPostAttrName event payload verb hasAttributed tag "=" tail pursi purso trailing')
print_('--')
print_('class PXTagPreAttrValue (event :: Type -> Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPreAttrValue event payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrValue event payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagAttrValue event payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrValue event payload verb hasAttributed tag "\\"" tail pursi purso trailing')
print_('--')
print_('class PXTagAttrValue (event :: Type -> Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in [y for y in (string.ascii_lowercase+string.ascii_uppercase+string.digits+':,;\'!@#$%^&*()_-=`~<>/.')]+['\\\\']+WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagAttrValue event payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrValue event payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrName event payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrValue event payload verb hasAttributed tag "\\"" tail pursi purso trailing')
print_('class PXBody (event :: Type -> Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event payload verb tail pursi -> purso trailing')
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
class CloseOrRepeat (event :: Type -> Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event payload verb head tail pursi -> purso trailing
instance CloseOrRepeat event payload verb "/" tail purs purs tail
else instance
  ( Sym.Cons "-" y tail
  , Sym.Cons "-" yy y
  , Sym.Cons x yyy yy
  , SkipUntilCommentEnd x yyy trailing
  , Sym.Cons mm bb trailing
  , PXBody event payload verb mm bb pursi purso newTrailing
  ) =>
  CloseOrRepeat event payload verb "!" tail pursi purso newTrailing
else instance (PXTagPreName event payload verb anything tail () pursm trailing, Row.Union pursi pursm pursz, Sym.Cons x y trailing, PXBody event payload verb x y pursz purso newTrailing) => CloseOrRepeat event payload verb anything tail pursi purso newTrailing
instance (Sym.Cons x y tail, CloseOrRepeat event payload verb x y pursi purso trailing) => PXBody event payload verb "<" tail pursi purso trailing
else instance (Sym.Cons x y tail, DoVerbForDOM event payload verb "" x y pursi pursx newTail, Sym.Cons xx yy newTail, PXBody event payload verb xx yy pursx purso trailing) => PXBody event payload verb verb tail pursi purso trailing
else instance (Sym.Cons x y tail, PXBody event payload verb x y pursi purso trailing) => PXBody event payload verb anything tail pursi purso trailing''')
print_('''
class
  Plus event <=
  PursxToElement event payload (rl :: RL.RowList Type) (r :: Row Type)
  | rl -> event payload r where
  pursxToElement
    :: forall proxy
     . String
    -> proxy rl
    -> { | r }
    -> { cache :: Object.Object Boolean, element :: Element event payload }

instance pursxToElementConsElt ::
  ( Row.Cons key (PursxElement event payload) r' r
  , PursxToElement event payload rest r
  , IsSymbol key
  ) =>
  PursxToElement event payload (RL.Cons key (PursxElement event payload) rest) r where
  pursxToElement pxScope _ r =
    let
      { cache, element } = pursxToElement pxScope (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectSymbol pxk) false cache
      , element: Element \parent di ->
          (let Element y = pxe in y) ((reflectSymbol pxk) <> pxScope) di
            <|> (let Element y = element in y) parent di
      }
    where
    pxk = Proxy :: _ key
    PursxElement pxe = get pxk r

else instance pursxToElementConsAttr ::
  ( Row.Cons key (event (Attribute deku)) r' r
  , PursxToElement event payload rest r
  , IsSymbol key
  ) =>
  PursxToElement event payload (RL.Cons key (event (Attribute deku)) rest) r where
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
  Plus event =>
  PursxToElement event payload RL.Nil r where
  pursxToElement _ _ _ = { cache: Object.empty, element: Element \_ _ -> empty }

psx
  :: forall event payload proxy (html :: Symbol)
   . IsSymbol html
  => PXStart event payload "~" " " html ()
  => PursxToElement event payload RL.Nil ()
  => IsEvent event
  => proxy html
  -> Element event payload
psx px = makePursx px {}

makePursx
  :: forall event payload proxy (html :: Symbol) r rl
   . IsSymbol html
  => PXStart event payload "~" " " html r
  => RL.RowToList r rl
  => PursxToElement event payload rl r
  => IsEvent event
  => proxy html
  -> { | r }
  -> Element event payload
makePursx = makePursx' (Proxy :: _ "~")

makePursx'
  :: forall event payload verb proxyA proxyB (html :: Symbol) r rl
   . IsSymbol html
  => IsSymbol verb
  => PXStart event payload verb " " html r
  => RL.RowToList r rl
  => PursxToElement event payload rl r
  => IsEvent event
  => proxyA verb
  -> proxyB html
  -> { | r }
  -> Element event payload
makePursx' verb html r = Element go
  where
  go parent di@(DOMInterpret { makePursx: mpx, ids }) = keepLatest
    ( (sample_ ids (bang unit)) <#> \me -> keepLatest
        ( (sample_ ids (bang unit)) <#> \pxScope ->
            let
              { cache, element } = pursxToElement pxScope (Proxy :: _ rl) r
            in
              ( bang $ mpx
                  { id: me
                  , parent
                  , cache
                  , scope: pxScope
                  , html: reflectSymbol html
                  , verb: reflectSymbol verb
                  }
              ) <|> (let Element y = element in y) me di
        )
    )
infixr 5 makePursx as ~~

''')
with open('src/Deku/Pursx.purs', 'w') as f:
  for x in o: f.write(x+'\n')
import subprocess
subprocess.call('npx purs-tidy format-in-place src/Deku/Pursx.purs', shell=True)