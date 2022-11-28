module Deku.Control
  ( (<#~>)
  , (<$~>)
  , blank
  , deku
  , elementify
  , ezDyn
  , globalPortal
  , globalPortal1
  , guard
  , portal
  , switcher
  , switcherFlipped
  , text
  , text_
  ) where

import Prelude

import Bolson.Control as Bolson
import Bolson.Core (Child(..), Element(..), Entity(..), PSR, Scope(..))
import Bolson.Core as BCore
import Control.Alt ((<|>))
import Control.Monad.ST.Uncurried (mkSTFn2, runSTFn1, runSTFn2)
import Control.Plus (empty)
import Data.FastVect.FastVect (Vect, singleton, index)
import Data.Filterable (filter)
import Data.Foldable (oneOf)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype, unwrap, wrap)
import Data.Profunctor (dimap, lcmap)
import Data.Tuple (snd)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (Attribute, AttributeValue(..), unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Domable(..), Node(..), Nut, bus, dyn, insert_, remove, sendToPos)
import Effect (Effect)
import FRP.Event (Event, Subscriber(..), keepLatest, makeLemmingEventO, mapAccum, memoize)
import Prim.Int (class Compare)
import Prim.Ordering (GT)
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
unsafeSetAttribute (DOMInterpret { setProp, setCb }) id atts = map
  ( ( \{ key, value } -> case value of
        Prop' s -> setProp { id, key, value: s }
        Cb' c -> setCb { id, key, value: c }
    ) <<<
      unsafeUnAttribute
  )
  (atts)

elementify
  :: forall element lock payload
   . String
  -> Event (Attribute element)
  -> Domable lock payload
  -> Node lock payload
elementify tag atts children = Node go
  where
  go
    { parent, scope, raiseId, pos, dynFamily, ez }
    di@(DOMInterpret { ids, deleteFromCache, makeElement, attributeParent }) =
    makeLemmingEventO $ mkSTFn2 \(Subscriber mySub) k -> do
      me <- ids
      raiseId me
      unsub <- runSTFn2 mySub
        ( ( oneOf
              ( [ pure
                    (makeElement { id: me, parent, scope, tag, pos, dynFamily })
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

globalPortal
  :: forall n lock payload
   . Compare n Neg1 GT
  => Vect n (Domable lock payload)
  -> (Vect n (Domable lock payload) -> Domable lock payload)
  -> Domable lock payload
globalPortal v c = Domable $ Bolson.globalPortalComplexComplex
  portalFlatten
  { fromEltO1: coerce
  , fromEltO2: coerce
  , toElt: coerce
  , wrapElt: \i -> Element' (elementify "div" empty (unsafeCoerce i))
  , giveNewParent: \a b _ -> (unwrap a).giveNewParent b
  , deleteFromCache: unwrap >>> _.deleteFromCache
  }
  (map unwrap v)
  (dimap (map ((_ $ unit) >>> wrap)) unwrap c)

globalPortal1
  :: forall lock payload
   . Domable lock payload
  -> (Domable lock payload -> Domable lock payload)
  -> Domable lock payload
globalPortal1 i f = globalPortal (singleton i) (lcmap (index (Proxy :: _ 0)) f)

-- ugh, this isn't sacred, delete it and regenerate if something changes
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
         -> Element (DOMInterpret payload171)
              ( pos :: Maybe Int
              , dynFamily :: Maybe String
              , ez :: Boolean
              )
              lock170
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

portal
  :: forall n lock0 payload
   . Compare n Neg1 GT
  => Vect n (Domable lock0 payload)
  -> ( forall lockfoo
        . Vect n (Domable lockfoo payload)
       -> (Domable lock0 payload -> Domable lockfoo payload)
       -> Domable lockfoo payload
     )
  -> Domable lock0 payload
portal a b = Domable $ Bolson.portalComplexComplex
  portalFlatten
  { fromEltO1: coerce
  , fromEltO2: coerce
  , toElt: coerce
  , wrapElt: \i -> Element' (elementify "div" empty (wrap i))
  , giveNewParent: \q r _ -> (unwrap q).giveNewParent r
  , deleteFromCache: unwrap >>> _.deleteFromCache
  }
  (map unwrap a)
  (lcmap (map (_ $ unit)) (coerce b))

text
  :: forall lock payload
   . Event String
  -> Domable lock payload
text txt = Domable $ Element' $ Node go
  where
  go
    { parent, scope, raiseId, dynFamily, pos, ez }
    di@(DOMInterpret { ids, makeText, deleteFromCache, attributeParent }) =
    makeLemmingEventO $ mkSTFn2 \(Subscriber mySub) k -> do
      me <- ids
      raiseId me
      unsub <- runSTFn2 mySub
        ( oneOf
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

text_ :: forall lock payload. String -> Domable lock payload
text_ txt = text (pure txt)

deku
  :: forall payload
   . Web.DOM.Element
  -> (forall lock. Domable lock payload)
  -> DOMInterpret payload
  -> Event payload
deku root children di@(DOMInterpret { makeRoot }) = makeLemmingEventO $ mkSTFn2
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
            (unsafeCoerce children)
      )
      k

data Stage = Begin | Middle | End

__internalDekuFlatten
  :: forall lock payload
   . PSR (pos :: Maybe Int, ez :: Boolean, dynFamily :: Maybe String)
  -> DOMInterpret payload
  -> Domable lock payload
  -> Event payload
__internalDekuFlatten a b (Domable c) = Bolson.flatten portalFlatten a b c

switcher
  :: forall a lock payload
   . (a -> Domable lock payload)
  -> Event a
  -> Domable lock payload
switcher f event = dyn $ keepLatest
  $ memoize (counter event) \cenv -> map
      ( \(p /\ n) -> oneOf
          [ ((const Remove) <$> filter (eq (n + 1) <<< snd) cenv)
          , pure (insert_ $ coerce (f p))
          ]
      )
      cenv
  where
  counter = mapAccum fn 0
    where
    fn a b = (a + 1) /\ (b /\ a)

infixl 4 switcher as <$~>

switcherFlipped
  :: forall a lock payload
   . Event a
  -> (a -> Domable lock payload)
  -> Domable lock payload
switcherFlipped = flip switcher

infixl 1 switcherFlipped as <#~>

guard
  :: forall lock payload
   . Event Boolean
  -> Domable lock payload
  -> Domable lock payload
guard eb d = switcher
  (if _ then d else blank)
  eb

ezDyn
  :: forall lock payload
   . ( Event
         ( { remove :: Effect Unit, sendToPos :: Int -> Effect Unit }
           -> Domable lock payload
         )
     )
  -> Domable lock payload
ezDyn e1 = dyn
  ( e1 <#> \f1 -> keepLatest $ bus \setRm rm ->
      keepLatest $ bus \setStp stp ->
        (rm $> remove) <|> (stp <#> sendToPos) <|> pure
          ( insert_
              (unsafeCoerce (f1 { remove: setRm unit, sendToPos: setStp }))
          )
  )

blank :: Nut
blank = Domable $ BCore.envy empty