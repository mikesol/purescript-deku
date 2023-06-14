-- | This module contains the low-level functionality of Deku, including
-- | the primitive `Nut` type, which is the type of a Deku application.
-- | In general, this module is not intended to be used directly, with the
-- | exception of the `Nut` type signature and, when needed, the `Nut`
-- | type signature (for which `Nut` is an alias).
module Deku.Core
  ( ANut(..)
  , AttributeParent
  , DOMInterpret(..)
  , DeleteFromCache
  , DisconnectElement
  , GiveNewParent
  , MakeElement
  , MakeDynBeacon
  , MakePursx
  , MakeRoot
  , MakeText
  , RemoveDynBeacon
  , Node(..)
  , Nut(..)
  , Hook
  , NutWith
  , SendToPos
  , SetCb
  , SetProp
  , UnsetAttribute
  , SetText
  , Nut'
  , NutF(..)
  , Child(..)
  , bus
  , busUncurried
  , bussed
  , bussedUncurried
  , vbussed
  , vbussedUncurried
  , insert
  , insert_
  , remove
  , sendToPos
  , sendToTop
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
import Control.Monad.ST as ST
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Global as Region
import Control.Monad.ST.Uncurried (mkSTFn2, runSTFn1, runSTFn2)
import Control.Plus (empty)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype, unwrap)
import Data.Profunctor (lcmap)
import Data.Tuple (curry)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Attribute (Cb)
import Effect (Effect)
import FRP.Event (Event, Subscriber(..), merge, makeLemmingEventO)
import FRP.Event as FRP.Event
import FRP.Event.VBus (class VBus, V, vbus)
import Foreign.Object (Object)
import Prim.RowList (class RowToList)
import Safe.Coerce (coerce)
import Type.Proxy (Proxy)
import Web.DOM as Web.DOM

-- | The signature of a custom Deku hook. This works when `payload` variables
-- | don't need to be used explicitly. When using these variables explicitly, opt for using
-- | `Nut` directly (meaning write out the definition by hand).
type Hook a = (a -> Nut) -> Nut

-- | A helper for using `Nut` with an environment.
type NutWith env = env -> Nut

-- | A helper for when you need to use `Nut` as a fully saturated type.
-- | This is the same as using [`Exists`](https://github.com/purescript/purescript-exists)
-- | twice on `Nut`.
newtype ANut = ANut Nut

-- | For internal use only in deku's hooks. See `Deku.Hooks` for more information.
bus
  :: forall a b
   . ((a -> Effect Unit) -> Event a -> b)
  -> Event b
bus f = FRP.Event.bus f

-- | For internal use only in deku's hooks. See `Deku.Hooks` for more information.
busUncurried
  :: forall a b
   . (((a -> Effect Unit) /\ Event a) -> b)
  -> Event b
busUncurried = curry >>> bus

-- | For internal use only in deku's hooks. See `Deku.Hooks` for more information.
bussed
  :: forall a
   . ((a -> Effect Unit) -> Event a -> Nut)
  -> Nut
bussed f = Nut (z (map (\(Nut i) -> i) g))
  where
  g :: Event Nut
  g = bus f

  z :: forall payload. Event (NutF payload) -> NutF payload
  z x = NutF
    ( Bolson.EventfulElement'
        (Bolson.EventfulElement (coerce x))
    )

-- | For internal use only in deku's hooks. See `Deku.Hooks` for more information.
bussedUncurried
  :: forall a
   . ( ((a -> Effect Unit) /\ Event a)
       -> Nut
     )
  -> Nut
bussedUncurried = curry >>> bussed

vbussed
  :: forall rbus bus push event
   . RowToList bus rbus
  => VBus rbus push event
  => Proxy (V bus)
  -> ({ | push } -> { | event } -> Nut)
  -> Nut
vbussed px f = Nut
  ( NutF
      ( Bolson.EventfulElement'
          (Bolson.EventfulElement gooo)
      )
  )
  where
  go :: Event Nut
  go = vbus px f

  goo :: forall payload. Event (NutF payload)
  goo = map (\(Nut nf) -> nf) go

  gooo :: forall payload. Event (Bolson.Entity Int (Node payload))
  gooo = map (\(NutF e) -> e) goo

-- | For internal use only in deku's hooks. See `Deku.Hooks` for more information.
vbussedUncurried
  :: forall rbus bus push event
   . RowToList bus rbus
  => VBus rbus push event
  => Proxy (V bus)
  -> (({ | push } /\ { | event }) -> Nut)
  -> Nut
vbussedUncurried px = curry >>> vbussed px

-- | For internal use in the `Nut` type signature. `Nut` uses `Bolson` under the
-- | hood, and this is used with `Bolson`'s `Entity` type.
newtype Node payload = Node
  ( Bolson.PSR (pos :: Maybe Int, ez :: Boolean, dynFamily :: Maybe String)
    -> DOMInterpret payload
    -> Event payload
  )

-- | For internal use in the construction of Nut.
type Nut' payload = Bolson.Entity Int (Node payload)

-- | _The_ type that represents a Deku application. To be used when `Nut` doesn't cut it
-- | (for example, when different locks need to be used because of the use of portals).
newtype NutF payload = NutF (Nut' payload)

derive instance Newtype (NutF payload) _
newtype Nut = Nut (forall payload. NutF payload)

instance Semigroup Nut where
  append a b = fixed [ a, b ]

instance Monoid Nut where
  mempty = Nut (NutF (Bolson.envy empty))

-- | For internal use only in deku's hooks. See `useDyn` in `Deku.Hooks` for more information.
unsafeSetPos
  :: Int -> Nut -> Nut
unsafeSetPos = Just >>> unsafeSetPos'

unsafeSetPos'
  :: Maybe Int
  -> Nut
  -> Nut
unsafeSetPos' i (Nut df) = Nut (g df)
  where
  g :: forall payload. NutF payload -> NutF payload
  g (NutF e) = (NutF (f e))
    where
    f
      :: Bolson.Entity Int (Node payload)
      -> Bolson.Entity Int (Node payload)
    f ii = case ii of
      Bolson.Element' (Node e') -> Bolson.Element'
        (Node (lcmap (_ { pos = i }) e'))
      Bolson.EventfulElement' (Bolson.EventfulElement e') ->
        Bolson.EventfulElement' (Bolson.EventfulElement (map f e'))
      _ -> ii

