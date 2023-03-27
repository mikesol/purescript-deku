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
print_('class DoVerbForDOM (payload :: Type) (verb :: Symbol) (acc :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (newTail :: Symbol) | payload verb acc head tail pursi -> purso newTail')
print_('instance (Row.Cons acc (Domable) pursi purso) => DoVerbForDOM payload verb acc verb tail pursi purso tail')
print_('else instance (Sym.Append acc anything acc2, Sym.Cons x y tail, DoVerbForDOM payload verb acc2 x y pursi purso newTail) => DoVerbForDOM payload verb acc anything tail pursi purso newTail')
print_('--')
print_('class IsWhiteSpace (space :: Symbol)')
print_('instance IsWhiteSpace ""')
print_('else instance (Sym.Cons x y s, IsSingleWhiteSpace x, IsWhiteSpace y) => IsWhiteSpace s')
print_('class IsSingleWhiteSpace (s :: Symbol)')
for x in WHITESPACE:
    print_('instance IsSingleWhiteSpace "%s"' % (x,))

print_('class PXStart (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (purs :: Row Type) | payload verb head tail -> purs')
for x in WHITESPACE:
    print_('instance (Sym.Cons x y tail, PXStart payload verb x y purs) => PXStart payload verb "%s" tail purs' % (x,))
print_("""instance
  ( Sym.Cons x y tail
  , PXTagPreName payload verb x y () purso trailing
  , IsWhiteSpace trailing
  ) => PXStart payload verb "<" tail purso
""")
print_("--")
print_('class PXTagPreName (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | payload verb head tail pursi -> purso trailing')
for x in WHITESPACE:
    print_('instance (Sym.Cons x y tail, PXTagPreName payload verb x y pursi purso trailing) => PXTagPreName payload verb "%s" tail pursi purso trailing' % (x,))
for x in string.ascii_lowercase:
  print_('instance (PXTagName payload verb "" "%s" tail pursi purso trailing) => PXTagPreName payload verb "%s" tail pursi purso trailing' % (x,x))
