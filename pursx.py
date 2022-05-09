import string
o = []
def print_(x): o.append(x)
WHITESPACE = [" ","\\t","\\n"]

print_('''module Deku.Pursx where

import Prelude

import Control.Alt ((<|>))
import Data.Reflectable (class Reflectable, reflectType)
import Control.Plus (empty)
import Control.Monad.ST.Class (class MonadST)
import Data.Symbol (class IsSymbol)
import Data.Profunctor (lcmap)
import Deku.Attribute (Attribute, AttributeValue(..), unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Element(..), Domable(..))
import Deku.Control(__internalDekuFlatten)
import Deku.DOM (class TagToDeku)
import FRP.Event (AnEvent, bang, subscribe, makeEvent)
import Foreign.Object as Object
import Prim.Boolean (False, True)
import Prim.Row as Row
import Prim.RowList as RL
import Prim.Symbol as Sym
import Record (get)
import Type.Proxy (Proxy(..))

newtype PursxElement m lock payload = PursxElement
  (Domable m lock payload)

nut
  :: forall m lock payload
   . Domable m lock payload
  -> PursxElement m lock payload
nut = PursxElement
''')

print_('pursx :: forall s. Proxy s')
print_('pursx = Proxy')
print_('class DoVerbForAttr  (verb :: Symbol) (tag :: Symbol) (acc :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (newTail :: Symbol) | verb acc head tail pursi -> purso newTail')
print_('instance (TagToDeku tag deku,  Row.Cons acc (AnEvent m (Attribute deku)) pursi purso) => DoVerbForAttr verb tag acc verb tail pursi purso tail')
print_('else instance (Sym.Append acc anything acc2, Sym.Cons x y tail, DoVerbForAttr verb tag acc2 x y pursi purso newTail) => DoVerbForAttr verb tag acc anything tail pursi purso newTail')
print_('--')
print_('class DoVerbForDOM  (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (acc :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (newTail :: Symbol) | m lock payload verb acc head tail pursi -> purso newTail')
print_('instance (Row.Cons acc (PursxElement m lock payload) pursi purso) => DoVerbForDOM m lock payload verb acc verb tail pursi purso tail')
print_('else instance (Sym.Append acc anything acc2, Sym.Cons x y tail, DoVerbForDOM m lock payload verb acc2 x y pursi purso newTail) => DoVerbForDOM m lock payload verb acc anything tail pursi purso newTail')
print_('--')
print_('class IsWhiteSpace (space :: Symbol)')
print_('instance IsWhiteSpace ""')
print_('else instance (Sym.Cons x y s, IsSingleWhiteSpace x, IsWhiteSpace y) => IsWhiteSpace s')
print_('class IsSingleWhiteSpace (s :: Symbol)')
for x in WHITESPACE:
    print_('instance IsSingleWhiteSpace "%s"' % (x,))

print_('class PXStart  (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (purs :: Row Type) | m lock payload verb head tail -> purs')
for x in WHITESPACE:
    print_('instance (Sym.Cons x y tail, PXStart m lock payload verb x y purs) => PXStart m lock payload verb "%s" tail purs' % (x,))
print_("""instance
  ( Sym.Cons x y tail
  , PXTagPreName m lock payload verb x y () purso trailing
  , IsWhiteSpace trailing
  ) => PXStart m lock payload verb "<" tail purso
""")
print_("--")
print_('class PXTagPreName  (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | m lock payload verb head tail pursi -> purso trailing')
for x in WHITESPACE:
    print_('instance (Sym.Cons x y tail, PXTagPreName m lock payload verb x y pursi purso trailing) => PXTagPreName m lock payload verb "%s" tail pursi purso trailing' % (x,))
for x in string.ascii_lowercase:
  print_('instance (PXTagName m lock payload verb "" "%s" tail pursi purso trailing) => PXTagPreName m lock payload verb "%s" tail pursi purso trailing' % (x,x))
