-- | This module contains various control structures for things like 
-- | switching between elements, creating portals allowing elements to fly around
-- | the DOM, and basic text creation. It also has several internal functions used for
-- | DOM element creation.
module Deku.Control
  ( (<#~>)
  , (<$~>)
  , blank
  , deku
  , elementify2
  , toDeku
  , globalPortal
  , globalPortal1
  , guard
  , portal
  , portal1
  , switcher
  , switcherFlipped
  , text
  , text_
  ) where

import Prelude

import Bolson.Control as Bolson
import Bolson.Core (Element(..), Entity(..), PSR, Scope(..))
import Bolson.Core as BCore
import Control.Alt ((<|>))
import Control.Monad.ST.Uncurried (mkSTFn2, runSTFn1, runSTFn2)
import Control.Plus (empty)
import Data.FastVect.FastVect (Vect, singleton, index)
import Data.Filterable (filter)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype, unwrap, wrap)
import Data.Profunctor (dimap, lcmap)
import Data.Tuple (snd)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (Attribute, AttributeValue(..), unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Domable(..), DomableF(..), Node(..), Nut, unsafeSetPos, dyn, envy, insert_, remove)
import FRP.Event (Event, Subscriber(..), merge, keepLatest, makeLemmingEventO, mapAccum, memoize)
import Prim.Int (class Compare)
import Prim.Ordering (GT)
import Record (union)
import Safe.Coerce (coerce)
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM as Web.DOM

type Neg1 = -1

----

unsafeSetText
  :: forall payload
   . DOMInterpret payload
  -> String
  -> Event String
  -> Event payload
unsafeSetText (DOMInterpret { setText }) id txt = map
  (setText <<< { id, text: _ })
  txt

unsafeSetAttribute
  :: forall element payload
   . DOMInterpret payload
  -> String
  -> Event (Attribute element)
  -> Event payload
unsafeSetAttribute (DOMInterpret { setProp, setCb, unsetAttribute }) id atts =
  map
    ( ( \{ key, value } -> case value of
          Prop' s -> setProp { id, key, value: s }
          Cb' c -> setCb { id, key, value: c }
          Unset' -> unsetAttribute { id, key }
      ) <<<
        unsafeUnAttribute
    )
    (atts)

