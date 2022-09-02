module Deku.Control
  ( elementify
  , text
  , text_
  , deku
  , deku1
  , dekuA
  , globalPortal
  , portal
  , blank
  , dyn
  , dyn_
  , ezDyn
  , ezDyn_
  , fixed
  , fixed_
  , envy
  , envy_
  , switcher
  , switcher_
  ) where

import Prelude

import Bolson.Control as Bolson
import Bolson.Core (Element(..), Entity(..), EventfulElement(..), FixedChildren(..), PSR, Scope(..))
import Bolson.Core as BCore
import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.FastVect.FastVect (Vect)
import Data.Foldable (oneOf)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype, unwrap)
import Data.Profunctor (lcmap)
import Deku.Attribute (Attribute, AttributeValue(..), unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Domable, Node(..), Nut, bus, insert_, remove, sendToPos)
import Effect (Effect)
import FRP.Event (Event, keepLatest, makeLemmingEvent)
import Prim.Int (class Compare)
import Prim.Ordering (GT)
import Safe.Coerce (coerce)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM as Web.DOM

type Neg1 = -1

----
unsafeElement
  :: forall payload
   . DOMInterpret payload
  -> { id :: String, parent :: Maybe String, scope :: Scope, tag :: String }
  -> payload
unsafeElement (DOMInterpret { makeElement }) = makeElement

unsafeConnect
  :: forall payload
   . DOMInterpret payload
  -> { id :: String, parent :: String, pos :: Maybe Int }
  -> payload
unsafeConnect (DOMInterpret { attributeParent }) = attributeParent

unsafeText
  :: forall payload
   . DOMInterpret payload
  -> { id :: String, parent :: Maybe String, scope :: Scope }
  -> payload
unsafeText (DOMInterpret { makeText }) = makeText

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
  go { parent, scope, raiseId, pos } di@(DOMInterpret { ids, deleteFromCache }) =
    makeLemmingEvent \mySub k -> do
      me <- ids
      raiseId me
      unsub <- mySub
        ( ( oneOf
              ( [ pure (unsafeElement di { id: me, parent, scope, tag })
                , unsafeSetAttribute di me atts
                ] <> maybe []
                  ( \p ->
                      [ pure
                          $ unsafeConnect di
                          $ { id: me, parent: p, pos }
                      ]
                  )
                  parent
              )
          )
            <|> __internalDekuFlatten
              { parent: Just me, scope, raiseId: \_ -> pure unit, pos: Nothing }
              di
              children
        )
        k
      pure do
        k (deleteFromCache { id: me })
        unsub

globalPortal
  :: forall n lock payload
   . Compare n Neg1 GT
  => Vect n (Domable lock payload)
  -> (Vect n (Domable lock payload) -> Domable lock payload)
  -> Domable lock payload
globalPortal v c = Bolson.globalPortalComplexComplex
  portalFlatten
  { fromEltO1: coerce
  , fromEltO2: coerce
  , toElt: coerce
  , wrapElt: Element' <<< elementify "div" empty
  , giveNewParent: \a b _ -> (unwrap a).giveNewParent b
  , deleteFromCache: unwrap >>> _.deleteFromCache
  }
  v
  (lcmap (map (_ $ unit)) c)

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
portal a b = Bolson.portalComplexComplex
  portalFlatten
  { fromEltO1: coerce
  , fromEltO2: coerce
  , toElt: coerce
  , wrapElt: Element' <<< elementify "div" empty
  , giveNewParent: \q r _ -> (unwrap q).giveNewParent r
  , deleteFromCache: unwrap >>> _.deleteFromCache
  }
  a
  (lcmap (map (_ $ unit)) (coerce b))

text
  :: forall lock payload
   . Event String
  -> Domable lock payload
text txt = Element' $ Node go
  where
  go { parent, scope, raiseId } di@(DOMInterpret { ids, deleteFromCache }) =
    makeLemmingEvent \mySub k -> do
      me <- ids
      raiseId me
      unsub <- mySub
        ( oneOf
            [ pure (unsafeText di { id: me, parent, scope })
            , unsafeSetText di me txt
            ]
        )
        k
      pure do
        k (deleteFromCache { id: me })
        unsub

text_ :: forall lock payload. String -> Domable lock payload
text_ txt = text (pure txt)

deku
  :: forall payload
   . Web.DOM.Element
  -> (forall lock. Domable lock payload)
  -> DOMInterpret payload
  -> Event payload
deku root children di@(DOMInterpret { ids, makeRoot }) = makeLemmingEvent \mySub k -> do
  me <- ids
  mySub
    ( pure (makeRoot { id: me, root })
        <|> __internalDekuFlatten
          { parent: Just me
          , scope: Local "rootScope"
          , raiseId: \_ -> pure unit
          , pos: Nothing
          }
          di
          (unsafeCoerce children)
    )
    k

