module Deku.Control
  ( elementify
  , text
  , text_
  , deku
  , globalPortal
  , portal
  , switcher
  , dyn
  , envy
  , fixed
  , vbussed
  , bussed
  , bus
  ) where

import Prelude

import Bolson.Always (AlwaysEffect, halways)
import Bolson.Control as Bolson.Control
import Bolson.Core as Bolson.Core
import Control.Plus (empty)
import Data.FastVect.FastVect (Vect)
import Data.Foldable (oneOf)
import Data.Maybe (Maybe(..), maybe)
import Data.Monoid.Always (class Always, always)
import Data.Newtype (unwrap)
import Data.Profunctor (lcmap)
import Deku.Attribute (Attribute, AttributeValue(..), unsafeUnAttribute)
import Deku.Core (class Korok, DOMInterpret(..), Domable, Node(..), Seedling)
import Effect (Effect)
import FRP.Event (AnEvent, bang, makeEvent, subscribe)
import FRP.Event as FRP.Event
import FRP.Event.VBus (class VBus, V, vbus)
import Heterogeneous.Mapping (class MapRecordWithIndex, ConstMapping)
import Prim.Int (class Compare)
import Prim.Ordering (GT)
import Prim.RowList (class RowToList)
import Safe.Coerce (coerce)
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)

type Neg1 = -1

switcher
  :: forall i e s m lock payload
   . Korok s m
  => (i -> Domable e m lock payload)
  -> AnEvent m i
  -> Domable e m lock payload
switcher = Bolson.Control.switcher

protoDyn
  :: forall e s m lock payload children
   . Korok s m
  => (children -> Domable e m lock payload)
  -> children
  -> Domable e m lock payload
protoDyn f children = Bolson.Core.Element' $ Node go
  where
  go
    { parent, scope, raiseId }
    di@(DOMInterpret { ids, makeDyn, deleteFromCache }) =
    makeEvent \k -> do
      me <- ids
      raiseId me scope
      u <- subscribe
        ( oneOf
            ( [ bang (makeDyn { id: me, parent, scope })
              , __internalDekuFlatten
                  { parent: Just me
                  , scope
                  , raiseId: \_ _ -> pure unit
                  }
                  di
                  (f children)
              ]
            )
        )
        k
      pure (k (deleteFromCache { id: me }) *> u)

dyn
  :: forall e s m lock payload
   . Korok s m
  => AnEvent m (AnEvent m (Seedling e m lock payload))
  -> Domable e m lock payload
dyn = protoDyn Bolson.Control.dyn

envy
  :: forall e s m lock payload
   . Korok s m
  => AnEvent m (Domable e m lock payload)
  -> Domable e m lock payload
envy = protoDyn Bolson.Control.envy


fixed
  :: forall e s m lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
fixed = protoDyn Bolson.Control.fixed


----
unsafeElement
  :: forall e m payload
   . DOMInterpret e m payload
  -> { id :: String
     , parent :: Maybe String
     , scope :: Bolson.Core.Scope
     , tag :: String
     }
  -> payload
unsafeElement (DOMInterpret { makeElement }) = makeElement

unsafeConnect
  :: forall e m payload
   . DOMInterpret e m payload
  -> { id :: String, parent :: String }
  -> payload
unsafeConnect (DOMInterpret { attributeParent }) = attributeParent

unsafeText
  :: forall e m payload
   . DOMInterpret e m payload
  -> { id :: String
     , parent :: Maybe String
     , scope :: Bolson.Core.Scope
     }
  -> payload
unsafeText (DOMInterpret { makeText }) = makeText

unsafeSetText
  :: forall e m payload
   . DOMInterpret e m payload
  -> String
  -> AnEvent m String
  -> AnEvent m payload
unsafeSetText (DOMInterpret { setText }) id txt = map
  (setText <<< { id, text: _ })
  txt

-- TODO: scope here is a bit hackish
-- they are only ever used in hydration iff we set an attribute on an element
-- before it is created
-- it's not even certain that this is possible anymore
-- we should find a case where at is and, if so, document it
-- it seems strange that hydration would try to set an attribute on an element before
-- having added it to the internal cache: this would only happen if the _makeElement_
-- call were defered somehow. this may have happened in the past, but i'm not sure
-- it still does
unsafeSetAttribute
  :: forall e m element payload
   . Maybe String
  -> Bolson.Core.Scope
  -> DOMInterpret e m payload
  -> String
  -> AnEvent m (Attribute element)
  -> AnEvent m payload
unsafeSetAttribute parent scope (DOMInterpret { setProp, setCb }) id atts = map
  ( ( \{ key, value } -> case value of
        Prop' s -> setProp { id, key, value: s, parent, scope }
        Cb' c -> setCb { id, key, value: c, parent, scope }
    ) <<<
      unsafeUnAttribute
  )
  (atts)

elementify
  :: forall e s m element lock payload
   . Korok s m
  => String
  -> AnEvent m (Attribute element)
  -> Domable e m lock payload
  -> Node e m lock payload
elementify tag atts children = Node go
  where
  go
    { parent, scope, raiseId }
    di@(DOMInterpret { ids, deleteFromCache }) =
    makeEvent \k -> do
      me <- ids
      raiseId me scope
      u <- subscribe
        ( oneOf
            ( [ bang (unsafeElement di { id: me, parent, scope, tag })
              , unsafeSetAttribute parent scope di me atts
              ]
                <> maybe []
                  ( \p ->
                      [ bang
                          $ unsafeConnect di
                          $ { id: me, parent: p }
                      ]
                  )
                  parent
                <>
                  [ __internalDekuFlatten
                      { parent: Just me
                      , scope
                      , raiseId: \_ _ -> pure unit
                      }
                      di
                      children
                  ]
            )
        )
        k
      pure (k (deleteFromCache { id: me }) *> u)

