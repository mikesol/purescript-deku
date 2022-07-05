module Deku.Control
  ( elementify
  , text
  , text_
  , deku
  , globalPortal
  , portal
  , module Bolson.Control
  ) where

import Prelude

import Bolson.Control (switcher)
import Bolson.Control as Bolson
import Bolson.Core (Element(..), Entity(..), PSR, Scope(..))
import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.FastVect.FastVect (Vect)
import Data.Foldable (oneOf)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype, unwrap)
import Data.Profunctor (lcmap)
import Deku.Attribute (Attribute, AttributeValue(..), unsafeUnAttribute)
import Deku.Core (class Korok, DOMInterpret(..), Domable, Node(..))
--import Deku.Shadow (Shadow(..))
import FRP.Event (AnEvent, bang, makeEvent, subscribe)
import Prim.Int (class Compare)
import Prim.Ordering (GT)
import Safe.Coerce (coerce)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM as Web.DOM

type Neg1 = -1

----
unsafeElement
  :: forall e m payload
   . DOMInterpret e m payload
  -> { id :: String
     , parent :: Maybe String
     , scope :: Scope
     , tag :: String
     }
  -> payload
unsafeElement (DOMInterpret { makeElement }) = makeElement

unsafeConnect
  :: forall e m payload
   . DOMInterpret e m payload
  -> { id :: String, parent :: String }
  -> payload
unsafeConnect (DOMInterpret { attributeParent }) = attributeParent

unsafeText
  :: forall e m payload
   . DOMInterpret e m payload
  -> { id :: String
     , parent :: Maybe String
     , scope :: Scope
     }
  -> payload
unsafeText (DOMInterpret { makeText }) = makeText

unsafeSetText
  :: forall e m payload
   . DOMInterpret e m payload
  -> String
  -> AnEvent m String
  -> AnEvent m payload
unsafeSetText (DOMInterpret { setText }) id txt = map
  (setText <<< { id, text: _ })
  txt

-- TODO: scope here is a bit hackish
-- they are only ever used in hydration iff we set an attribute on an element
-- before it is created
-- it's not even certain that this is possible anymore
-- we should find a case where at is and, if so, document it
-- it seems strange that hydration would try to set an attribute on an element before
-- having added it to the internal cache: this would only happen if the _makeElement_
-- call were defered somehow. this may have happened in the past, but i'm not sure
-- it still does
unsafeSetAttribute
  :: forall e m element payload
   . Maybe String
  -> Scope
  -> DOMInterpret e m payload
  -> String
  -> AnEvent m (Attribute element)
  -> AnEvent m payload
unsafeSetAttribute parent scope (DOMInterpret { setProp, setCb }) id atts = map
  ( ( \{ key, value } -> case value of
        Prop' s -> setProp { id, key, value: s, parent, scope }
        Cb' c -> setCb { id, key, value: c, parent, scope }
    ) <<<
      unsafeUnAttribute
  )
  (atts)

elementify
  :: forall e s m element lock payload
   . Korok s m
  => String
  -> AnEvent m (Attribute element)
  -> Domable e m lock payload
  -> Node e m lock payload
elementify tag atts children = Node go
  where
  go
    { parent, scope, raiseId }
    di@(DOMInterpret { ids, deleteFromCache }) =
    makeEvent \k -> do
      me <- ids
      raiseId me
      u <- subscribe
        ( ( oneOf
              ( [ bang (unsafeElement di { id: me, parent, scope, tag })
                , unsafeSetAttribute parent scope di me atts
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
              { parent: Just me
              , scope
              , raiseId: \_ -> pure unit
              }
              di
              children
        )
        k
      pure (k (deleteFromCache { id: me }) *> u)

globalPortal
  :: forall e n s m lock payload
   . Compare n Neg1 GT
  => Korok s m
  => Vect n (Domable e m lock payload)
  -> (Vect n (Domable e m lock payload) -> Domable e m lock payload)
  -> Domable e m lock payload
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
  :: forall e m151 payload152 b159 d161 t165 m168 t174 t176 m183 lock184 lock188
       payload189
   . Newtype b159
       { ids :: d161
       | t165
       }
  => { disconnectElement ::
         DOMInterpret e m168 t174
         -> { id :: String
            , parent :: String
            , scope :: Scope
            | t176
            }
         -> t174
     , doLogic :: Int -> DOMInterpret e m151 payload152 -> String -> payload152
     , ids :: b159 -> d161
     , toElt ::
         Node e m183 lock184 payload189
         -> Element (DOMInterpret e m183 payload189) m183
              lock188
              payload189
     }
portalFlatten =
  { doLogic: \pos (DOMInterpret { sendToPos }) id -> sendToPos { id, pos }
  , ids: unwrap >>> _.ids
  , disconnectElement:
      \(DOMInterpret { disconnectElement }) { id, scope, parent } ->
        disconnectElement { id }
  , toElt: \(Node e) -> Element e
  }

portal
  :: forall e n s m lock0 payload
   . Compare n Neg1 GT
  => Korok s m
  => Vect n (Domable e m lock0 payload)
  -> ( forall lockfoo
        . Vect n (Domable e m lockfoo payload)
       -> (Domable e m lock0 payload -> Domable e m lockfoo payload)
       -> Domable e m lockfoo payload
     )
  -> Domable e m lock0 payload
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
  :: forall e m lock payload
   . Monad m
  => AnEvent m String
  -> Domable e m lock payload
text txt = Element' $ Node go
  where
  go
    { parent
    , scope
    , raiseId
    }
    di@
      ( DOMInterpret
          { ids
          , deleteFromCache
          }
      ) =
    makeEvent \k -> do
      me <- ids
      raiseId me
      map ((*>) (k (deleteFromCache { id: me }))) $ subscribe
        ( oneOf
            ( [ bang (unsafeText di { id: me, parent, scope })
              , unsafeSetText di me txt
              ] <> case parent of
                Just p -> [ bang $ unsafeConnect di { id: me, parent: p } ]
                Nothing -> []
            )
        )
        k

text_ :: forall e m lock payload. Monad m => String -> Domable e m lock payload
text_ txt = text (bang txt)

deku
  :: forall e s m payload
   . Korok s m
  => Web.DOM.Element
  -> (forall lock. Domable e m lock payload)
  -> DOMInterpret Web.DOM.Element m payload
  -> AnEvent m payload
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

data Stage = Begin | Middle | End

__internalDekuFlatten
  :: forall e s m lock payload
   . Korok s m
  => PSR m
  -> DOMInterpret e m payload
  -> Domable e m lock payload
  -> AnEvent m payload
__internalDekuFlatten = Bolson.flatten
  portalFlatten
