-- | This module contains various control structures for things like 
-- | switching between elements, creating portals allowing elements to fly around
-- | the DOM, and basic text creation. It also has several internal functions used for
-- | DOM element creation.
module Deku.Control
  ( deku
  , unsafeSetAttribute
  , elementify2
  , globalPortal
  , globalPortal1
  , portal
  , portal1
  , text
  , text_
  , text'
  , textUsing'
  , textShow'
  ) where

import Prelude

import Bolson.Control as Bolson
import Bolson.Core (Element(..), Entity(..), Scope(..))
import Bolson.Core as BCore
import Control.Plus (empty)
import Data.FastVect.FastVect (Vect, singleton, index)
import Data.Foldable (foldl)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (unwrap, wrap)
import Data.NonEmpty (NonEmpty(..))
import Data.Profunctor (dimap, lcmap)
import Data.These (These(..))
import Data.Tuple (Tuple(..))
import Deku.Attribute (Attribute, Attribute', AttributeValue(..), unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), HeadNode', Node(..), Node', Nut(..), NutF(..), dyn, flattenArgs, unsafeSetPos)
import FRP.Event (Event, merge)
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
  -> String
  -> payload
unsafeSetText (DOMInterpret { setText }) id txt =
  (setText <<< { id, text: _ })
    txt

unsafeSetAttribute
  :: forall payload
   . DOMInterpret payload
  -> String
  -> Attribute'
  -> payload
unsafeSetAttribute
  (DOMInterpret { setProp, setCb, unsetAttribute })
  id
  { key, value } =
  case value of
    Prop' s -> setProp { id, key, value: s }
    Cb' c -> setCb { id, key, value: c }
    Unset' -> unsetAttribute { id, key }

-- | Used internally to create new [`Element`-s](https://developer.mozilla.org/en-US/docs/Web/API/Element).
-- | Do not use this directly. Instead, use `unsafeCustomElement` from `Deku.DOM`.
elementify2
  :: forall element
   . String
  -> Array (Attribute element)
  -> Array Nut
  -> Nut
elementify2 en attributes kids = Nut
  (step1 (mapWithIndex ((map <<< map) (\(Nut df) -> df) unsafeSetPos) kids))
  where
  step1 :: forall payload. Array (NutF payload) -> NutF payload
  step1 arr = NutF
    ( Element'
        ( elementify en attributes
            ( NutF (BCore.fixed (coerce arr))
            )
        )
    )

elementify
  :: forall payload element
   . String
  -> Array (Attribute element)
  -> NutF payload
  -> Node payload
elementify tag atts children = Node $ Element go
  where
  { left, right } = foldl
    ( \b a -> case unsafeUnAttribute a of
        This l -> b { left = b.left <> [ l ] }
        That r -> b { right = b.right <> [ r ] }
        Both l r -> b { left = b.left <> [ l ], right = b.right <> [ r ] }
    )
    { left: [], right: [] }
    atts

  go :: Node' payload
  go
    { parent, scope, raiseId, pos, dynFamily, ez }
    di@(DOMInterpret { ids, deleteFromCache, makeElement, attributeParent }) =
    do
      me <- ids
      raiseId $ show me
      Tuple subs (Tuple unsubs evt) <- __internalDekuFlatten
        children
        { parent: Just $ show me
        , scope
        , ez: true
        , raiseId: \_ -> pure unit
        , pos: Nothing
        , dynFamily: Nothing
        }
        di
      pure
        $ Tuple
            ( [ makeElement
                  { id: show me, parent, scope, tag, pos, dynFamily }
              ] <> map (unsafeSetAttribute di $ show me) left
                <>
                  maybe []
                    ( \p ->
                        [ attributeParent
                            { id: show me, parent: p, pos, dynFamily, ez }
                        ]
                    )
                    parent
                <> subs
            )
        $ Tuple ([ deleteFromCache { id: show me } ] <> unsubs)
        $
          ( merge $
              ( (map <<< map) (unsafeSetAttribute di (show me))
                  right
              ) <> [ evt ]
          )

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
  => Vect n Nut
  -> (Vect n Nut -> Nut)
  -> Nut
globalPortal v' c' =
  Nut
    ( go (map (\(Nut df) -> df) v')
        (shouldBeSafe c')
    )

  where
  shouldBeSafe
    :: forall payload
     . (Vect n Nut -> Nut)
    -> Vect n (NutF payload)
    -> NutF payload
  shouldBeSafe = unsafeCoerce

  go
    :: forall payload
     . Vect n (NutF payload)
    -> (Vect n (NutF payload) -> NutF payload)
    -> NutF payload
  go v c = NutF
    ( Bolson.globalPortalComplexComplex
        flattenArgs
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
  :: Nut
  -> (Nut -> Nut)
  -> Nut
globalPortal1 i f = globalPortal (singleton i) (lcmap (index (Proxy :: _ 0)) f)

-- | A variation of portal that takes a single element instead of a vector of elements.
portal1
  :: Nut
  -> ( Nut
       -> Nut
     )
  -> Nut
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
  => Vect n Nut
  -> (Vect n Nut -> Nut)
  -> Nut
portal v' c' =
  -- all local portals are wrapped in a `dyn`
  -- otherwise, they would have no unique scope, which would not
  -- allow us to determine if they've exacped their scope
  -- for global portals, this is not needed as they use the global scope
  -- todo: this logic is a hack. try to get rid of it.
  dyn
    ( Tuple
        [ Tuple empty
            ( Nut
                ( go (map (\(Nut df) -> df) v')
                    (shouldBeSafe c')
                )
            )
        ]
        empty
    )

  where
  shouldBeSafe
    :: forall payload
     . (Vect n Nut -> Nut)
    -> Vect n (NutF payload)
    -> NutF payload
  shouldBeSafe = unsafeCoerce

  go
    :: forall payload
     . Vect n (NutF payload)
    -> (Vect n (NutF payload) -> NutF payload)
    -> NutF payload
  go v c = NutF
    ( Bolson.portalComplexComplex
        flattenArgs
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

text_'
  :: Maybe (String)
  -> Maybe (Event String)
  -> Nut
text_' t1 t2 = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go
    { parent, scope, raiseId, dynFamily, pos, ez }
    di@(DOMInterpret { ids, makeText, deleteFromCache, attributeParent }) = do
    me <- ids
    raiseId $ show me
    pure
      $ Tuple
          ( [ makeText { id: show me, parent, pos, scope, dynFamily } ]
              <> maybe []
                ( \p ->
                    [ attributeParent
                        { id: show me, parent: p, pos, dynFamily, ez }
                    ]
                )
                parent
              <> maybe [] (\t -> [ unsafeSetText di (show me) t ]) t1

          )
      $ Tuple [ deleteFromCache { id: show me } ]
          (maybe empty (map (unsafeSetText di (show me))) t2)

-- | Create a [`Text`](https://developer.mozilla.org/en-US/docs/Web/API/Text) node from
-- | the emitted strings. Each emitted string replaces the previous string.
text
  :: Event String
  -> Nut
text = text_' Nothing <<< Just

-- | Create a [`Text`](https://developer.mozilla.org/en-US/docs/Web/API/Text) node from
-- | a string. The node is set immediately with the string and does not change.
text_ :: String -> Nut
text_ txt = text_' (Just txt) Nothing

-- | Create a [`Text`](https://developer.mozilla.org/en-US/docs/Web/API/Text) node from
-- | a string. The node is set immediately with the string and then changes based on the event.
text' :: NonEmpty Event String -> Nut
text' (NonEmpty txt e) = text_' (Just txt) (Just e)

-- | Create a [`Text`](https://developer.mozilla.org/en-US/docs/Web/API/Text) node from
-- | something that can be morphed into a string. The node is set immediately with the string and then changes based on the event.
textUsing' :: forall a. (a -> String) -> NonEmpty Event a -> Nut
textUsing' f1 (NonEmpty txt e) = text_' (Just (f1 txt)) (Just (f1 <$> e))

textShow' :: forall a. Show a => NonEmpty Event a -> Nut
textShow' = textUsing' show

-- | A low-level function that creates a Deku application.
-- | In most situations this should not be used. Instead, use functions from `Deku.Toplevel`.
deku
  :: Web.DOM.Element
  -> Nut
  -> (forall payload. HeadNode' payload)
deku root (Nut cc) = go cc
  where
  go
    :: forall payload
     . NutF payload
    -> HeadNode' payload
  go
    children
    di@
      ( DOMInterpret
          { ids
          , makeRoot
          , forcePayload
          , deleteFromCache
          , redecorateDeferredPayload
          }
      ) = do
    let me = "deku-root"
    headRedecorator <- ids
    Tuple sub (Tuple unsub evt) <- __internalDekuFlatten
      children
      { parent: Just me
      , scope: Local "rootScope"
      , raiseId: \_ -> pure unit
      , ez: true
      , pos: Nothing
      , dynFamily: Nothing
      }
      di
    pure $ Tuple ([ makeRoot { id: me, root } ] <> sub) $ Tuple
      ( unsub <>
          [ forcePayload (pure headRedecorator), deleteFromCache { id: me } ]
      )
      (map (redecorateDeferredPayload (pure headRedecorator)) evt)

data Stage = Begin | Middle | End

__internalDekuFlatten
  :: forall payload
   . NutF payload
  -> Node' payload
__internalDekuFlatten (NutF c) a b = Bolson.flatten flattenArgs a b c