globalPortal
  :: forall e n s m lock payload
   . Compare n Neg1 GT
  => Korok s m
  => Vect n (Domable e m lock payload)
  -> (Vect n (Domable e m lock payload) -> Domable e m lock payload)
  -> Domable e m lock payload
globalPortal v c = Bolson.Control.globalPortalComplexComplex
  portalFlatten
  { fromEltO1: coerce
  , fromEltO2: coerce
  , toElt: coerce
  , wrapElt: Bolson.Core.Element' <<< elementify "div" empty
  , giveNewParent: \a b _ -> (unwrap a).giveNewParent b
  , deleteFromCache: unwrap >>> _.deleteFromCache
  }
  v
  (lcmap (map (_ $ unit)) c)

portalFlatten
  :: forall e m payload lock
   . { dynamicElementRemoved ::
         DOMInterpret e m payload
         -> { id :: String, parent :: String, scope :: Bolson.Core.Scope }
         -> payload
     , dynamicElementInserted ::
         DOMInterpret e m payload
         -> { id :: String, parent :: String, scope :: Bolson.Core.Scope }
         -> payload
     , doLogic :: Int -> DOMInterpret e m payload -> String -> payload
     , ids :: DOMInterpret e m payload -> m String
     , toElt ::
         Node e m lock payload
         -> Bolson.Core.Element (DOMInterpret e m payload) m lock payload
     }
portalFlatten =
  { doLogic: \pos (DOMInterpret { sendToPos }) id -> sendToPos { id, pos }
  , ids: unwrap >>> _.ids
  , dynamicElementRemoved:
      \(DOMInterpret { removeChild }) { id, scope } -> do
        removeChild { id, scope }
  , dynamicElementInserted: \(DOMInterpret { addChild }) { id, parent } ->
      addChild { child: id, parent }
  , toElt: \(Node e) -> Bolson.Core.Element e
  }

portal
  :: forall e n s m lock0 payload
   . Compare n Neg1 GT
  => Korok s m
  => Vect n (Domable e m lock0 payload)
  -> ( forall lockfoo
        . Vect n (Domable e m lockfoo payload)
       -> (Domable e m lock0 payload -> Domable e m lockfoo payload)
       -> Domable e m lockfoo payload
     )
  -> Domable e m lock0 payload
portal a b = Bolson.Control.portalComplexComplex
  portalFlatten
  { fromEltO1: coerce
  , fromEltO2: coerce
  , toElt: coerce
  , wrapElt: Bolson.Core.Element' <<< elementify "div" empty
  , giveNewParent: \q r _ -> (unwrap q).giveNewParent r
  , deleteFromCache: unwrap >>> _.deleteFromCache
  }
  a
  (lcmap (map (_ $ unit)) (coerce b))

text
  :: forall e m lock payload
   . Monad m
  => AnEvent m String
  -> Domable e m lock payload
text txt = Bolson.Core.Element' $ Node go
  where
  go
    { parent
    , scope
    , raiseId
    }
    di@
      ( DOMInterpret
          { ids
          , deleteFromCache
          }
      ) =
    makeEvent \k -> do
      me <- ids
      raiseId me scope
      map ((*>) (k (deleteFromCache { id: me }))) $ subscribe
        ( oneOf
            ( [ bang (unsafeText di { id: me, parent, scope })
              , unsafeSetText di me txt
              ] <> case parent of
                Just p -> [ bang $ unsafeConnect di { id: me, parent: p } ]
                Nothing -> []
            )
        )
        k

text_ :: forall e m lock payload. Monad m => String -> Domable e m lock payload
text_ txt = text (bang txt)

deku
  :: forall e s m payload
   . Korok s m
  => e
  -> (forall lock. Domable e m lock payload)
  -> DOMInterpret e m payload
  -> AnEvent m payload
deku root children di@(DOMInterpret { ids, makeRoot }) = makeEvent \k -> do
  me <- ids
  subscribe
    ( oneOf
        [ bang (makeRoot { id: me, root })
        , __internalDekuFlatten
            { parent: Just me
            , scope: Bolson.Core.Local "rootScope"
            , raiseId: \_ _ -> pure unit
            }
            di
            (unsafeCoerce children)
        ]
    )
    k

data Stage = Begin | Middle | End

__internalDekuFlatten
  :: forall e s m lock payload
   . Korok s m
  => Bolson.Core.PSR m
  -> DOMInterpret e m payload
  -> Domable e m lock payload
  -> AnEvent m payload
__internalDekuFlatten = Bolson.Control.flatten
  portalFlatten

bus
  :: forall a b s m
   . Korok s m
  => Always (m Unit) (Effect Unit)
  => ((a -> Effect Unit) -> AnEvent m a -> b)
  -> AnEvent m b
bus f = FRP.Event.bus (lcmap (map (always :: m Unit -> Effect Unit)) f)

bussed
  :: forall e s m lock a payload
   . Korok s m
  => Always (m Unit) (Effect Unit)
  => ((a -> Effect Unit) -> AnEvent m a -> Domable e m lock payload)
  -> Domable e m lock payload
bussed f = envy (bus f)

vbussed
  :: forall s m lock rbus bus pushi pusho pushR event u e payload
   . RowToList bus rbus
  => Korok s m
  => RowToList pushi pushR
  => MapRecordWithIndex pushR
       (ConstMapping (AlwaysEffect m))
       pushi
       pusho
  => VBus rbus pushi event u
  => Proxy (V bus)
  -> ({ | pusho } -> { | event } -> Domable e m lock payload)
  -> Domable e m lock payload
vbussed px f = envy (vbus px (lcmap (halways (Proxy :: Proxy m)) f))
