module Deku.Core
  ( ANut(..)
  , AttributeParent
  , DOMInterpret(..)
  , DeleteFromCache
  , DisconnectElement
  , Domable(..)
  , GiveNewParent
  , MakeElement
  , MakeDynBeacon
  , MakePursx
  , MakeRoot
  , MakeText
  , RemoveDynBeacon
  , Node(..)
  , Nut
  , SendToPos
  , SetCb
  , SetProp
  , SetText
  , Domable'
  , bus
  , busUncurried
  , bussed
  , bussedUncurried
  , insert
  , insert_
  , remove
  , sendToPos
  , sendToTop
  , vbussed
  , vbussedUncurried
  , dyn
  , fixed
  , envy
  , unsafeSetPos
  ) where

import Prelude

import Bolson.Control as BControl
import Bolson.Core (Scope)
import Bolson.Core as Bolson
import Control.Monad.ST (ST)
import Control.Monad.ST.Global (Global)
import Control.Plus (empty)
import Data.Foldable (oneOf)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype, unwrap)
import Data.Profunctor (lcmap)
import Data.Tuple (curry)
import Data.Tuple.Nested (type (/\))
import Deku.Attribute (Cb)
import Effect (Effect)
import FRP.Event (Event, makeLemmingEvent)
import FRP.Event as FRP.Event
import FRP.Event.VBus (class VBus, V, vbus)
import Foreign.Object (Object)
import Prim.RowList (class RowToList)
import Safe.Coerce (coerce)
import Type.Proxy (Proxy)
import Web.DOM as Web.DOM

type Nut = forall lock payload. Domable lock payload

newtype ANut = ANut Nut

bus
  :: forall a b
   . ((a -> Effect Unit) -> Event a -> b)
  -> Event b
bus f = FRP.Event.bus f

busUncurried
  :: forall a b
   . (((a -> Effect Unit) /\ Event a) -> b)
  -> Event b
busUncurried = curry >>> bus

bussed
  :: forall lock obj a
   . ((a -> Effect Unit) -> Event a -> Domable obj lock)
  -> Domable obj lock
bussed f = Domable $ Bolson.EventfulElement'
  (Bolson.EventfulElement (coerce $ bus f))

bussedUncurried
  :: forall lock obj a
   . ( ((a -> Effect Unit) /\ Event a)
       -> Domable obj lock
     )
  -> Domable obj lock
bussedUncurried = curry >>> bussed

--

vbussed
  :: forall obj lock rbus bus push event
   . RowToList bus rbus
  => VBus rbus push event
  => Proxy (V bus)
  -> ({ | push } -> { | event } -> Domable obj lock)
  -> Domable obj lock
vbussed px f = Domable $ Bolson.EventfulElement'
  (Bolson.EventfulElement (coerce (vbus px f)))

vbussedUncurried
  :: forall obj lock rbus bus push event
   . RowToList bus rbus
  => VBus rbus push event
  => Proxy (V bus)
  -> (({ | push } /\ { | event }) -> Domable obj lock)
  -> Domable obj lock
vbussedUncurried px = curry >>> vbussed px

newtype Node (lock :: Type) payload = Node
  ( Bolson.PSR (pos :: Maybe Int, dynFamily :: Maybe String)
    -> DOMInterpret payload
    -> Event payload
  )

type Domable' lock payload = Bolson.Entity Int (Node lock payload) lock
newtype Domable lock payload = Domable (Domable' lock payload)

derive instance Newtype (Domable lock payload) _

instance Semigroup (Domable lock payload) where
  append a b = fixed [ a, b ]

instance Monoid (Domable lock payload) where
  mempty = Domable (Bolson.envy empty)

unsafeSetPos
  :: forall lock payload. Int -> Domable lock payload -> Domable lock payload
unsafeSetPos = Just >>> unsafeSetPos'

unsafeSetPos'
  :: forall lock payload. Maybe Int -> Domable lock payload -> Domable lock payload
unsafeSetPos' i (Domable e) = Domable (f e)
  where
  f = case _ of
    Bolson.Element' (Node e') -> Bolson.Element'
      (Node (lcmap (_ { pos = i }) e'))
    Bolson.EventfulElement' (Bolson.EventfulElement e') ->
      Bolson.EventfulElement' (Bolson.EventfulElement (map f e'))
    _ -> e

insert
  :: forall lock payload
   . Int
  -> Domable lock payload
  -> Bolson.Child Int (Node lock payload) lock
insert i e = Bolson.Insert (unwrap $ unsafeSetPos i e)

insert_
  :: forall lock payload
   . Domable lock payload
  -> Bolson.Child Int (Node lock payload) lock
