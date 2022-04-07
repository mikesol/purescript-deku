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
import FRP.Event (keepLatest, class IsEvent)
import Prim.Boolean (False, True)
import Prim.Row as Row
import Prim.RowList as RL
import Prim.Symbol as Sym
import Record (get)
import Type.Proxy (Proxy(..))

newtype PursxElement event proof payload = PursxElement (Element event proof payload)
nut :: forall event proof payload. Element event proof payload -> PursxElement event proof payload
nut = PursxElement
''')

print_('pursx :: forall s. Proxy s')
print_('pursx = Proxy')
print_('class DoVerbForAttr (event :: Type -> Type -> Type) (proof :: Type) (verb :: Symbol) (tag :: Symbol) (acc :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (newTail :: Symbol) | event proof verb acc head tail pursi -> purso newTail')
print_('instance (TagToDeku tag deku, IsEvent (event proof), Row.Cons acc (event proof (Attribute deku)) pursi purso) => DoVerbForAttr event proof verb tag acc verb tail pursi purso tail')
print_('else instance (Sym.Append acc anything acc2, Sym.Cons x y tail, DoVerbForAttr event proof verb tag acc2 x y pursi purso newTail) => DoVerbForAttr event proof verb tag acc anything tail pursi purso newTail')
print_('--')
print_('class DoVerbForDOM (event :: Type -> Type -> Type) (proof :: Type) (payload :: Type) (verb :: Symbol) (acc :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (newTail :: Symbol) | event proof payload verb acc head tail pursi -> purso newTail')
print_('instance (Row.Cons acc (PursxElement event proof payload) pursi purso) => DoVerbForDOM event proof payload verb acc verb tail pursi purso tail')
print_('else instance (Sym.Append acc anything acc2, Sym.Cons x y tail, DoVerbForDOM event proof payload verb acc2 x y pursi purso newTail) => DoVerbForDOM event proof payload verb acc anything tail pursi purso newTail')
print_('--')
print_('class IsWhiteSpace (space :: Symbol)')
print_('instance IsWhiteSpace ""')
print_('else instance (Sym.Cons x y s, IsSingleWhiteSpace x, IsWhiteSpace y) => IsWhiteSpace s')
print_('class IsSingleWhiteSpace (s :: Symbol)')
for x in WHITESPACE:
    print_('instance IsSingleWhiteSpace "%s"' % (x,))

print_('class PXStart (event :: Type -> Type -> Type) (proof :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (purs :: Row Type) | event proof payload verb head tail -> purs')
for x in WHITESPACE:
    print_('instance (Sym.Cons x y tail, PXStart event proof payload verb x y purs) => PXStart event proof payload verb "%s" tail purs' % (x,))
print_("""instance
  ( Sym.Cons x y tail
  , PXTagPreName event proof payload verb x y () purso trailing
  , IsWhiteSpace trailing
  ) => PXStart event proof payload verb "<" tail purso
""")
print_("--")
print_('class PXTagPreName (event :: Type -> Type -> Type) (proof :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event proof payload verb head tail pursi -> purso trailing')
for x in WHITESPACE:
    print_('instance (Sym.Cons x y tail, PXTagPreName event proof payload verb x y pursi purso trailing) => PXTagPreName event proof payload verb "%s" tail pursi purso trailing' % (x,))
for x in string.ascii_lowercase:
  print_('instance (PXTagName event proof payload verb "" "%s" tail pursi purso trailing) => PXTagPreName event proof payload verb "%s" tail pursi purso trailing' % (x,x))
print_('--')
print_('class PXTagName (event :: Type -> Type -> Type) (proof :: Type) (payload :: Type) (verb :: Symbol) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event proof payload verb tag head tail pursi -> purso trailing')
print_('instance (Sym.Cons q r tail, PXBody event proof payload verb q r pursi purso trailing, Sym.Cons x y trailing, PreEndTagFromTrailing x y tag newTrailing) => PXTagName event proof payload verb tag ">" tail pursi purso newTrailing')
for x in string.ascii_lowercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, Sym.Append tag_ "%s" tag, PXTagName event proof payload verb tag x y pursi purso trailing) => PXTagName event proof payload verb tag_ "%s" tail pursi purso trailing' % (x,x))
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPreAttrName event proof payload verb False tag x y pursi purso trailing) => PXTagName event proof payload verb tag "%s" tail pursi purso trailing' % x)
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
print_('class PXTagPreAttrName (event :: Type -> Type -> Type) (proof :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event proof payload verb hasAttributed tag head tail pursi -> purso trailing')
print_('instance (Sym.Cons ">" trailing tail) => PXTagPreAttrName event proof payload verb hasAttributed tag "/" tail purs purs trailing')
print_('-- trailing will be by definition whatever comes after the closing tag, ie </ foo> will be " foo>"')
print_('else instance (Sym.Cons q r tail, PXBody event proof payload verb q r pursi purso trailing, Sym.Cons x y trailing, PreEndTagFromTrailing x y tag newTrailing) => PXTagPreAttrName event proof payload verb hasAttributed tag ">" tail pursi purso newTrailing')
print_('--')
for x in WHITESPACE:
  print_('else instance (Sym.Cons x y tail, PXTagPreAttrName event proof payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrName event proof payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
for x in string.ascii_letters:
  print_('else instance (PXTagAttrName event proof payload verb hasAttributed tag "%s" tail pursi purso trailing) => PXTagPreAttrName event proof payload verb hasAttributed tag "%s" tail pursi purso trailing' % (x,x))
print_('else instance (Sym.Cons x y tail, DoVerbForAttr event proof verb tag "" x y pursi pursx newTail, Sym.Cons xx yy newTail, PXTagPreAttrName event proof payload verb True tag xx yy pursx purso trailing) => PXTagPreAttrName event proof payload verb False tag verb tail pursi purso trailing')
print_('--')
print_('class PXTagAttrName (event :: Type -> Type -> Type) (proof :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event proof payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in string.ascii_lowercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName event proof payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrValue event proof payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName event proof payload verb hasAttributed tag "=" tail pursi purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPostAttrName event proof payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName event proof payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('--')
print_('class PXTagPostAttrName (event :: Type -> Type -> Type) (proof :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event proof payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPostAttrName event proof payload verb hasAttributed tag x y pursi purso trailing) => PXTagPostAttrName event proof payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrValue event proof payload verb hasAttributed tag x y pursi purso trailing) => PXTagPostAttrName event proof payload verb hasAttributed tag "=" tail pursi purso trailing')
print_('--')
print_('class PXTagPreAttrValue (event :: Type -> Type -> Type) (proof :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event proof payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPreAttrValue event proof payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrValue event proof payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrValue event proof payload verb hasAttributed tag "\\"" tail pursi purso trailing')
print_('--')
print_('class PXTagAttrValue (event :: Type -> Type -> Type) (proof :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event proof payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in [y for y in (string.ascii_lowercase+string.ascii_uppercase+string.digits+':,;\'!@#$%^&*()_-=`~<>/.')]+['\\\\']+WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrValue event proof payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrName event proof payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrValue event proof payload verb hasAttributed tag "\\"" tail pursi purso trailing')
print_('class PXBody (event :: Type -> Type -> Type) (proof :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event proof payload verb tail pursi -> purso trailing')
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
class CloseOrRepeat (event :: Type -> Type -> Type) (proof :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | event proof payload verb head tail pursi -> purso trailing
instance CloseOrRepeat event proof payload verb "/" tail purs purs tail
else instance
  ( Sym.Cons "-" y tail
  , Sym.Cons "-" yy y
  , Sym.Cons x yyy yy
  , SkipUntilCommentEnd x yyy trailing
  , Sym.Cons mm bb trailing
  , PXBody event proof payload verb mm bb pursi purso newTrailing
  ) =>
  CloseOrRepeat event proof payload verb "!" tail pursi purso newTrailing
else instance (PXTagPreName event proof payload verb anything tail () pursm trailing, Row.Union pursi pursm pursz, Sym.Cons x y trailing, PXBody event proof payload verb x y pursz purso newTrailing) => CloseOrRepeat event proof payload verb anything tail pursi purso newTrailing
instance (Sym.Cons x y tail, CloseOrRepeat event proof payload verb x y pursi purso trailing) => PXBody event proof payload verb "<" tail pursi purso trailing
else instance (Sym.Cons x y tail, DoVerbForDOM event proof payload verb "" x y pursi pursx newTail, Sym.Cons xx yy newTail, PXBody event proof payload verb xx yy pursx purso trailing) => PXBody event proof payload verb verb tail pursi purso trailing
else instance (Sym.Cons x y tail, PXBody event proof payload verb x y pursi purso trailing) => PXBody event proof payload verb anything tail pursi purso trailing''')
print_('''

class
  Plus (event proof) <=
  PursxToElement event proof payload (rl :: RL.RowList Type) (r :: Row Type)
  | rl -> event proof payload r where
  pursxToElement
    :: forall proxy
     . proxy rl
    -> { | r }
    -> { cache :: Object.Object Boolean, element :: Element event proof payload }

instance pursxToElementConsElt ::
  ( Row.Cons key (PursxElement event proof payload) r' r
  , PursxToElement event proof payload rest r
  , IsSymbol key
  ) =>
  PursxToElement event proof payload (RL.Cons key (PursxElement event proof payload) rest) r where
  pursxToElement _ r =
    let
      { cache, element } = pursxToElement (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectSymbol pxk) false cache
      , element: Element \parent di ->
          (let Element y = pxe in y) (reflectSymbol pxk) di
            <|> (let Element y = element in y) parent di
      }
    where
    pxk = Proxy :: _ key
    PursxElement pxe = get pxk r

else instance pursxToElementConsAttr ::
  ( Row.Cons key (event proof (Attribute deku)) r' r
  , PursxToElement event proof payload rest r
  , IsSymbol key
  ) =>
  PursxToElement event proof payload (RL.Cons key (event proof (Attribute deku)) rest) r where
  pursxToElement _ r =
    let
      { cache, element } = pursxToElement (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectSymbol pxk) true cache
      , element: Element \parent di@(DOMInterpret { setAttribute }) ->
          map
            ( lcmap unsafeUnAttribute
                ( \{ key, value } -> setAttribute
                    { id: reflectSymbol $ pxk
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
  Plus (event proof) =>
  PursxToElement event proof payload RL.Nil r where
  pursxToElement _ _ = { cache: Object.empty, element: Element \_ _ -> empty }

psx
  :: forall event proof payload proxy (html :: Symbol)
   . IsSymbol html
  => PXStart event proof payload "~" " " html ()
  => PursxToElement event proof payload RL.Nil ()
  => IsEvent (event proof)
  => proxy html
  -> Element event proof payload
psx px = makePursx px {}

makePursx
  :: forall event proof payload proxy (html :: Symbol) r rl
   . IsSymbol html
  => PXStart event proof payload "~" " " html r
  => RL.RowToList r rl
  => PursxToElement event proof payload rl r
  => IsEvent (event proof)
  => proxy html
  -> { | r }
  -> Element event proof payload
makePursx = makePursx' (Proxy :: _ "~")

makePursx'
  :: forall event proof payload verb proxyA proxyB (html :: Symbol) r rl
   . IsSymbol html
  => IsSymbol verb
  => PXStart event proof payload verb " " html r
  => RL.RowToList r rl
  => PursxToElement event proof payload rl r
  => IsEvent (event proof)
  => proxyA verb
  -> proxyB html
  -> { | r }
  -> Element event proof payload
makePursx' verb html r = Element go
  where
  go parent di@(DOMInterpret { makePursx: mpx, ids }) = keepLatest
    ( (sample_ ids (pure unit)) <#> \me ->
        let
          { cache, element } = pursxToElement (Proxy :: _ rl) r
        in
          ( pure $ mpx
              { id: me
              , parent
              , cache
              , html: reflectSymbol html
              , verb: reflectSymbol verb
              }
          ) <|> (let Element y = element in y) me di
    )

infixr 5 makePursx as ~~

''')
with open('src/Deku/Pursx.purs', 'w') as f:
  for x in o: f.write(x+'\n')
import subprocess
subprocess.call('npx purs-tidy format-in-place src/Deku/Pursx.purs', shell=True)