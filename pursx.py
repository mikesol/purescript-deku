import string
o = []
def print_(x): o.append(x)
WHITESPACE = [" ","\\t","\\n"]

print_('''module Deku.Pursx where

import Prelude

import Bolson.Control as Bolson
import Bolson.Core (Element(..), Entity(..), PSR)
import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Maybe (Maybe(..))
import Data.Newtype (unwrap)
import Data.Profunctor (lcmap)
import Data.Reflectable (class Reflectable, reflectType)
import Data.Symbol (class IsSymbol)
import Deku.Interpret (namespaceWithPursxScope)
import Deku.Attribute (Attribute, AttributeValue(..), unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), class Korok, Domable, Node(..))
import Deku.DOM (class TagToDeku)
import FRP.Event (AnEvent, bang, subscribe, makeEvent)
import Foreign.Object as Object
import Prim.Boolean (False, True)
import Prim.Row as Row
import Prim.RowList as RL
import Prim.Symbol as Sym
import Record (get)
import Type.Proxy (Proxy(..))

newtype PursxElement e m lock payload = PursxElement
  (Domable e m lock payload)

nut
  :: forall e m lock payload
   . Domable e m lock payload
  -> PursxElement e m lock payload
nut = PursxElement
''')

print_('pursx :: forall s. Proxy s')
print_('pursx = Proxy')
print_('class DoVerbForAttr  (verb :: Symbol) (tag :: Symbol) (acc :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (newTail :: Symbol) | verb acc head tail pursi -> purso newTail')
print_('instance (TagToDeku tag deku,  Row.Cons acc (AnEvent m (Attribute deku)) pursi purso) => DoVerbForAttr verb tag acc verb tail pursi purso tail')
print_('else instance (Sym.Append acc anything acc2, Sym.Cons x y tail, DoVerbForAttr verb tag acc2 x y pursi purso newTail) => DoVerbForAttr verb tag acc anything tail pursi purso newTail')
print_('--')
print_('class DoVerbForDOM  (e :: Type) (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (acc :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (newTail :: Symbol) | e m lock payload verb acc head tail pursi -> purso newTail')
print_('instance (Row.Cons acc (PursxElement e m lock payload) pursi purso) => DoVerbForDOM e m lock payload verb acc verb tail pursi purso tail')
print_('else instance (Sym.Append acc anything acc2, Sym.Cons x y tail, DoVerbForDOM e m lock payload verb acc2 x y pursi purso newTail) => DoVerbForDOM e m lock payload verb acc anything tail pursi purso newTail')
print_('--')
print_('class IsWhiteSpace (space :: Symbol)')
print_('instance IsWhiteSpace ""')
print_('else instance (Sym.Cons x y s, IsSingleWhiteSpace x, IsWhiteSpace y) => IsWhiteSpace s')
print_('class IsSingleWhiteSpace (s :: Symbol)')
for x in WHITESPACE:
    print_('instance IsSingleWhiteSpace "%s"' % (x,))

print_('class PXStart  (e :: Type) (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (purs :: Row Type) | e m lock payload verb head tail -> purs')
for x in WHITESPACE:
    print_('instance (Sym.Cons x y tail, PXStart e m lock payload verb x y purs) => PXStart e m lock payload verb "%s" tail purs' % (x,))
print_("""instance
  ( Sym.Cons x y tail
  , PXTagPreName e m lock payload verb x y () purso trailing
  , IsWhiteSpace trailing
  ) => PXStart e m lock payload verb "<" tail purso
""")
print_("--")
print_('class PXTagPreName  (e :: Type) (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | e m lock payload verb head tail pursi -> purso trailing')
for x in WHITESPACE:
    print_('instance (Sym.Cons x y tail, PXTagPreName e m lock payload verb x y pursi purso trailing) => PXTagPreName e m lock payload verb "%s" tail pursi purso trailing' % (x,))
for x in string.ascii_lowercase:
  print_('instance (PXTagName e m lock payload verb "" "%s" tail pursi purso trailing) => PXTagPreName e m lock payload verb "%s" tail pursi purso trailing' % (x,x))