insert_ d = Bolson.Insert (unwrap $ unsafeSetPos' Nothing d)

remove :: forall logic obj lock. Bolson.Child logic obj lock
remove = Bolson.Remove

sendToTop :: forall obj lock. Bolson.Child Int obj lock
sendToTop = Bolson.Logic 0

sendToPos :: forall obj lock. Int -> Bolson.Child Int obj lock
sendToPos = Bolson.Logic

type MakeElement =
  { id :: String
  , scope :: Scope
  , parent :: Maybe String
  , tag :: String
  , pos :: Maybe Int
  , dynFamily :: Maybe String
  }

type AttributeParent =
  { id :: String
  , parent :: String
  , pos :: Maybe Int
  , dynFamily :: Maybe String
  }

type GiveNewParent =
  { id :: String
  , parent :: String
  , scope :: Scope
  , pos :: Maybe Int
  , dynFamily :: Maybe String
  }

type DisconnectElement =
  { id :: String
  , parent :: String
  , scope :: Scope
  , scopeEq :: Scope -> Scope -> Boolean
  }

type MakeText =
  { id :: String
  , pos :: Maybe Int
  , scope :: Scope
  , parent :: Maybe String
  , dynFamily :: Maybe String
  }

type DeleteFromCache = { id :: String }
type MakeRoot = { id :: String, root :: Web.DOM.Element }
type SetText = { id :: String, text :: String }
type SetProp =
  { id :: String
  , key :: String
  , value :: String
  }

type SetCb =
  { id :: String
  , key :: String
  , value :: Cb
  }

type MakePursx =
  { id :: String
  , parent :: Maybe String
  , html :: String
  , scope :: Scope
  , pos :: Maybe Int
  , pxScope :: String
  , verb :: String
  , cache :: Object Boolean
  , dynFamily :: Maybe String
  }

type SendToPos =
  { id :: String
  , pos :: Int
  }

type RemoveDynBeacon = { id :: String }
type MakeDynBeacon =
  { id :: String
  , parent :: Maybe String
  , pos :: Maybe Int
  , scope :: Scope
  , dynFamily :: Maybe String
  }

derive instance Newtype (DOMInterpret payload) _

newtype DOMInterpret payload = DOMInterpret
  { ids :: ST Global String
  , makeRoot :: MakeRoot -> payload
  , makeElement :: MakeElement -> payload
  , makeDynBeacon :: MakeDynBeacon -> payload
  , attributeParent :: AttributeParent -> payload
  , makeText :: MakeText -> payload
  , makePursx :: MakePursx -> payload
  , giveNewParent :: GiveNewParent -> payload
  , disconnectElement :: DisconnectElement -> payload
  , deleteFromCache :: DeleteFromCache -> payload
  , sendToPos :: SendToPos -> payload
  , setProp :: SetProp -> payload
  , setCb :: SetCb -> payload
  , setText :: SetText -> payload
  , removeDynBeacon :: RemoveDynBeacon -> payload
  }

portalFlatten
  :: forall payload136 b143 d145 t149 t157 t159 lock166 lock170 payload171
   . Newtype b143
       { ids :: d145
       | t149
       }
  => { disconnectElement ::
         DOMInterpret t157
         -> { id :: String
            , parent :: String
            , scope :: Scope
            | t159
            }
         -> t157
     , doLogic :: Int -> DOMInterpret payload136 -> String -> payload136
     , ids :: b143 -> d145
     , toElt ::
         Node lock166 payload171
         -> Bolson.Element (DOMInterpret payload171)
              ( pos :: Maybe Int
              , dynFamily :: Maybe String
              )
              lock170
              payload171
     }
portalFlatten =
  { doLogic: \pos (DOMInterpret { sendToPos: stp }) id -> stp { id, pos }
  , ids: unwrap >>> _.ids
  , disconnectElement:
      \(DOMInterpret { disconnectElement }) { id, scope, parent } ->
        disconnectElement { id, scope, parent, scopeEq: eq }
  , toElt: \(Node e) -> Bolson.Element e
  }

__internalDekuFlatten
  :: forall lock payload
   . Bolson.PSR (pos :: Maybe Int, dynFamily :: Maybe String)
  -> DOMInterpret payload
  -> Domable lock payload
  -> Event payload
__internalDekuFlatten a b (Domable c) = BControl.flatten portalFlatten a b c

dynify
  :: forall i payload lock
   . (i -> Domable payload lock)
  -> i
  -> Domable payload lock
dynify f es = Domable $ Bolson.Element' (Node go)
  where
  go
    { parent, scope, raiseId, pos, dynFamily }
    di@(DOMInterpret { ids, makeDynBeacon, attributeParent, removeDynBeacon }) =
    makeLemmingEvent \mySub k -> do
      me <- ids
      raiseId me
      unsub <- mySub
        ( oneOf
            [ pure $ makeDynBeacon { id: me, parent, scope, dynFamily, pos }
            , maybe empty
                ( \p ->
                    pure $ attributeParent
                      { id: me, parent: p, pos, dynFamily }
                )
                parent
            , __internalDekuFlatten
                { parent
                , scope
                , raiseId: \_ -> pure unit
                -- clear the pos
                -- as we don't want the pointer's positional information
                -- trickling down to what the pointer points to
                -- the logic in Interpret.js will always give
                -- the correct positional information to what
                -- pointers point to
                , pos: Nothing
                , dynFamily: Just me
                }
                di
                (f es)
            ]
        )
        k
      pure do
        k (removeDynBeacon { id: me })
        unsub

dyn
  :: forall lock payload
   . Event (Event (Bolson.Child Int (Node lock payload) lock))
  -> Domable lock payload
dyn = dynify
  ( coerce
      ( Bolson.dyn
          :: Event (Event (Bolson.Child Int (Node lock payload) lock))
          -> Domable' lock payload
      )
  )

fixed
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
fixed = dynify
  ( coerce
      (Bolson.fixed :: Array (Domable' lock payload) -> Domable' lock payload)
  )

envy
  :: forall lock payload
   . Event (Domable lock payload)
  -> Domable lock payload
envy = dynify
  ( coerce
      (Bolson.envy :: Event (Domable' lock payload) -> Domable' lock payload)
  )