print_('--')
print_('class PXTagName (payload :: Type) (verb :: Symbol) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | payload verb tag head tail pursi -> purso trailing')
print_('instance (Sym.Cons q r tail, PXBody payload verb q r pursi purso trailing, Sym.Cons x y trailing, PreEndTagFromTrailing x y tag newTrailing) => PXTagName payload verb tag ">" tail pursi purso newTrailing')
for x in string.ascii_lowercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, Sym.Append tag_ "%s" tag, PXTagName payload verb tag x y pursi purso trailing) => PXTagName payload verb tag_ "%s" tail pursi purso trailing' % (x,x))
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPreAttrName payload verb False tag x y pursi purso trailing) => PXTagName payload verb tag "%s" tail pursi purso trailing' % x)
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
print_('class PXTagPreAttrName (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | payload verb hasAttributed tag head tail pursi -> purso trailing')
print_('instance (Sym.Cons ">" trailing tail) => PXTagPreAttrName payload verb hasAttributed tag "/" tail purs purs trailing')
print_('-- trailing will be by definition whatever comes after the closing tag, ie </ foo> will be " foo>"')
print_('else instance (Sym.Cons q r tail, PXBody payload verb q r pursi purso trailing, Sym.Cons x y trailing, PreEndTagFromTrailing x y tag newTrailing) => PXTagPreAttrName payload verb hasAttributed tag ">" tail pursi purso newTrailing')
print_('--')
for x in WHITESPACE:
  print_('else instance (Sym.Cons x y tail, PXTagPreAttrName payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrName payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
for x in string.ascii_letters:
  print_('else instance (PXTagAttrName payload verb hasAttributed tag "%s" tail pursi purso trailing) => PXTagPreAttrName payload verb hasAttributed tag "%s" tail pursi purso trailing' % (x,x))
print_('else instance (Sym.Cons x y tail, DoVerbForAttr verb tag "" x y pursi pursx newTail, Sym.Cons xx yy newTail, PXTagPreAttrName payload verb True tag xx yy pursx purso trailing) => PXTagPreAttrName payload verb False tag verb tail pursi purso trailing')
print_('--')
print_('class PXTagAttrName (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in string.ascii_lowercase+string.ascii_uppercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, PXTagAttrName payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrValue payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName payload verb hasAttributed tag "=" tail pursi purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPostAttrName payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('--')
print_('class PXTagPostAttrName (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPostAttrName payload verb hasAttributed tag x y pursi purso trailing) => PXTagPostAttrName payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrValue payload verb hasAttributed tag x y pursi purso trailing) => PXTagPostAttrName payload verb hasAttributed tag "=" tail pursi purso trailing')
print_('--')
print_('class PXTagPreAttrValue (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPreAttrValue payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrValue payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagAttrValue payload verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrValue payload verb hasAttributed tag "\\"" tail pursi purso trailing')
print_('--')
print_('class PXTagAttrValue (payload :: Type) (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | payload verb hasAttributed tag head tail pursi -> purso trailing')
for x in [y for y in (string.ascii_lowercase+string.ascii_uppercase+string.digits+':,;\'!?@#$%^&*()_-=`~<>/.')]+['\\\\']+WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagAttrValue payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrValue payload verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrName payload verb hasAttributed tag x y pursi purso trailing) => PXTagAttrValue payload verb hasAttributed tag "\\"" tail pursi purso trailing')
print_('class PXBody (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | payload verb tail pursi -> purso trailing')
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
class CloseOrRepeat (payload :: Type) (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | payload verb head tail pursi -> purso trailing
instance CloseOrRepeat payload verb "/" tail purs purs tail
else instance
  ( Sym.Cons "-" y tail
  , Sym.Cons "-" yy y
  , Sym.Cons x yyy yy
  , SkipUntilCommentEnd x yyy trailing
  , Sym.Cons mm bb trailing
  , PXBody payload verb mm bb pursi purso newTrailing
  ) =>
  CloseOrRepeat payload verb "!" tail pursi purso newTrailing
else instance (PXTagPreName payload verb anything tail () pursm trailing, Row.Union pursi pursm pursz, Sym.Cons x y trailing, PXBody payload verb x y pursz purso newTrailing) => CloseOrRepeat payload verb anything tail pursi purso newTrailing
instance (Sym.Cons x y tail, CloseOrRepeat payload verb x y pursi purso trailing) => PXBody payload verb "<" tail pursi purso trailing
else instance (Sym.Cons x y tail, DoVerbForDOM payload verb "" x y pursi pursx newTail, Sym.Cons xx yy newTail, PXBody payload verb xx yy pursx purso trailing) => PXBody payload verb verb tail pursi purso trailing
else instance (Sym.Cons x y tail, PXBody payload verb x y pursi purso trailing) => PXBody payload verb anything tail pursi purso trailing''')
print_('''
class
  PursxToElement payload (rl :: RL.RowList Type) (r :: Row Type)
  | rl -> payload r where
  pursxToElement
    :: String
    -> Proxy rl
    -> { | r }
    -> { cache :: Object.Object Boolean, element :: Node payload }

instance pursxToElementConsInsert ::
  ( Row.Cons key (Domable) r' r
  , PursxToElement payload rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    payload
    (RL.Cons key (Domable) rest)
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
  , PursxToElement payload rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
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
  PursxToElement payload RL.Nil r where
  pursxToElement _ _ _ = { cache: Object.empty, element: Node \_ _ -> empty }

psx
  :: forall payload (html :: Symbol)
   . Reflectable html String
  => PXStart payload "~" " " html ()
  => PursxToElement payload RL.Nil ()
  => Proxy html
  -> Domable
psx px = makePursx px {}

makePursx
  :: forall payload (html :: Symbol) r rl
   . Reflectable html String
  => PXStart payload "~" " " html r
  => RL.RowToList r rl
  => PursxToElement payload rl r
  => Proxy html
  -> { | r }
  -> Domable
makePursx = makePursx' (Proxy :: _ "~")

makePursx'
  :: forall payload verb (html :: Symbol) r rl
   . Reflectable html String
  => Reflectable verb String
  => PXStart payload verb " " html r
  => RL.RowToList r rl
  => PursxToElement payload rl r
  => Proxy verb
  -> Proxy html
  -> { | r }
  -> Domable
makePursx' verb html r = Domable $ Element' $ Node go
  where
  go
    z@{ parent, scope, raiseId, dynFamily, pos }
    di@(DOMInterpret { makePursx: mpx, ids, deleteFromCache, attributeParent }) =
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
                    pure $ attributeParent { id: me, parent: p, pos, dynFamily, ez: false }
                )
                parent]
          )
          k1
      pure do
        runSTFn1 k1 (deleteFromCache { id: me })
        unsub

unsafeMakePursx
  :: forall payload r rl
   . RL.RowToList r rl
  => PursxToElement payload rl r
  => String
  -> { | r }
  -> Domable
unsafeMakePursx = unsafeMakePursx' "~"

unsafeMakePursx'
  :: forall payload r rl
   . RL.RowToList r rl
  => PursxToElement payload rl r
  => String
  -> String
  -> { | r }
  -> Domable
unsafeMakePursx' verb html r = Domable $ Element' $ Node go
  where
  go
    z@{ parent, scope, raiseId, dynFamily, pos }
    di@(DOMInterpret { makePursx: mpx, ids, deleteFromCache, attributeParent }) =
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
                    pure $ attributeParent
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
  :: PSR (pos :: Maybe Int, dynFamily :: Maybe String, ez :: Boolean)
  -> DOMInterpret payload
  -> Domable
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
  ((coerce :: Domable -> Domable' payload) c)

infixr 5 makePursx as ~~
infixr 5 unsafeMakePursx as ~!~
''')
with open('src/Deku/Pursx.purs', 'w') as f:
  for x in o: f.write(x+'\n')
import subprocess
subprocess.call('npx purs-tidy format-in-place src/Deku/Pursx.purs', shell=True)