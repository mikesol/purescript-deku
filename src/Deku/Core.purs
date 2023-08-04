-- | This module contains the low-level functionality of Deku, including
-- | the primitive `Nut` type, which is the type of a Deku application.
-- | In general, this module is not intended to be used directly, with the
-- | exception of the `Nut` type signature and, when needed, the `Nut`
-- | type signature (for which `Nut` is an alias).
module Deku.Core
  ( ANut(..)
  , AttributeParent
  , AssociateWithUnsubscribe
  , DOMInterpret(..)
  , DekuExtra
  , DeleteFromCache
  , OneOffEffect
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
  , Node'
  , HeadNode'
  , NutF(..)
  , Child(..)
  , flattenArgs
  , remove
  , sendToPos
  , sendToTop
  , dyn
  , fixed
  , unsafeSetPos
  ) where

import Prelude

import Bolson.Control (Flatten)
import Bolson.Control as BControl
import Bolson.Core (Scope)
import Bolson.Core as Bolson
import Control.Monad.ST (ST)
import Control.Monad.ST as ST
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Global as Region
import Control.Monad.ST.Internal as STRef
import Control.Plus (empty)
import Data.Foldable (for_)
import Data.List (List)
import Data.List as List
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype, unwrap)
import Data.Profunctor (lcmap)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute (Cb)
import Effect (Effect)
import FRP.Behavior (behavior, sample)
import FRP.Event (Event, makeLemmingEvent)
import Foreign.Object (Object)
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

type DekuExtra = (pos :: Maybe Int, ez :: Boolean, dynFamily :: Maybe String)

type HeadNode' payload = Bolson.HeadElement' (DOMInterpret payload)
  payload

-- | For internal use in the `Nut` type signature. `Nut` uses `Bolson` under the
-- | hood, and this is used with `Bolson`'s `Entity` type.
type Node' payload = Bolson.Element' (DOMInterpret payload) DekuExtra payload