newtype Child = Child (forall payload. Bolson.Child Int (Node payload))

-- | For internal use only in deku's hooks. See `useDyn` in `Deku.Hooks` for more information.
insert
  :: Int
  -> Nut
  -> Child
insert i x = Child (f ((\(Nut z) -> z) b))
  where
  b :: Nut
  b = unsafeSetPos i x

  f :: forall payload. NutF payload -> Bolson.Child Int (Node payload)
  f (NutF d) = Bolson.Insert d

insert_
  :: Nut
  -> Child
insert_ x = Child (f ((\(Nut z) -> z) b))
  where
  b :: Nut
  b = unsafeSetPos' Nothing x

  f :: forall payload. NutF payload -> Bolson.Child Int (Node payload)
  f (NutF d) = Bolson.Insert d

-- | For internal use only in deku's hooks. See `useDyn` in `Deku.Hooks` for more information.
remove :: Child
remove = Child Bolson.Remove

-- | For internal use only in deku's hooks. See `useDyn` in `Deku.Hooks` for more information.
sendToTop :: Child
sendToTop = Child (Bolson.Logic 0)

-- | For internal use only in deku's hooks. See `useDyn` in `Deku.Hooks` for more information.
sendToPos :: Int -> Child
sendToPos i = Child (Bolson.Logic i)

-- | Type used by Deku backends to create an element. For internal use only unless you're writing a custom backend.
type MakeElement =
  { id :: String
  , scope :: Scope
  , parent :: Maybe String
  , tag :: String
  , pos :: Maybe Int
  , dynFamily :: Maybe String
  }

-- | Type used by Deku backends to give a parent to an element. For internal use only unless you're writing a custom backend.
type AttributeParent =
  { id :: String
  , parent :: String
  , pos :: Maybe Int
  , dynFamily :: Maybe String
  , ez :: Boolean
  }

-- | Type used by Deku backends to set give an element a new parent. For internal use only unless you're writing a custom backend.
type GiveNewParent payload =
  { id :: String
  , parent :: String
  , ez :: Boolean -- ez is ignored, but it's easier to have in the type to appease the compiler
  , scope :: Scope
  , pos :: Maybe Int
  , dynFamily :: Maybe String
  , ctor :: NutF payload
  , raiseId :: String -> ST.ST Region.Global Unit
  }

