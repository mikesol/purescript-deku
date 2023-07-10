-- | This module contains various control structures for things like 
-- | switching between elements, creating portals allowing elements to fly around
-- | the DOM, and basic text creation. It also has several internal functions used for
-- | DOM element creation.
module Deku.Control
  ( (<#~>)
  , (<$~>)
  , actualizeNuts
  , amassKoroks
  , blank
  , compactArray
  , deku
  , elementify3
  , filterArray
  , filterMapArray
  , foldArray
  , foldlArray
  , foldlArray2
  , globalPortal
  , globalPortal1
  , guard
  , nutsToHtml
  , portal
  , portal1
  , switcher
  , switcherFlipped
  , text
  , text_
  , toDeku
  )
  where

import Prelude

import Bolson.Control as Bolson
import Bolson.Core (Element(..), Entity(..), PSR, Scope(..))
import Control.Alt ((<|>))
import Control.Monad.ST.Uncurried (mkSTFn2, runSTFn1, runSTFn2)
import Control.Plus (empty)
import Data.Array (length, null, unsafeIndex)
import Data.Array as Array
import Data.Either (Either(..), hush)
import Data.FastVect.FastVect (Vect, singleton, index)
import Data.Filterable (filter)
import Data.Foldable (foldl)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype, unwrap, wrap)
import Data.Profunctor (dimap, lcmap)
import Data.Tuple (Tuple(..), snd)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (Attribute(..), AttributeValue(..), PureAttribute(..), UnsafeAttribute, VolatileAttribute, unsafeUnVolatileAttribute)
import Deku.Core (ActualizedKorok(..), DOMInterpret(..), Korok(..), Node(..), Nut(..), NutF(..), PureKorok(..), dyn, envy, insert_, remove, resolveNut)
import Deku.Delimiter (delimiter)
import FRP.Event (Event, Subscriber(..), keepLatest, makeLemmingEventO, mapAccum, memoize, merge)
import Foreign.Object as Object
import Partial.Unsafe (unsafePartial)
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
  :: forall payload
   . DOMInterpret payload
  -> String
  -> Event VolatileAttribute
  -> Event payload
unsafeSetAttribute (DOMInterpret { setProp, setCb, unsetAttribute }) id atts =
  map
    ( ( \{ key, value } -> case value of
          Prop' s -> setProp { id, key, value: s }
          Cb' c -> setCb { id, key, value: c }
          Unset' -> unsetAttribute { id, key }
      ) <<<
        unsafeUnVolatileAttribute
    )
    atts

-- use this to get the optimizer to kick in
foldlArray :: forall a b. (b -> a -> b) -> b -> Array a -> b
foldlArray bab b arr = foldlArray2 0 len bab b arr
  where
  len = Array.length arr

foldlArray2 :: forall a b. Int -> Int -> (b -> a -> b) -> b -> Array a -> b
foldlArray2 n i bab b arr
  | n == i = b
  | otherwise = foldlArray2 (n + 1) i bab
      (bab b (unsafePartial $ unsafeIndex arr n))
      arr

foldArray :: forall m. Monoid m => Array m -> m
foldArray = foldlArray (<>) mempty

unzipArray
  :: forall a b
   . Array (Tuple a b)
  -> { left :: Array a, right :: Array b }
unzipArray arr = foldlArray
  ( \{ left, right } (Tuple l r) ->
      { left: left <> [ l ], right: right <> [ r ] }
  )
  { left: [], right: [] }
  arr

amassKoroks
  :: Array (Either ActualizedKorok Korok) -> Int -> Array (Tuple String Korok)
amassKoroks actualized count = compactArray res
  where
  Tuple res _ = foldlArray
    ( \(Tuple arr c) -> case _ of
        Left _ -> do
          Tuple (arr <> [ Nothing ]) c
        Right i ->
          Tuple (arr <> [ Just $ Tuple (delimiter <> show c <> delimiter) i ])
            (c + 1)
    )
    (Tuple [] count)
    actualized