-- | For internal use in the `Nut` type signature. `Nut` uses `Bolson` under the
-- | hood, and this is used with `Bolson`'s `Entity` type.
newtype Node payload = Node
  ( Bolson.Element (DOMInterpret payload)
      (pos :: Maybe Int, ez :: Boolean, dynFamily :: Maybe String)
      payload
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
  mempty = Nut
    ( NutF
        ( Bolson.Element'
            (Node (Bolson.Element \_ _ -> behavior \_ -> empty))
        )
    )

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
      Bolson.Element' (Node (Bolson.Element e')) -> Bolson.Element'
        (Node (Bolson.Element (lcmap (_ { pos = i }) e')))
      -- we don't need to set the pos recursively down as
      -- dynify guarantees to wrap in an Element
      _ -> ii

newtype Child = Child (Bolson.Child Int)

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

type OneOffEffect = { effect :: Effect Unit }

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

type AssociateWithUnsubscribe =
  { id :: String, unsubscribe :: ST.ST Region.Global Unit }

derive instance Newtype (DOMInterpret payload) _

-- | This is the interpreter that any Deku backend creator needs to impelement.
-- | Three interpreters are included with Deku: SPA, SSR, and hydrated SSR.
-- | As an example, if you want to create a nullary interpreter that
-- | spits out `unit`, you can set everything to `mempty`.
newtype DOMInterpret payload = DOMInterpret
  { ids :: ST Global Int
  , deferPayload :: List Int -> payload -> payload
  , forcePayload :: List Int -> payload
  , redecorateDeferredPayload :: List Int -> payload -> payload
  , associateWithUnsubscribe :: AssociateWithUnsubscribe -> payload
  , oneOffEffect :: OneOffEffect -> payload
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

flattenArgs
  :: forall payload. Flatten Int (DOMInterpret payload) Node DekuExtra payload
flattenArgs =
  { doLogic: \pos (DOMInterpret { sendToPos: stp }) id -> stp { id, pos }
  , deferPayload: \(DOMInterpret { deferPayload }) -> deferPayload
  , forcePayload: \(DOMInterpret { forcePayload }) -> forcePayload
  , redecorateDeferredPayload: \(DOMInterpret { redecorateDeferredPayload }) ->
      redecorateDeferredPayload
  , ids: unwrap >>> _.ids
  , disconnectElement:
      \(DOMInterpret { disconnectElement }) { id, scope, parent } ->
        disconnectElement { id, scope, parent, scopeEq: eq }
  , toElt: \(Node e) -> e
  }

__internalDekuFlatten
  :: forall payload
   . NutF payload
  -> Node' payload
__internalDekuFlatten a b c = BControl.flatten flattenArgs ((\(NutF x) -> x) a)
  b
  c

dynify
  :: forall i
   . (i -> Nut)
  -> i
  -> Nut
dynify f es = Nut (go' ((\(Nut df) -> df) (f es)))
  where
  go' :: forall payload. NutF payload -> NutF payload
  go' x = NutF (Bolson.Element' (Node (Bolson.Element (go x))))

  go
    :: forall payload
     . NutF payload
    -> Node' payload
  go
    fes
    { parent, scope, raiseId, pos, dynFamily, ez }
    di@
      ( DOMInterpret
          { ids
          , makeElement
          , deferPayload
          , makeDynBeacon
          , attributeParent
          , removeDynBeacon
          }
      ) = behavior \e -> makeLemmingEvent \subscribe kx -> do
    urf <- STRef.new (pure unit)
    ugh <- subscribe e \ff -> do
      me <- ids
      raiseId $ show me
      -- `dyn`-s need to have a parent
      -- Tis is because we need to preserve the order of children and a parent is the cleanest way to do this.
      -- Then, we can call `childNodes` and `nextSibling`.
      -- In practice, they will almost always have a parent, but for portals they don't, so we create a dummy one that is not rendered.
      parentEvent /\ parentId <- case parent of
        Nothing -> do
          dummyParent <- ids
          pure
            ( [ makeElement
                  { id: show dummyParent
                  , parent: Nothing
                  , scope
                  , tag: "div"
                  , pos: Nothing
                  , dynFamily: Nothing
                  }

              ] /\ show dummyParent
            )
        Just x -> pure ([] /\ x)
      let
        evt = sample
          ( __internalDekuFlatten fes
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
              , dynFamily: Just $ show me
              }
              di
          )
          e
      uu <- subscribe evt kx
      void $ STRef.modify (_ *> uu) urf
      for_
        ( parentEvent
            <>
              [ makeDynBeacon
                  { id: show me
                  , parent: Just parentId
                  , scope
                  , dynFamily
                  , pos
                  }
              , attributeParent
                  { id: show me, parent: parentId, pos, dynFamily, ez }
              ]
        )
        (kx <<< ff)
      for_ [ deferPayload (List.Nil) (removeDynBeacon { id: show me }) ]
        (kx <<< ff)
    pure do
      ugh
      join (STRef.read urf)

-- | This function is used along with `useDyn` to create dynamic collections of elements, like todo items in a todo mvc app.
-- | See [**Dynamic components**](https://purescript-deku.netlify.app/core-concepts/collections#dynamic-components) in the Deku guide for more information.
dyn
  :: (Event (Tuple (Event Child) Nut))
  -> Nut
dyn = dynify myDyn
  where
  bolsonify
    :: forall payload
     . Tuple (Event Child) Nut
    -> Tuple (Event (Bolson.Child Int)) (Bolson.Entity Int (Node payload))
  bolsonify (Tuple child (Nut nut)) = Tuple (map (\(Child x) -> x) child)
    ((\(NutF n) -> n) nut)

  myDyn
    :: (Event (Tuple (Event Child) Nut))
    -> Nut
  myDyn e = Nut
    (myDyn' (map bolsonify e))

  myDyn'
    :: forall payload
     . ( Event
             ( Tuple (Event (Bolson.Child Int))
                 (Bolson.Entity Int (Node payload))
             )
         )
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