-- | Type used by Deku backends to disconnect an element from the DOM. For internal use only unless you're writing a custom backend.
type DisconnectElement =
  { id :: String
  , parent :: String
  , scope :: Scope
  , scopeEq :: Scope -> Scope -> Boolean
  }

-- | Type used by Deku backends to construct a text element. For internal use only unless you're writing a custom backend.
type MakeText =
  { id :: String
  , pos :: Maybe Int
  , scope :: Scope
  , parent :: Maybe String
  , dynFamily :: Maybe String
  }

-- | Type used by Deku backends to delete an element from the Deku cache. For internal use only unless you're writing a custom backend.
type DeleteFromCache = { id :: String }

-- | Type used by Deku backends to set the Deku root element (usually the body). For internal use only unless you're writing a custom backend.
type MakeRoot = { id :: String, root :: Web.DOM.Element }

-- | Type used by Deku backends to set the text of a text element. For internal use only unless you're writing a custom backend.
type SetText = { id :: String, text :: String }

-- | Type used by Deku backends to unset an attribute. For internal use only unless you're writing a custom backend.
type UnsetAttribute =
  { id :: String
  , key :: String
  }

-- | Type used by Deku backends to set an attribute. For internal use only unless you're writing a custom backend.
type SetProp =
  { id :: String
  , key :: String
  , value :: String
  }

-- | Type used by Deku backends to set a listener. For internal use only unless you're writing a custom backend.
type SetCb =
  { id :: String
  , key :: String
  , value :: Cb
  }

-- | Type used by Deku backends to make pursx. For internal use only unless you're writing a custom backend.
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

-- | Type used by Deku backends to send an element to a position in a dynamic construct like a list. For internal use only unless you're writing a custom backend.
type SendToPos =
  { id :: String
  , pos :: Int
  }

-- | Type used by Deku backends to remove a beacon signaling the beginning or end of a dynamic construct. For internal use only unless you're writing a custom backend.
type RemoveDynBeacon = { id :: String }

-- | Type used by Deku backends to make a beacon signaling the beginning or end of a dynamic construct. For internal use only unless you're writing a custom backend.
type MakeDynBeacon =
  { id :: String
  , parent :: Maybe String
  , pos :: Maybe Int
  , scope :: Scope
  , dynFamily :: Maybe String
  }

derive instance Newtype (DOMInterpret payload) _

-- | This is the interpreter that any Deku backend creator needs to impelement.
-- | Three interpreters are included with Deku: SPA, SSR, and hydrated SSR.
-- | As an example, if you want to create a nullary interpreter that
-- | spits out `unit`, you can set everything to `mempty`.
newtype DOMInterpret payload = DOMInterpret
  { ids :: ST Global String
  , makeRoot :: MakeRoot -> payload
  , makeElement :: MakeElement -> payload
  , makeDynBeacon :: MakeDynBeacon -> payload
  , attributeParent :: AttributeParent -> payload
  , makeText :: MakeText -> payload
  , makePursx :: MakePursx -> payload
  , giveNewParent :: GiveNewParent payload -> payload
  , disconnectElement :: DisconnectElement -> payload
  , deleteFromCache :: DeleteFromCache -> payload
  , sendToPos :: SendToPos -> payload
  , setProp :: SetProp -> payload
  , setCb :: SetCb -> payload
  , unsetAttribute :: UnsetAttribute -> payload
  , setText :: SetText -> payload
  , removeDynBeacon :: RemoveDynBeacon -> payload
  }

newtype ExDOMInterpret = ExDOMInterpret (forall payload. DOMInterpret payload)
newtype ExEvent = ExEvent (forall payload. Event payload)

portalFlatten
  :: forall payload136 b143 d145 t149 t157 t159 payload171
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
         Node payload171
         -> Bolson.Element (DOMInterpret payload171)
              ( pos :: Maybe Int
              , dynFamily :: Maybe String
              , ez :: Boolean
              )
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
  :: forall payload
   . Bolson.PSR (pos :: Maybe Int, ez :: Boolean, dynFamily :: Maybe String)
  -> DOMInterpret payload
  -> NutF payload
  -> Event payload
__internalDekuFlatten a b c = BControl.flatten portalFlatten a b
  ((\(NutF x) -> x) c)