print_('--')
print_('class PXTagName  (e :: Type) (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | e m lock payload verb tag head tail pursi -> purso trailing')
print_('instance (Sym.Cons q r tail, PXBody e m lock payload verb q r pursi purso trailing, Sym.Cons x y trailing, PreEndTagFromTrailing x y tag newTrailing) => PXTagName e m lock payload verb tag ">" tail pursi purso newTrailing')
for x in string.ascii_lowercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, Sym.Append tag_ "%s" tag, PXTagName e m lock payload verb tag x y pursi purso trailing) => PXTagName e m lock payload verb tag_ "%s" tail pursi purso trailing' % (x,x))
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPreAttrName e m lock payload verb False tag x y pursi purso trailing) => PXTagName e m lock payload verb tag "%s" tail pursi purso trailing' % x)
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
print_('class PXTagPreAttrName  (e :: Type) (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | e m lock payload verb hasAttributed tag head tail pursi -> purso trailing')
print_('instance (Sym.Cons ">" trailing tail) => PXTagPreAttrName e m lock payload verb hasAttributed tag "/" tail purs purs trailing')
print_('-- trailing will be by definition whatever comes after the closing tag, ie </ foo> will be " foo>"')
print_('else instance (Sym.Cons q r tail, PXBody e m lock payload verb q r pursi purso trailing, Sym.Cons x y trailing, PreEndTagFromTrailing x y tag newTrailing) => PXTagPreAttrName e m lock payload verb hasAttributed tag ">" tail pursi purso newTrailing')
print_('--')
for x in WHITESPACE:
  print_('else instance (Sym.Cons x y tail, PXTagPreAttrName e m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrName e m lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
for x in string.ascii_letters:
  print_('else instance (PXTagAttrName e m lock payload verb hasAttributed tag "%s" tail pursi purso trailing) => PXTagPreAttrName e m lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % (x,x))
print_('else instance (Sym.Cons x y tail, DoVerbForAttr verb tag "" x y pursi pursx newTail, Sym.Cons xx yy newTail, PXTagPreAttrName e m lock payload verb True tag xx yy pursx purso trailing) => PXTagPreAttrName e m lock payload verb False tag verb tail pursi purso trailing')
print_('--')
print_('class PXTagAttrName  (e :: Type) (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | e m lock payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in string.ascii_lowercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, PXTagAttrName e m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName e m lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrValue e m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName e m lock payload verb hasAttributed tag "=" tail pursi purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPostAttrName e m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName e m lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('--')
print_('class PXTagPostAttrName  (e :: Type) (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | e m lock payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPostAttrName e m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPostAttrName e m lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrValue e m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPostAttrName e m lock payload verb hasAttributed tag "=" tail pursi purso trailing')
print_('--')
print_('class PXTagPreAttrValue  (e :: Type) (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | e m lock payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPreAttrValue e m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrValue e m lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagAttrValue e m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrValue e m lock payload verb hasAttributed tag "\\"" tail pursi purso trailing')
print_('--')
print_('class PXTagAttrValue  (e :: Type) (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | e m lock payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in [y for y in (string.ascii_lowercase+string.ascii_uppercase+string.digits+':,;\'!@#$%^&*()_-=`~<>/.')]+['\\\\']+WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagAttrValue e m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrValue e m lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrName e m lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrValue e m lock payload verb hasAttributed tag "\\"" tail pursi purso trailing')
print_('class PXBody  (e :: Type) (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | e m lock payload verb tail pursi -> purso trailing')
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
class CloseOrRepeat  (e :: Type) (m :: Type -> Type) (lock :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | e m lock payload verb head tail pursi -> purso trailing
instance CloseOrRepeat e m lock payload verb "/" tail purs purs tail
else instance
  ( Sym.Cons "-" y tail
  , Sym.Cons "-" yy y
  , Sym.Cons x yyy yy
  , SkipUntilCommentEnd x yyy trailing
  , Sym.Cons mm bb trailing
  , PXBody e m lock payload verb mm bb pursi purso newTrailing
  ) =>
  CloseOrRepeat e m lock payload verb "!" tail pursi purso newTrailing
else instance (PXTagPreName e m lock payload verb anything tail () pursm trailing, Row.Union pursi pursm pursz, Sym.Cons x y trailing, PXBody e m lock payload verb x y pursz purso newTrailing) => CloseOrRepeat e m lock payload verb anything tail pursi purso newTrailing
instance (Sym.Cons x y tail, CloseOrRepeat e m lock payload verb x y pursi purso trailing) => PXBody e m lock payload verb "<" tail pursi purso trailing
else instance (Sym.Cons x y tail, DoVerbForDOM e m lock payload verb "" x y pursi pursx newTail, Sym.Cons xx yy newTail, PXBody e m lock payload verb xx yy pursx purso trailing) => PXBody e m lock payload verb verb tail pursi purso trailing
else instance (Sym.Cons x y tail, PXBody e m lock payload verb x y pursi purso trailing) => PXBody e m lock payload verb anything tail pursi purso trailing''')
print_('''
class
  PursxToElement e m lock payload (rl :: RL.RowList Type) (r :: Row Type)
  | rl -> e m lock payload r where
  pursxToElement
    :: String
    -> Proxy rl
    -> { | r }
    -> { cache :: Object.Object Boolean, element :: Node e m lock payload }

instance pursxToElementConsInsert ::
  ( Row.Cons key (PursxElement e m lock payload) r' r
  , PursxToElement e m lock payload rest r
  , Reflectable key String
  , IsSymbol key
  , Korok s m
  ) =>
  PursxToElement e m
    lock
    payload
    (RL.Cons key (PursxElement e m lock payload) rest)
    r where
  pursxToElement pxScope _ r =
    let
      { cache, element } = pursxToElement pxScope (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectType pxk) false cache
      , element: Node \info di ->
          __internalDekuFlatten
            { parent: Just (namespaceWithPursxScope (reflectType pxk) pxScope)
            , scope: info.scope
            , raiseId: \_ _ -> pure unit
            }
            di
            pxe
            <|> (let Node y = element in y) info di
      }
    where
    pxk = Proxy :: _ key
    PursxElement pxe = get pxk r

else instance pursxToElementConsAttr ::
  ( Row.Cons key (AnEvent m (Attribute deku)) r' r
  , PursxToElement e m lock payload rest r
  , Reflectable key String
  , IsSymbol key
  , Korok s m
  ) =>
  PursxToElement e m
    lock
    payload
    (RL.Cons key (AnEvent m (Attribute deku)) rest)
    r where
  pursxToElement pxScope _ r =
    let
      { cache, element } = pursxToElement pxScope (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectType pxk) true cache
      , element: Node \parent di@(DOMInterpret { setProp, setCb }) ->
          map
            ( lcmap unsafeUnAttribute
                ( \{ key, value } -> case value of
                    Prop' p -> setProp
                      { id: namespaceWithPursxScope (reflectType pxk) pxScope
                      , key
                      , parent: parent.parent
                      , value: p
                      , scope: parent.scope
                      }
                    Cb' c -> setCb
                      { id: namespaceWithPursxScope (reflectType pxk) pxScope
                      , key
                      , parent: parent.parent
                      , value: c
                      , scope: parent.scope
                      }
                )
            )
            (get pxk r)
            <|> (let Node y = element in y) parent di
      }
    where
    pxk = Proxy :: _ key

instance pursxToElementNil ::
  Applicative m =>
  PursxToElement e m lock payload RL.Nil r where
  pursxToElement _ _ _ = { cache: Object.empty, element: Node \_ _ -> empty }

psx
  :: forall s m e lock payload (html :: Symbol)
   . Reflectable html String
  => PXStart e m lock payload "~" " " html ()
  => Korok s m
  => PursxToElement e m lock payload RL.Nil ()
  => Proxy html
  -> Domable e m lock payload
psx px = makePursx px {}

makePursx
  :: forall s m e lock payload (html :: Symbol) r rl
   . Reflectable html String
  => PXStart e m lock payload "~" " " html r
  => RL.RowToList r rl
  => PursxToElement e m lock payload rl r
  => Korok s m
  => Proxy html
  -> { | r }
  -> Domable e m lock payload
makePursx = makePursx' (Proxy :: _ "~")

makePursx'
  :: forall s m e lock payload verb (html :: Symbol) r rl
   . Reflectable html String
  => Reflectable verb String
  => PXStart e m lock payload verb " " html r
  => RL.RowToList r rl
  => Korok s m
  => PursxToElement e m lock payload rl r
  => Proxy verb
  -> Proxy html
  -> { | r }
  -> Domable e m lock payload
makePursx' verb html r = Element' $ Node go
  where
  go
    z@{ parent, scope, raiseId }
    di@(DOMInterpret { makePursx: mpx, attributeParent, ids, deleteFromCache }) =
    makeEvent \k1 -> do
      me <- ids
      pxScope <- ids
      raiseId me scope
      let
        { cache, element: Node element } = pursxToElement
          pxScope
          (Proxy :: _ rl)
          r
      map (k1 (deleteFromCache { id: me }) *> _) $
        subscribe
          ( ( bang $
                mpx
                  { id: me
                  , cache
                  , parent
                  , pxScope: pxScope
                  , scope
                  , html: reflectType html
                  , verb: reflectType verb
                  }
            ) <|> (case parent of
                        Just p' -> bang (attributeParent { id: me, parent: p' })
                        Nothing -> empty
               ) <|> element z di
          )
          k1

__internalDekuFlatten
  :: forall s m e lock payload
   . Korok s m
  => PSR m
  -> DOMInterpret e m payload
  -> Domable e m lock payload
  -> AnEvent m payload
__internalDekuFlatten = Bolson.flatten
  { doLogic: \pos (DOMInterpret { sendToPos }) id -> sendToPos { id, pos }
  , ids: unwrap >>> _.ids
  , dynamicElementRemoved:
      \(DOMInterpret { removeChild }) { id, scope } ->
        removeChild { id, scope }
  , dynamicElementInserted: \(DOMInterpret { addChild }) { id, parent } ->
      addChild { child: id, parent }
  , toElt: \(Node e) -> Element e
  }

infixr 5 makePursx as ~~

''')
with open('src/Deku/Pursx.purs', 'w') as f:
  for x in o: f.write(x+'\n')
import subprocess
subprocess.call('npx purs-tidy format-in-place src/Deku/Pursx.purs', shell=True)