print_('--')
print_('class PXTagName  (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | m lock payload verb tag head tail pursi -> purso trailing')
print_('instance (Sym.Cons q r tail, PXBody m lock payload verb q r pursi purso trailing, Sym.Cons x y trailing, PreEndTagFromTrailing x y tag newTrailing) => PXTagName m lock payload verb tag ">" tail pursi purso newTrailing')
for x in string.ascii_lowercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, Sym.Append tag_ "%s" tag, PXTagName m lock payload verb tag x y pursi purso trailing) => PXTagName m lock payload verb tag_ "%s" tail pursi purso trailing' % (x,x))
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPreAttrName m lock payload verb False tag x y pursi purso trailing) => PXTagName m lock payload verb tag "%s" tail pursi purso trailing' % x)
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
print_('class PXTagPreAttrName  (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | m lock payload verb hasAttributed tag head tail pursi -> purso trailing')
print_('instance (Sym.Cons ">" trailing tail) => PXTagPreAttrName m lock payload verb hasAttributed tag "/" tail purs purs trailing')
print_('-- trailing will be by definition whatever comes after the closing tag, ie </ foo> will be " foo>"')
print_('else instance (Sym.Cons q r tail, PXBody m lock payload verb q r pursi purso trailing, Sym.Cons x y trailing, PreEndTagFromTrailing x y tag newTrailing) => PXTagPreAttrName m lock payload verb hasAttributed tag ">" tail pursi purso newTrailing')
print_('--')
for x in WHITESPACE:
  print_('else instance (Sym.Cons x y tail, PXTagPreAttrName m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrName m lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
for x in string.ascii_letters:
  print_('else instance (PXTagAttrName m lock payload verb hasAttributed tag "%s" tail pursi purso trailing) => PXTagPreAttrName m lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % (x,x))
print_('else instance (Sym.Cons x y tail, DoVerbForAttr verb tag "" x y pursi pursx newTail, Sym.Cons xx yy newTail, PXTagPreAttrName m lock payload verb True tag xx yy pursx purso trailing) => PXTagPreAttrName m lock payload verb False tag verb tail pursi purso trailing')
print_('--')
print_('class PXTagAttrName  (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | m lock payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in string.ascii_lowercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName m lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrValue m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName m lock payload verb hasAttributed tag "=" tail pursi purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPostAttrName m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName m lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('--')
print_('class PXTagPostAttrName  (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | m lock payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPostAttrName m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPostAttrName m lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrValue m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPostAttrName m lock payload verb hasAttributed tag "=" tail pursi purso trailing')
print_('--')
print_('class PXTagPreAttrValue  (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | m lock payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPreAttrValue m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrValue m lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrValue m lock payload verb hasAttributed tag "\\"" tail pursi purso trailing')
print_('--')
print_('class PXTagAttrValue  (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | m lock payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in [y for y in (string.ascii_lowercase+string.ascii_uppercase+string.digits+':,;\'!@#$%^&*()_-=`~<>/.')]+['\\\\']+WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrValue m lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrName m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrValue m lock payload verb hasAttributed tag "\\"" tail pursi purso trailing')
print_('class PXBody  (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | m lock payload verb tail pursi -> purso trailing')
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
class CloseOrRepeat  (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | m lock payload verb head tail pursi -> purso trailing
instance CloseOrRepeat m lock payload verb "/" tail purs purs tail
else instance
  ( Sym.Cons "-" y tail
  , Sym.Cons "-" yy y
  , Sym.Cons x yyy yy
  , SkipUntilCommentEnd x yyy trailing
  , Sym.Cons mm bb trailing
  , PXBody m lock payload verb mm bb pursi purso newTrailing
  ) =>
  CloseOrRepeat m lock payload verb "!" tail pursi purso newTrailing
else instance (PXTagPreName m lock payload verb anything tail () pursm trailing, Row.Union pursi pursm pursz, Sym.Cons x y trailing, PXBody m lock payload verb x y pursz purso newTrailing) => CloseOrRepeat m lock payload verb anything tail pursi purso newTrailing
instance (Sym.Cons x y tail, CloseOrRepeat m lock payload verb x y pursi purso trailing) => PXBody m lock payload verb "<" tail pursi purso trailing
else instance (Sym.Cons x y tail, DoVerbForDOM m lock payload verb "" x y pursi pursx newTail, Sym.Cons xx yy newTail, PXBody m lock payload verb xx yy pursx purso trailing) => PXBody m lock payload verb verb tail pursi purso trailing
else instance (Sym.Cons x y tail, PXBody m lock payload verb x y pursi purso trailing) => PXBody m lock payload verb anything tail pursi purso trailing''')
print_('''
class
  PursxToElement m lock payload (rl :: RL.RowList Type) (r :: Row Type)
  | rl -> m lock payload r where
  pursxToElement
    :: String
    -> Proxy rl
    -> { | r }
    -> { cache :: Object.Object Boolean, element :: Element m lock payload }

instance pursxToElementConsInsert ::
  ( Row.Cons key (PursxElement m lock payload) r' r
  , PursxToElement m lock payload rest r
  , Reflectable key String
  , IsSymbol key
  , MonadST s m
  ) =>
  PursxToElement m lock payload (RL.Cons key (PursxElement m lock payload) rest) r where
  pursxToElement pxScope _ r =
    let
      { cache, element } = pursxToElement pxScope (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectType pxk) false cache
      , element: Element \info di ->
          __internalDekuFlatten {parent: reflectType pxk <> pxScope, scope: info.scope, raiseId: \_ -> pure unit } di pxe
            <|> (let Element y = element in y) info di
      }
    where
    pxk = Proxy :: _ key
    PursxElement pxe = get pxk r

else instance pursxToElementConsAttr ::
  ( Row.Cons key (AnEvent m (Attribute deku)) r' r
  , PursxToElement m lock payload rest r
  , Reflectable key String
  , IsSymbol key
  , MonadST s m
  ) =>
  PursxToElement m lock payload (RL.Cons key (AnEvent m (Attribute deku)) rest) r where
  pursxToElement pxScope _ r =
    let
      { cache, element } = pursxToElement pxScope (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectType pxk) true cache
      , element: Element \parent di@(DOMInterpret { setProp, setCb }) ->
          map
            ( lcmap unsafeUnAttribute
                ( \{ key, value } -> case value of
                    Prop' p -> setProp { id: ((reflectType pxk) <> pxScope)
                            , key
                            , value: p
                            }
                    Cb' c -> setCb { id: ((reflectType pxk) <> pxScope)
                            , key
                            , value: c
                            }
                )
            )
            (get pxk r)
            <|> (let Element y = element in y) parent di
      }
    where
    pxk = Proxy :: _ key