dynify
  :: forall i
   . (i -> Nut)
  -> i
  -> Nut
dynify f es = Nut (go' ((\(Nut df) -> df) (f es)))
  where
  go' :: forall payload. NutF payload -> NutF payload
  go' x = NutF (Bolson.Element' (Node (go x)))

  go
    :: forall payload
     . NutF payload
    -> Bolson.PSR (pos :: Maybe Int, ez :: Boolean, dynFamily :: Maybe String)
    -> DOMInterpret payload
    -> Event payload
  go
    fes
    { parent, scope, raiseId, pos, dynFamily, ez }
    di@
      ( DOMInterpret
          { ids, makeElement, makeDynBeacon, attributeParent, removeDynBeacon }
      ) =
    makeLemmingEventO
      ( mkSTFn2 \(Subscriber mySub) k -> do
          me <- ids
          raiseId me
          -- `dyn`-s need to have a parent
          -- Tis is because we need to preserve the order of children and a parent is the cleanest way to do this.
          -- Then, we can call `childNodes` and `nextSibling`.
          -- In practice, they will almost always have a parent, but for portals they don't, so we create a dummy one that is not rendered.
          parentEvent /\ parentId <- case parent of
            Nothing -> do
              dummyParent <- ids
              pure
                ( ( pure
                      ( makeElement
                          { id: dummyParent
                          , parent: Nothing
                          , scope
                          , tag: "div"
                          , pos: Nothing
                          , dynFamily: Nothing
                          }
                      )
                  ) /\ dummyParent
                )
            Just x -> pure (empty /\ x)
          unsub <- runSTFn2 mySub
            ( merge
                [ parentEvent
                , pure $ makeDynBeacon
                    { id: me, parent: Just parentId, scope, dynFamily, pos }
                , pure $ attributeParent
                    { id: me, parent: parentId, pos, dynFamily, ez }
                , ( __internalDekuFlatten
                      { parent: Just parentId
                      , scope
                      , ez: false
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
                      fes
                  )
                ]
            )
            k
          pure do
            runSTFn1 k (removeDynBeacon { id: me })
            unsub
      )

-- | This function is used along with `useDyn` to create dynamic collections of elements, like todo items in a todo mvc app.
-- | See [**Dynamic components**](https://purescript-deku.netlify.app/core-concepts/collections#dynamic-components) in the Deku guide for more information.
dyn
  :: Event (Event Child)
  -> Nut
dyn = dynify myDyn
  where
  myDyn :: Event (Event Child) -> Nut
  myDyn e = Nut (myDyn' ((map <<< map) (\(Child c) -> c) e))

  myDyn'
    :: forall payload
     . Event (Event (Bolson.Child Int (Node payload)))
    -> NutF payload
  myDyn' x = NutF (Bolson.dyn x)

-- | Once upon a time, this function was used to create a list of `Nut`-s that are merged
-- | together. Now, as `Nut` is a `Monoid`, you can use `fold` instead.
fixed
  :: Array Nut
  -> Nut
fixed = dynify myFixed
  where
  myFixed :: Array Nut -> Nut
  myFixed e = Nut (myFixed' (map (\(Nut c) -> c) e))

  myFixed'
    :: forall payload
     . Array (NutF payload)
    -> NutF payload
  myFixed' x = NutF (Bolson.fixed (map (\(NutF y) -> y) x))

-- dynify
--   ( coerce
--       (Bolson.fixed :: Array (Nut' payload) -> Nut' payload)
--   )

-- | Once upon a time, this function was used to emit arbitrary `Nut`-s using an event.
-- | Nowadays, its use is discouraged as there are other patterns in place to emit Nuts, like
-- | for example `switcher`. It is left in the library for backwards compatibility, but will
-- | likely be deprecated, and then all traces of it will be purged, and then people will be forced to study
-- | a revisionist history of the library that denies it ever existed.
envy
  :: Event Nut
  -> Nut
envy = dynify myEnvy
  where
  myEnvy :: Event Nut -> Nut
  myEnvy e = Nut (myEnvy' (map (\(Nut c) -> c) e))

  myEnvy'
    :: forall payload
     . Event (NutF payload)
    -> NutF payload
  myEnvy' x = NutF (Bolson.envy (map (\(NutF y) -> y) x))
