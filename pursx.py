import string
o = []
def print_(x): o.append(x)
WHITESPACE = [" ","\\t","\\n"]

print_('''module Deku.Pursx where

import Prelude

import Bolson.Control as Bolson
import Control.Monad.ST.Uncurried (mkSTFn2, runSTFn1, runSTFn2)
import Bolson.Core (Element(..), Entity(..), PSR)
import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (unwrap)
import Safe.Coerce (coerce)
import Data.Profunctor (lcmap)
import Data.Reflectable (class Reflectable, reflectType)
import Data.Symbol (class IsSymbol)
import Deku.Attribute (Attribute, AttributeValue(..), unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Domable(..), Domable', Node(..))
import Deku.DOM (class TagToDeku)
import FRP.Event (Event, Subscriber(..), merge, makeLemmingEventO)
import Foreign.Object as Object
import Prim.Boolean (False, True)
import Prim.Row as Row
import Prim.RowList as RL
import Prim.Symbol as Sym
import Record (get)
import Type.Proxy (Proxy(..))
''')

print_('pursx :: forall s. Proxy s')
print_('pursx = Proxy')
print_('class DoVerbForAttr (verb :: Symbol) (tag :: Symbol) (acc :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (newTail :: Symbol) | verb acc head tail pursi -> purso newTail')
print_('instance (TagToDeku tag deku,  Row.Cons acc (Event (Attribute deku)) pursi purso) => DoVerbForAttr verb tag acc verb tail pursi purso tail')
print_('else instance (Sym.Append acc anything acc2, Sym.Cons x y tail, DoVerbForAttr verb tag acc2 x y pursi purso newTail) => DoVerbForAttr verb tag acc anything tail pursi purso newTail')
print_('--')
print_('class DoVerbForDOM (lock :: Type) (payload :: Type) (verb :: Symbol) (acc :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (newTail :: Symbol) | lock payload verb acc head tail pursi -> purso newTail')
print_('instance (Row.Cons acc (Domable lock payload) pursi purso) => DoVerbForDOM lock payload verb acc verb tail pursi purso tail')
print_('else instance (Sym.Append acc anything acc2, Sym.Cons x y tail, DoVerbForDOM lock payload verb acc2 x y pursi purso newTail) => DoVerbForDOM lock payload verb acc anything tail pursi purso newTail')
print_('--')
print_('class IsWhiteSpace (space :: Symbol)')
print_('instance IsWhiteSpace ""')
print_('else instance (Sym.Cons x y s, IsSingleWhiteSpace x, IsWhiteSpace y) => IsWhiteSpace s')
print_('class IsSingleWhiteSpace (s :: Symbol)')
for x in WHITESPACE:
    print_('instance IsSingleWhiteSpace "%s"' % (x,))

print_('class PXStart (lock :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (purs :: Row Type) | lock payload verb head tail -> purs')
for x in WHITESPACE:
    print_('instance (Sym.Cons x y tail, PXStart lock payload verb x y purs) => PXStart lock payload verb "%s" tail purs' % (x,))
print_("""instance
  ( Sym.Cons x y tail
  , PXTagPreName lock payload verb x y () purso trailing
  , IsWhiteSpace trailing
  ) => PXStart lock payload verb "<" tail purso
""")
print_("--")
print_('class PXTagPreName (lock :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb head tail pursi -> purso trailing')
for x in WHITESPACE:
    print_('instance (Sym.Cons x y tail, PXTagPreName lock payload verb x y pursi purso trailing) => PXTagPreName lock payload verb "%s" tail pursi purso trailing' % (x,))
for x in string.ascii_lowercase:
  print_('instance (PXTagName lock payload verb "" "%s" tail pursi purso trailing) => PXTagPreName lock payload verb "%s" tail pursi purso trailing' % (x,x))
