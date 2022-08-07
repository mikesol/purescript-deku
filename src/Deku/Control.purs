module Deku.Control
  ( elementify
  , text
  , text_
  , deku
  , deku1
  , dekuA
  , globalPortal
  , portal
  , module Bolson.Control
  ) where

import Prelude

import Bolson.Control (switcher)
import Bolson.Control as Bolson
import Bolson.Core (Element(..), Entity(..), EventfulElement(..), FixedChildren(..), PSR, Scope(..))
import Control.Alt ((<|>))
import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Data.FastVect.FastVect (Vect)
import Data.Foldable (oneOf)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype, unwrap)
import Data.Profunctor (lcmap)
import Deku.Attribute (Attribute, AttributeValue(..), unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Domable, M, Node(..))
import FRP.Event (AnEvent, bang, makeEvent, subscribe)
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
  -> { id :: String, parent :: String }
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
  -> AnEvent M String
  -> AnEvent M payload
unsafeSetText (DOMInterpret { setText }) id txt = map
  (setText <<< { id, text: _ })
  txt

unsafeSetAttribute
  :: forall element payload
   . DOMInterpret payload
  -> String
  -> AnEvent M (Attribute element)
  -> AnEvent M payload
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
  -> AnEvent M (Attribute element)
  -> Domable lock payload
  -> Node lock payload
elementify tag atts children = Node go
  where
  go { parent, scope, raiseId } di@(DOMInterpret { ids, deleteFromCache }) =
    makeEvent \k -> do
      me <- ids
      raiseId me
      map ((*>) (k (deleteFromCache { id: me }))) $ subscribe
        ( ( oneOf
              ( [ bang (unsafeElement di { id: me, parent, scope, tag })
                , unsafeSetAttribute di me atts
                ] <> maybe []
                  ( \p ->
                      [ bang
                          $ unsafeConnect di
                          $ { id: me, parent: p }
                      ]
                  )
                  parent
              )
          )
            <|> __internalDekuFlatten
              { parent: Just me, scope, raiseId: \_ -> pure unit }
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

portalFlatten
  :: forall payload152 b159 d161 t165 t174 t176 lock184 lock188
   . Newtype b159
       { ids :: d161
       | t165
       }
  => { disconnectElement ::
         DOMInterpret t174
         -> { id :: String
            , parent :: String
            , scope :: Scope
            | t176
            }
         -> t174
     , doLogic :: Int -> DOMInterpret payload152 -> String -> payload152
     , ids :: b159 -> d161
     , toElt ::
         Node lock184 payload152
         -> Element (DOMInterpret payload152) M lock188 payload152
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
  :: forall n s m lock0 payload
   . Compare n Neg1 GT
  => MonadST s m
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

text :: forall lock payload. AnEvent M String -> Domable lock payload
text txt = Element' $ Node go
  where
  go { parent, scope, raiseId } di@(DOMInterpret { ids, deleteFromCache }) =
    makeEvent \k -> do
      me <- ids
      raiseId me
      map ((*>) (k (deleteFromCache { id: me }))) $ subscribe
        ( oneOf
            [ bang (unsafeText di { id: me, parent, scope })
            , unsafeSetText di me txt
            ]
        )
        k

text_ :: forall lock payload. String -> Domable lock payload
text_ txt = text (bang txt)

deku
  :: forall payload
   . Web.DOM.Element
  -> (forall lock. Domable lock payload)
  -> DOMInterpret payload
  -> AnEvent M payload
deku root children di@(DOMInterpret { ids, makeRoot }) = makeEvent \k -> do
  me <- ids
  subscribe
    ( bang (makeRoot { id: me, root })
        <|> __internalDekuFlatten
          { parent: Just me
          , scope: Local "rootScope"
          , raiseId: \_ -> pure unit
          }
          di
          (unsafeCoerce children)
    )
    k

deku1
  :: forall payload
   . Web.DOM.Element
  -> (forall lock. AnEvent M (Domable lock payload))
  -> DOMInterpret payload
  -> AnEvent M payload
deku1 root children = deku root (EventfulElement' $ EventfulElement children)

dekuA
  :: forall payload
   . Web.DOM.Element
  -> (forall lock. Array (Domable lock payload))
  -> DOMInterpret payload
  -> AnEvent M payload
dekuA root children = deku root (FixedChildren' $ FixedChildren children)

data Stage = Begin | Middle | End

__internalDekuFlatten
  :: forall lock payload
   . PSR M
  -> DOMInterpret payload
  -> Domable lock payload
  -> AnEvent M payload
__internalDekuFlatten = Bolson.flatten portalFlatten