nutsToHtml :: Array (Either ActualizedKorok Korok) -> Int -> String
nutsToHtml actualized count = acc
  where
  (Tuple acc _) = foldlArray
    ( \(Tuple acc c) -> case _ of
        Left (ActualizedKorok k) -> case k of
          Left txt -> Tuple (acc <> txt) c
          Right { html } -> Tuple (acc <> html) c
        Right _ ->
          Tuple (acc <> delimiter <> show c <> delimiter) (c + 1)
    )
    (Tuple "" count)
    actualized

actualizeNuts :: Int -> Array (Either PureKorok Korok) -> Tuple (Array (Either ActualizedKorok Korok)) Int
actualizeNuts count nuts = foldlArray
  ( \(Tuple arr n) -> case _ of
      Left (PureKorok k) -> do
        let korok@(ActualizedKorok ak) = k { count: n }
        Tuple
          (arr <> [ Left korok ])
          ( case ak of
              Left _ -> n
              Right { count: c } -> c
          )
      Right x -> Tuple (arr <> [ Right x ]) n
  )
  (Tuple [] (count + 1))
  nuts

-- | Used internally to create new [`Element`-s](https://developer.mozilla.org/en-US/docs/Web/API/Element).
-- | Do not use this directly. Instead, use `unsafeCustomElement` from `Deku.DOM`.
elementify3
  :: forall element
   . String
  -> Array (Attribute element)
  -> Array Nut
  -> Nut
elementify3 tag attributes kids = pureNut
  where
  -- 1. we split the attribute list into pure and impure attributes
  atts = foldlArray
    ( \{ left, right } -> case _ of
        Left x -> { left: left <> [ x ], right }
        Right x -> { left, right: right <> [ x ] }
    )
    { left: [], right: [] }
    ((coerce :: Array (Attribute element) -> Array UnsafeAttribute) attributes)
  writableAtts = foldlArray
    (\b a -> b <> " " <> a.key <> "=\"" <> a.value <> "\"")
    ""
    ( ( coerce -- the list from foldable is to avoid the optimizer hitting the foreign wall for Array's foldable
          :: Array PureAttribute
          -> Array
               { key :: String
               , value :: String
               }
      ) atts.left
    )
  -- 2. we split the nuts
  nuts = (coerce :: Array Nut -> Array (Either PureKorok Korok)) kids
  ownComponentCount = length $ filterMapArray hush nuts
  noAtts = null atts.right
  attributeCount = if noAtts then 0 else 1


  -- 3. we build our pure korok
  pureNut = Nut $ Left $ PureKorok \{ count } -> do
    let myCount = count + attributeCount + ownComponentCount
    -- oops - did I mean to do something with newCount?
    let Tuple actualizedNuts newCount = actualizeNuts myCount nuts
    let delimited = delimiter <> show count <> delimiter
    let
      filtered = filterMapArray
        ( case _ of
            Left (ActualizedKorok k) -> case k of
              Left _ -> Nothing
              Right { attributes: attz, nuts: nutz } -> Just
                (Tuple attz nutz)
            Right _ -> Nothing
        )
        actualizedNuts
    let { left: attz, right: nutz } = unzipArray filtered
    let nuttyString = nutsToHtml actualizedNuts (count + attributeCount)
    let myKoroks = amassKoroks actualizedNuts (count + attributeCount)

    ActualizedKorok $ Right $
      { html: "<" <> tag
          <> writableAtts
          <> " "
          <> delimited
          <> " "
          <> " >"
          -- not quite this because we need to intersperse the other koroks
          <> nuttyString
          <> "</"
          <> tag
          <> ">"
      , attributes: foldlArray (<>)
          ( if noAtts then []
            else [ Tuple delimited (merge atts.right) ]
          )
          attz
      , nuts: foldlArray (<>)
          myKoroks
          nutz
      , count: myCount
      }

elementify
  :: forall payload
   . String
  -> NutF payload
  -> Node payload
elementify tag children = Node go
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
  => Vect n Nut
  -> (Vect n Nut -> Nut)
  -> Nut
globalPortal v' c' =
  Nut
    $ Right
    $ Korok
        ( go (map (resolveNut >>> \(Korok df) -> df) v')
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
        portalFlatten
        { fromEltO1: coerce
        , fromEltO2: coerce
        , toElt: coerce
        -- stuck here
        -- coerce won't work
        , wrapElt: \i -> Element' ((elementify "div" (coerce i)))
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
  dyn
    ( pure unit <#> \_ -> pure
        $ insert_
            ( Nut $ Right $ Korok
                ( go (map (resolveNut >>> \(Korok df) -> df) v')
                    (shouldBeSafe c')
                )
            )
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
        portalFlatten
        { fromEltO1: coerce
        , fromEltO2: coerce
        , toElt: coerce
        -- stuck here
        -- coerce won't work
        , wrapElt: \i -> Element' (elementify "div" (coerce i))
        , giveNewParent: \a b ctor _ -> (unwrap a).giveNewParent
            (b `union` { ctor: coerce ctor })
        , deleteFromCache: unwrap >>> _.deleteFromCache
        }
        (map unwrap v)
        (dimap (map ((_ $ unit) >>> wrap)) unwrap c)
    )

-- | Create a [`Text`](https://developer.mozilla.org/en-US/docs/Web/API/Text) node from
-- | the emitted strings. Each emitted string replaces the previous string.
text
  :: Event String
  -> Nut
text txt = Nut $ Right $ Korok go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node go))

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

filterArray :: forall a. (a -> Boolean) -> Array a -> Array a
filterArray f = filterMapArray \i -> if f i then Just i else Nothing

filterMapArray :: forall a b. (a -> Maybe b) -> Array a -> Array b
filterMapArray f arr = foldlArray ff [] arr
  where
  ff b a = case f a of
    Just x -> b <> [ x ]
    Nothing -> b

compactArray :: forall a. Array (Maybe a) -> Array a
compactArray = filterMapArray identity

-- | Create a [`Text`](https://developer.mozilla.org/en-US/docs/Web/API/Text) node from
-- | a string. The node is set immediately with the string and does not change.
text_ :: String -> Nut
text_ txt = Nut $ Left $ PureKorok \_ -> ActualizedKorok $ Left txt

-- | A low-level function that creates a Deku application.
-- | In most situations this should not be used. Instead, use functions from `Deku.Toplevel`.
deku
  :: Web.DOM.Element
  -> Nut
  -> ( forall payload
        . DOMInterpret payload
       -> Event payload
     )
deku root nt = go cc
  where
  Korok cc = resolveNut nt

  go
    :: forall payload
     . NutF payload
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
  -> NutF payload
  -> Event payload
__internalDekuFlatten a b (NutF c) = Bolson.flatten portalFlatten a b c

-- | Like `bindFlipped`, except instead of working with a monad, it dipts into an `Event`
-- | and creates a `Nut`. This allows you to use an event to switch between different
-- | bits of DOM. This is how a [Virtual DOM](https://en.wikipedia.org/wiki/Virtual_DOM) works
-- | in its most basic, unoptimized form. As a result, `switcher`, while convenient, is inefficient
-- | and should be used when the content needs to be replaced wholesale. For a more efficient
-- | approach, see the `useDyn` hook.
switcher
  :: forall a
   . (a -> Nut)
  -> Event a
  -> Nut
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
  -> (a -> Nut)
  -> Nut
switcherFlipped = flip switcher

infixl 1 switcherFlipped as <#~>

-- | Inserts the Deku Nut when an event emits `true`, otherwise destroys the element.
guard
  :: Event Boolean
  -> Nut
  -> Nut
guard eb d = switcher
  (if _ then d else blank)
  eb

-- | An empty domable. `mempty` also works.
blank :: Nut
blank = mempty

toDeku :: forall a. (a -> Event Nut) -> a -> Nut
toDeku = compose envy