print_('--')
print_('class PXTagName (lock :: Type) (payload :: Type) (verb :: Symbol) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb tag head tail pursi -> purso trailing')
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
print_('class PXTagPreAttrName (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb hasAttributed tag head tail pursi -> purso trailing')
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
print_('class PXTagAttrName (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in string.ascii_lowercase+string.ascii_uppercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, PXTagAttrName lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrValue lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName lock payload verb hasAttributed tag "=" tail pursi purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPostAttrName lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('--')
print_('class PXTagPostAttrName (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPostAttrName lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPostAttrName lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrValue lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPostAttrName lock payload verb hasAttributed tag "=" tail pursi purso trailing')
print_('--')
print_('class PXTagPreAttrValue (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPreAttrValue lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrValue lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagAttrValue lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrValue lock payload verb hasAttributed tag "\\"" tail pursi purso trailing')
print_('--')
print_('class PXTagAttrValue (lock :: Type) (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in [y for y in (string.ascii_lowercase+string.ascii_uppercase+string.digits+':,;\'!?@#$%^&*()_-=`~<>/.')]+['\\\\']+WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagAttrValue lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrValue lock payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrName lock payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrValue lock payload verb hasAttributed tag "\\"" tail pursi purso trailing')
print_('class PXBody (lock :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb tail pursi -> purso trailing')
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
class CloseOrRepeat (lock :: Type) (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | lock payload verb head tail pursi -> purso trailing
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
    :: String
    -> Proxy rl
    -> { | r }
    -> { cache :: Object.Object Boolean, element :: Node lock payload }

instance pursxToElementConsInsert ::
  ( Row.Cons key (Domable lock payload) r' r
  , PursxToElement lock payload rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    lock
    payload
    (RL.Cons key (Domable lock payload) rest)
    r where
  pursxToElement pxScope _ r =
    let
      { cache, element } = pursxToElement pxScope (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectType pxk) false cache
      , element: Node \info di ->
          __internalDekuFlatten
            { parent: Just (reflectType pxk <> "@!%" <> pxScope)
            , scope: info.scope
            , raiseId: \_ -> pure unit
            , pos: info.pos
            , ez: false
            , dynFamily: Nothing
            }
            di
            pxe
            <|> (let Node y = element in y) info di
      }
    where
    pxk = Proxy :: _ key
    pxe = get pxk r

else instance pursxToElementConsAttr ::
  ( Row.Cons key (Event (Attribute deku)) r' r
  , PursxToElement lock payload rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    lock
    payload
    (RL.Cons key (Event (Attribute deku)) rest)
    r where
  pursxToElement pxScope _ r =
    let
      { cache, element } = pursxToElement pxScope (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectType pxk) true cache
      , element: Node \parent di@(DOMInterpret { setProp, setCb, unsetAttribute }) ->
          map
            ( lcmap unsafeUnAttribute
                ( \{ key, value } -> case value of
                    Prop' p -> setProp
                      { id: ((reflectType pxk) <> "@!%" <> pxScope)
                      , key
                      , value: p
                      }
                    Cb' c -> setCb
                      { id: ((reflectType pxk) <> "@!%" <> pxScope)
                      , key
                      , value: c
                      }
                    Unset' -> unsetAttribute
                      { id: ((reflectType pxk) <> "@!%" <> pxScope)
                      , key
                      }
                )
            )
            (get pxk r)
            <|> (let Node y = element in y) parent di
      }
    where
    pxk = Proxy :: _ key

instance pursxToElementNil ::
  PursxToElement lock payload RL.Nil r where
  pursxToElement _ _ _ = { cache: Object.empty, element: Node \_ _ -> empty }

psx
  :: forall lock payload (html :: Symbol)
   . Reflectable html String
  => PXStart lock payload "~" " " html ()
  => PursxToElement lock payload RL.Nil ()
  => Proxy html
  -> Domable lock payload
psx px = makePursx px {}

makePursx
  :: forall lock payload (html :: Symbol) r rl
   . Reflectable html String
  => PXStart lock payload "~" " " html r
  => RL.RowToList r rl
  => PursxToElement lock payload rl r
  => Proxy html
  -> { | r }
  -> Domable lock payload
makePursx = makePursx' (Proxy :: _ "~")

makePursx'
  :: forall lock payload verb (html :: Symbol) r rl
   . Reflectable html String
  => Reflectable verb String
  => PXStart lock payload verb " " html r
  => RL.RowToList r rl
  => PursxToElement lock payload rl r
  => Proxy verb
  -> Proxy html
  -> { | r }
  -> Domable lock payload
makePursx' verb html r = Domable $ Element' $ Node go
  where
  go
    z@{ parent, scope, raiseId, dynFamily, pos }
    di@(DOMInterpret { makePursx: mpx, ids, deleteFromCache, assignParentToComponent }) =
    makeLemmingEventO $ mkSTFn2 \(Subscriber mySub) k1 -> do
      me <- ids
      pxScope <- ids
      raiseId me
      let
        { cache, element: Node element } = pursxToElement
          pxScope
          (Proxy :: _ rl)
          r
      unsub <- runSTFn2 mySub
          ( merge [pure $
                mpx
                  { id: me
                  , parent
                  , cache
                  , dynFamily
                  , pos
                  , pxScope: pxScope
                  , scope
                  , html: reflectType html
                  , verb: reflectType verb
                  }
            , element z di
            , maybe empty
                ( \p ->
                    pure $ assignParentToComponent { id: me, parent: p, pos, dynFamily, ez: false }
                )
                parent]
          )
          k1
      pure do
        runSTFn1 k1 (deleteFromCache { id: me })
        unsub

unsafeMakePursx
  :: forall lock payload r rl
   . RL.RowToList r rl
  => PursxToElement lock payload rl r
  => String
  -> { | r }
  -> Domable lock payload
unsafeMakePursx = unsafeMakePursx' "~"

unsafeMakePursx'
  :: forall lock payload r rl
   . RL.RowToList r rl
  => PursxToElement lock payload rl r
  => String
  -> String
  -> { | r }
  -> Domable lock payload
unsafeMakePursx' verb html r = Domable $ Element' $ Node go
  where
  go
    z@{ parent, scope, raiseId, dynFamily, pos }
    di@(DOMInterpret { makePursx: mpx, ids, deleteFromCache, assignParentToComponent }) =
    makeLemmingEventO $ mkSTFn2 \(Subscriber mySub) k1 -> do
      me <- ids
      pxScope <- ids
      raiseId me
      let
        { cache, element: Node element } = pursxToElement
          pxScope
          (Proxy :: _ rl)
          r
      unsub <- runSTFn2 mySub
        ( merge
            [ pure $
                mpx
                  { id: me
                  , parent
                  , cache
                  , dynFamily
                  , pos
                  , pxScope: pxScope
                  , scope
                  , html
                  , verb
                  }
            , element z di
            , maybe empty
                ( \p ->
                    pure $ assignParentToComponent
                      { id: me, parent: p, pos, dynFamily, ez: false }
                )
                parent
            ]
        )
        k1
      pure do
        runSTFn1 k1 (deleteFromCache { id: me })
        unsub

__internalDekuFlatten
  :: forall lock payload
   . PSR (pos :: Maybe Int, dynFamily :: Maybe String, ez :: Boolean)
  -> DOMInterpret payload
  -> Domable lock payload
  -> Event payload
__internalDekuFlatten a b c = Bolson.flatten
  { doLogic: \pos (DOMInterpret { sendToPos }) id -> sendToPos { id, pos }
  , ids: unwrap >>> _.ids
  , disconnectElement:
      \(DOMInterpret { disconnectElement }) { id, scope, parent } ->
        disconnectElement { id, scope, parent, scopeEq: eq }
  , toElt: \(Node e) -> Element e
  }
  a
  b
  ((coerce :: Domable lock payload -> Domable' lock payload) c)

infixr 5 makePursx as ~~
infixr 5 unsafeMakePursx as ~!~
''')
with open('src/Deku/Pursx.purs', 'w') as f:
  for x in o: f.write(x+'\n')
import subprocess
subprocess.call('npx purs-tidy format-in-place src/Deku/Pursx.purs', shell=True)