-- | Used internally to create new [`Element`-s](https://developer.mozilla.org/en-US/docs/Web/API/Element).
-- | Do not use this directly. Instead, use `unsafeCustomElement` from `Deku.DOM`.
elementify2
  :: forall element
   . String
  -> Event (Attribute element)
  -> Array Domable
  -> Domable
elementify2 en attributes kids = Domable
  (step1 (mapWithIndex ((map <<< map) (\(Domable df) -> df) unsafeSetPos) kids))
  where
  step1 :: forall payload. Array (DomableF payload) -> DomableF payload
  step1 arr = DomableF
    ( Element'
        ( elementify en attributes
            ( DomableF (BCore.fixed (coerce arr))
            )
        )
    )

elementify
  :: forall payload element
   . String
  -> Event (Attribute element)
  -> DomableF payload
  -> Node payload
elementify tag atts children = Node go
  where
  go
    { parent, scope, raiseId, pos, dynFamily, ez }
    di@(DOMInterpret { ids, deleteFromCache, makeElement, attributeParent }) =
    makeLemmingEventO $ mkSTFn2 \(Subscriber mySub) k -> do
      me <- ids
      raiseId me
      unsub <- runSTFn2 mySub
        ( ( merge
              ( [ pure
                    ( makeElement
                        { id: me, parent, scope, tag, pos, dynFamily }
                    )
                , unsafeSetAttribute di me atts
                ] <> maybe []
                  ( \p ->
                      [ pure $ attributeParent
                          { id: me, parent: p, pos, dynFamily, ez }
                      ]
                  )
                  parent
              )
          )
            <|> __internalDekuFlatten
              { parent: Just me
              , scope
              , ez: true
              , raiseId: \_ -> pure unit
              , pos: Nothing
              , dynFamily: Nothing
              }
              di
              children
        )
        k
      pure do
        runSTFn1 k (deleteFromCache { id: me })
        unsub

-- | Creates a portal.
-- |
-- | Portals allow HTML elements to jump from one part of a page to another without being
-- | torn down and recreated. This is useful for things like in-progress videos that are removed
-- | from the top of the page and inset into a corner when you start scrolling (this is common on
-- | educational websites like three.js journey).
-- |
-- | The first argument is a vector of elements that will be used as the portal's "source".
-- | The second argument is a closure into which the vector is injected. The closure may use the
-- | elements in the vector however it wants, but it must return a single element.
-- | As the DOM cannot show a single element in multiple places, the portal will only show the
-- | most recent emission of the element.
-- |
-- | Global portals have a global scope, meaning that their elements will persist for the lifetime
-- | of a Deku application. In practice, you can have tens of thousands of global portals before
-- | garbage collection starts to be an issue.
-- |
-- | For examples of portals in use, see the
-- | [portals section](https://purescript-deku.netlify.app/core-concepts/portals) of the Deku guide.
globalPortal
  :: forall n
   . Compare n Neg1 GT
  => Vect n Domable
  -> (Vect n Domable -> Domable)
  -> Domable
globalPortal v' c' = Domable
  ( go (map (\(Domable df) -> df) v')
      (unsafeCoerce c')
  )
  where
  go
    :: forall payload
     . Vect n (DomableF payload)
    -> (Vect n (DomableF payload) -> DomableF payload)
    -> DomableF payload
  go v c = DomableF
    ( Bolson.globalPortalComplexComplex
        portalFlatten
        { fromEltO1: coerce
        , fromEltO2: coerce
        , toElt: coerce
        -- stuck here
        -- coerce won't work
        , wrapElt: \i -> Element' ((elementify "div" empty (coerce i)))
        , giveNewParent: \a b ctor _ -> (unwrap a).giveNewParent
            (b `union` { ctor: coerce ctor })
        , deleteFromCache: unwrap >>> _.deleteFromCache
        }
        (map unwrap v)
        (dimap (map ((_ $ unit) >>> wrap)) unwrap c)
    )

-- | A variation of global portal that takes a single element instead of a vector of elements.
globalPortal1
  :: Domable
  -> (Domable -> Domable)
  -> Domable
globalPortal1 i f = globalPortal (singleton i) (lcmap (index (Proxy :: _ 0)) f)

-- ugh, this isn't sacred, delete it and regenerate if something changes
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
         -> Element (DOMInterpret payload171)
              ( pos :: Maybe Int
              , dynFamily :: Maybe String
              , ez :: Boolean
              )
              payload171
     }
portalFlatten =
  { doLogic: \pos (DOMInterpret { sendToPos }) id -> sendToPos { id, pos }
  , ids: unwrap >>> _.ids
  , disconnectElement:
      \(DOMInterpret { disconnectElement }) { id, scope, parent } ->
        disconnectElement { id, scope, parent, scopeEq: eq }
  , toElt: \(Node e) -> Element e
  }

-- | A variation of portal that takes a single element instead of a vector of elements.
portal1
  :: Domable
  -> ( Domable
       -> Domable
     )
  -> Domable
portal1 i f = portal (singleton i) (lcmap ((index (Proxy :: _ 0))) f)

-- | Creates a portal.
-- |
-- | Portals allow HTML elements to jump from one part of a page to another without being
-- | torn down and recreated. This is useful for things like in-progress videos that are removed
-- | from the top of the page and inset into a corner when you start scrolling (this is common on
-- | educational websites like three.js journey).
-- |
-- | The first argument is a vector of elements that will be used as the portal's "source".
-- | The second argument is a closure into which the vector is injected. The closure may use the
-- | elements in the vector however it wants, but it must return a single element.
-- | As the DOM cannot show a single element in multiple places, the portal will only show the
-- | most recent emission of the element.
-- |
-- | Portals have a local scope, meaning that they can only be used inside their closure.
-- | This is enforced by the `lock` type variable. Local portals are necessary when you are creating
-- | hundreds of thousands of elements, in which case garbage collection and memory management
-- | start to be an issue any you will need for them to be destroyed when their enclosing scope
-- | is destroyed. This comes at the cost, however, of a slightly less ergonomic syntax.
-- |
-- | For examples of portals in use, see the
-- | [portals section](https://purescript-deku.netlify.app/core-concepts/portals) of the Deku guide.
portal
  :: forall n
   . Compare n Neg1 GT
  => Vect n Domable
  -> (Vect n Domable -> Domable)
  -> Domable
portal v' c' = Domable
  ( go (map (\(Domable df) -> df) v')
      (unsafeCoerce c')
  )
  where
  go
    :: forall payload
     . Vect n (DomableF payload)
    -> (Vect n (DomableF payload) -> DomableF payload)
    -> DomableF payload
  go v c = DomableF
    ( Bolson.portalComplexComplex
        portalFlatten
        { fromEltO1: coerce
        , fromEltO2: coerce
        , toElt: coerce
        -- stuck here
        -- coerce won't work
        , wrapElt: \i -> Element' ((elementify "div" empty (coerce i)))
        , giveNewParent: \a b ctor _ -> (unwrap a).giveNewParent
            (b `union` { ctor: coerce ctor })
        , deleteFromCache: unwrap >>> _.deleteFromCache
        }
        (map unwrap v)
        (dimap (map ((_ $ unit) >>> wrap)) unwrap c)
    )

-- Domable $ Bolson.portalComplexComplex
--   portalFlatten
--   { fromEltO1: coerce
--   , fromEltO2: coerce
--   , toElt: coerce
--   , wrapElt: \i -> Element' (elementify "div" empty (wrap i))
--   , giveNewParent: \x y ctor _ -> (unwrap x).giveNewParent
--       (y `union` { ctor: coerce ctor })
--   , deleteFromCache: unwrap >>> _.deleteFromCache
--   }
--   (map unwrap a)
--   (dimap (map ((_ $ unit) >>> wrap)) unwrap c)

-- | Create a [`Text`](https://developer.mozilla.org/en-US/docs/Web/API/Text) node from
-- | the emitted strings. Each emitted string replaces the previous string.
text
  :: Event String
  -> Domable
text txt = Domable go'
  where
  go' :: forall payload. DomableF payload
  go' = DomableF (Element' (Node go))

  go
    :: forall payload
     . PSR (pos :: Maybe Int, ez :: Boolean, dynFamily :: Maybe String)
    -> DOMInterpret payload
    -> Event payload
  go
    { parent, scope, raiseId, dynFamily, pos, ez }
    di@(DOMInterpret { ids, makeText, deleteFromCache, attributeParent }) =
    makeLemmingEventO $ mkSTFn2 \(Subscriber mySub) k -> do
      me <- ids
      raiseId me
      unsub <- runSTFn2 mySub
        ( merge
            [ pure (makeText { id: me, parent, pos, scope, dynFamily })
            , unsafeSetText di me txt
            , maybe empty
                ( \p ->
                    pure $ attributeParent
                      { id: me, parent: p, pos, dynFamily, ez }
                )
                parent
            ]
        )
        k
      pure do
        runSTFn1 k (deleteFromCache { id: me })
        unsub

-- | Create a [`Text`](https://developer.mozilla.org/en-US/docs/Web/API/Text) node from
-- | a string. The node is set immediately with the string and does not change.
text_ :: String -> Domable
text_ txt = text (pure txt)

-- | A low-level function that creates a Deku application.
-- | In most situations this should not be used. Instead, use functions from `Deku.Toplevel`.
deku
  :: Web.DOM.Element
  -> Domable
  -> ( forall payload
        . DOMInterpret payload
       -> Event payload
     )
deku root (Domable cc) = go cc
  where
  go
    :: forall payload
     . DomableF payload
    -> DOMInterpret payload
    -> Event payload
  go children di@(DOMInterpret { makeRoot }) = makeLemmingEventO $ mkSTFn2
    \(Subscriber mySub) k -> do
      let me = "deku-root" -- <- ids
      runSTFn2 mySub
        ( pure (makeRoot { id: me, root })
            <|> __internalDekuFlatten
              { parent: Just me
              , scope: Local "rootScope"
              , raiseId: \_ -> pure unit
              , ez: true
              , pos: Nothing
              , dynFamily: Nothing
              }
              di
              children
        )
        k

data Stage = Begin | Middle | End

__internalDekuFlatten
  :: forall payload
   . PSR (pos :: Maybe Int, ez :: Boolean, dynFamily :: Maybe String)
  -> DOMInterpret payload
  -> DomableF payload
  -> Event payload
__internalDekuFlatten a b (DomableF c) = Bolson.flatten portalFlatten a b c

-- | Like `bindFlipped`, except instead of working with a monad, it dipts into an `Event`
-- | and creates a `Domable`. This allows you to use an event to switch between different
-- | bits of DOM. This is how a [Virtual DOM](https://en.wikipedia.org/wiki/Virtual_DOM) works
-- | in its most basic, unoptimized form. As a result, `switcher`, while convenient, is inefficient
-- | and should be used when the content needs to be replaced wholesale. For a more efficient
-- | approach, see the `useDyn` hook.
switcher
  :: forall a
   . (a -> Domable)
  -> Event a
  -> Domable
switcher f event = dyn $ keepLatest
  $ memoize (counter event) \cenv -> map
      ( \(p /\ n) -> merge
          [ ((const remove) <$> filter (eq (n + 1) <<< snd) cenv)
          , pure (insert_ $ coerce (f p))
          ]
      )
      cenv
  where
  counter = mapAccum fn 0
    where
    fn a b = (a + 1) /\ (b /\ a)

infixl 4 switcher as <$~>

-- | A flipped version of `switcher`.
switcherFlipped
  :: forall a
   . Event a
  -> (a -> Domable)
  -> Domable
switcherFlipped = flip switcher

infixl 1 switcherFlipped as <#~>

-- | Inserts the Deku Nut when an event emits `true`, otherwise destroys the element.
guard
  :: Event Boolean
  -> Domable
  -> Domable
guard eb d = switcher
  (if _ then d else blank)
  eb

-- | An empty domable. `mempty` also works.
blank :: Nut
blank = mempty

toDeku :: forall a. (a -> Event Domable) -> a -> Domable
toDeku = compose envy