deku1
  :: forall payload
   . Web.DOM.Element
  -> (forall lock. Event (Domable lock payload))
  -> DOMInterpret payload
  -> Event payload
deku1 root children = deku root (EventfulElement' $ EventfulElement children)

dekuA
  :: forall payload
   . Web.DOM.Element
  -> (forall lock. Array (Domable lock payload))
  -> DOMInterpret payload
  -> Event payload
dekuA root children = deku root (FixedChildren' $ FixedChildren children)

data Stage = Begin | Middle | End

__internalDekuFlatten
  :: forall lock payload
   . PSR (pos :: Maybe Int)
  -> DOMInterpret payload
  -> Domable lock payload
  -> Event payload
__internalDekuFlatten = Bolson.flatten
  portalFlatten

switcher
  :: forall a element lock payload
   . ( Event (Attribute element)
       -> Array (Domable lock payload)
       -> Domable lock payload
     )
  -> Event (Attribute element)
  -> (a -> Domable lock payload)
  -> Event a
  -> Domable lock payload
switcher f e1 i e2 = f e1 [ Bolson.switcher i e2 ]

switcher_
  :: forall a element lock payload
   . ( Event (Attribute element)
       -> Array (Domable lock payload)
       -> Domable lock payload
     )
  -> (a -> Domable lock payload)
  -> Event a
  -> Domable lock payload
switcher_ f i e = f empty [ Bolson.switcher i e ]

dyn
  :: forall element lock payload
   . ( Event (Attribute element)
       -> Array (Domable lock payload)
       -> Domable lock payload
     )
  -> Event (Attribute element)
  -> Event (Event (BCore.Child Int (Node lock payload) lock))
  -> Domable lock payload
dyn f e i = f e [ BCore.dyn i ]

ezDyn
  :: forall element lock payload
   . ( Event (Attribute element)
       -> Array (Domable lock payload)
       -> Domable lock payload
     )
  -> Event (Attribute element)
  -> ( Event
         ( { remove :: Effect Unit, sendToPos :: Int -> Effect Unit }
           -> Domable lock payload
         )
     )
  -> Domable lock payload
ezDyn f0 e0 e1 = dyn f0 e0
  ( e1 <#> \f1 -> keepLatest $ bus \setRm rm ->
      keepLatest $ bus \setStp stp ->
        (rm $> remove) <|> (stp <#> sendToPos) <|> pure
          (insert_ (f1 { remove: setRm unit, sendToPos: setStp }))
  )

ezDyn_
  :: forall element lock payload
   . ( Event (Attribute element)
       -> Array (Domable lock payload)
       -> Domable lock payload
     )
  -> ( Event
         ( { remove :: Effect Unit, sendToPos :: Int -> Effect Unit }
           -> Domable lock payload
         )
     )
  -> Domable lock payload
ezDyn_ f0 e1 = dyn_ f0
  ( e1 <#> \f1 -> keepLatest $ bus \setRm rm ->
      keepLatest $ bus \setStp stp ->
        (rm $> remove) <|> (stp <#> sendToPos) <|> pure
          (insert_ (f1 { remove: setRm unit, sendToPos: setStp }))
  )

dyn_
  :: forall element lock payload
   . ( Event (Attribute element)
       -> Array (Domable lock payload)
       -> Domable lock payload
     )
  -> Event (Event (BCore.Child Int (Node lock payload) lock))
  -> Domable lock payload
dyn_ f i = f empty [ BCore.dyn i ]

fixed
  :: forall element lock payload
   . ( Event (Attribute element)
       -> Array (Domable lock payload)
       -> Domable lock payload
     )
  -> Event (Attribute element)
  -> Array (Domable lock payload)
  -> Domable lock payload
fixed f e i = f e [ BCore.fixed i ]

fixed_
  :: forall element lock payload
   . ( Event (Attribute element)
       -> Array (Domable lock payload)
       -> Domable lock payload
     )
  -> Array (Domable lock payload)
  -> Domable lock payload
fixed_ f i = f empty [ BCore.fixed i ]

envy
  :: forall element lock payload
   . ( Event (Attribute element)
       -> Array (Domable lock payload)
       -> Domable lock payload
     )
  -> Event (Attribute element)
  -> Event (Domable lock payload)
  -> Domable lock payload
envy f e i = f e [ BCore.envy i ]

envy_
  :: forall element lock payload
   . ( Event (Attribute element)
       -> Array (Domable lock payload)
       -> Domable lock payload
     )
  -> Event (Domable lock payload)
  -> Domable lock payload
envy_ f i = f empty [ BCore.envy i ]

blank :: Nut
blank = BCore.envy empty