instance pursxToElementNil ::
  Applicative m => PursxToElement m lock payload RL.Nil r where
  pursxToElement _ _ _ = { cache: Object.empty, element: Element \_ _ -> empty }

psx
  :: forall s m lock payload (html :: Symbol)
   . Reflectable html String
  => PXStart m lock payload "~" " " html ()
  => MonadST s m
  => PursxToElement m lock payload RL.Nil ()
  => Proxy html
  -> Domable m lock payload
psx px = makePursx px {}

makePursx
  :: forall s m lock payload (html :: Symbol) r rl
   . Reflectable html String
  => PXStart m lock payload "~" " " html r
  => RL.RowToList r rl
  => PursxToElement m lock payload rl r
  => MonadST s m
  => Proxy html
  -> { | r }
  -> Domable m lock payload
makePursx = makePursx' (Proxy :: _ "~")

makePursx'
  :: forall s m lock payload verb (html :: Symbol) r rl
   . Reflectable html String
  => Reflectable verb String
  => PXStart m lock payload verb " " html r
  => RL.RowToList r rl
  => MonadST s m
  => PursxToElement m lock payload rl r
  => Proxy verb
  -> Proxy html
  -> { | r }
  -> Domable m lock payload
makePursx' verb html r = Element' $ Element go
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
                  , html: reflectType html
                  , verb: reflectType verb
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