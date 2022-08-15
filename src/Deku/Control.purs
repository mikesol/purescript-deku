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
import Data.Newtype (unwrap)
import Data.Profunctor (lcmap)
import Deku.Attribute (Attribute, AttributeValue(..), unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Domable, Node(..), Nut)
import FRP.Event (AnEvent, makeEvent, subscribe)
import Hyrule.Zora (Zora)
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
  -> AnEvent Zora String
  -> AnEvent Zora payload
unsafeSetText (DOMInterpret { setText }) id txt = map
  (setText <<< { id, text: _ })
  txt

unsafeSetAttribute
  :: forall element payload
   . DOMInterpret payload
  -> String
  -> AnEvent Zora (Attribute element)
  -> AnEvent Zora payload
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
  -> AnEvent Zora (Attribute element)
  -> Domable lock payload
  -> Node lock payload
elementify tag atts children = Node go
  where
  go { parent, scope, raiseId, pos } di@(DOMInterpret { ids, deleteFromCache }) =
    makeEvent \k -> do
      me <- ids
      raiseId me
      map ((k (deleteFromCache { id: me })) *> _) $ subscribe
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
   . AnEvent Zora String
  -> Domable lock payload
text txt = Element' $ Node go
  where
  go { parent, scope, raiseId } di@(DOMInterpret { ids, deleteFromCache }) =
    makeEvent \k -> do
      me <- ids
      raiseId me
      map ((*>) (k (deleteFromCache { id: me }))) $ subscribe
        ( oneOf
            [ pure (unsafeText di { id: me, parent, scope })
            , unsafeSetText di me txt
            ]
        )
        k

text_ :: forall lock payload. String -> Domable lock payload
text_ txt = text (pure txt)

deku
  :: forall payload   
   . Web.DOM.Element
  -> (forall lock. Domable lock payload)
  -> DOMInterpret payload
  -> AnEvent Zora payload
deku root children di@(DOMInterpret { ids, makeRoot }) = makeEvent \k -> do
  me <- ids
  subscribe
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
  -> (forall lock. AnEvent Zora (Domable lock payload))
  -> DOMInterpret payload
  -> AnEvent Zora payload
deku1 root children = deku root (EventfulElement' $ EventfulElement children)

dekuA
  :: forall payload   
   . Web.DOM.Element
  -> (forall lock. Array (Domable lock payload))
  -> DOMInterpret payload
  -> AnEvent Zora payload
dekuA root children = deku root (FixedChildren' $ FixedChildren children)

data Stage = Begin | Middle | End

__internalDekuFlatten
  :: forall lock payload
   . PSR Zora (pos :: Maybe Int)
  -> DOMInterpret payload
  -> Domable lock payload
  -> AnEvent Zora payload
__internalDekuFlatten = Bolson.flatten
  portalFlatten

switcher
  :: forall a element lock payload   
   . (AnEvent Zora (Attribute element) -> Array (Domable lock payload) -> Domable lock payload)
  -> AnEvent Zora (Attribute element)
  -> (a -> Domable lock payload)
  -> AnEvent Zora a
  -> Domable lock payload
switcher f e1 i e2 = f e1 [ Bolson.switcher i e2 ]

switcher_
  :: forall a element lock payload
   . (AnEvent Zora (Attribute element) -> Array (Domable lock payload) -> Domable lock payload)
  -> (a -> Domable lock payload)
  -> AnEvent Zora a
  -> Domable lock payload
switcher_ f i e = f empty [ Bolson.switcher i e ]

dyn
  :: forall element lock payload
   . (AnEvent Zora (Attribute element) -> Array (Domable lock payload) -> Domable lock payload)
  -> AnEvent Zora (Attribute element)
  -> AnEvent Zora (AnEvent Zora (BCore.Child Int (Node lock payload) Zora lock))
  -> Domable lock payload
dyn f e i = f e [ BCore.dyn i ]

dyn_
  :: forall element lock payload
   . (AnEvent Zora (Attribute element) -> Array (Domable lock payload) -> Domable lock payload)
  -> AnEvent Zora (AnEvent Zora (BCore.Child Int (Node lock payload) Zora lock))
  -> Domable lock payload
dyn_ f i = f empty [ BCore.dyn i ]

fixed
  :: forall element lock payload
   . (AnEvent Zora (Attribute element) -> Array (Domable lock payload) -> Domable lock payload)
  -> AnEvent Zora (Attribute element)
  -> Array (Domable lock payload)
  -> Domable lock payload
fixed f e i = f e [ BCore.fixed i ]

fixed_
  :: forall element lock payload
   . (AnEvent Zora (Attribute element) -> Array (Domable lock payload) -> Domable lock payload)
  -> Array (Domable lock payload)
  -> Domable lock payload
fixed_ f i = f empty [ BCore.fixed i ]

envy
  :: forall element lock payload
   . (AnEvent Zora (Attribute element) -> Array (Domable lock payload) -> Domable lock payload)
  -> AnEvent Zora (Attribute element)
  -> AnEvent Zora (Domable lock payload)
  -> Domable lock payload
envy f e i = f e [ BCore.envy i ]

envy_
  :: forall element lock payload
   . (AnEvent Zora (Attribute element) -> Array (Domable lock payload) -> Domable lock payload)
  -> AnEvent Zora (Domable lock payload)
  -> Domable lock payload
envy_ f i = f empty [ BCore.envy i ]

blank :: Nut
blank = BCore.envy empty