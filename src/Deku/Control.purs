module Deku.Control
  ( elementify
  , dyn
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
import Bolson.Core (Child(..), Element(..), Entity(..), EventfulElement(..), FixedChildren(..), PSR, Scope(..))
import Bolson.Core as BC
import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.FastVect.FastVect (Vect)
import Data.Foldable (oneOf)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype, unwrap)
import Data.Profunctor (lcmap)
import Deku.Attribute (Attribute, AttributeValue(..), Attribute', unsafeUnAttribute)
import Deku.Core (class Korok, DOMInterpret(..), Domable, Node(..))
import FRP.Event (AnEvent, bang, makeEvent, subscribe)
import Prim.Int (class Compare)
import Prim.Ordering (GT)
import Safe.Coerce (coerce)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM as Web.DOM

type Neg1 = -1

----
unsafeElement
  :: forall m payload
   . DOMInterpret m payload
  -> { id :: String, parent :: Maybe String, scope :: Scope, tag :: String }
  -> payload
unsafeElement (DOMInterpret { makeElement }) = makeElement

unsafeConnect
  :: forall m payload
   . DOMInterpret m payload
  -> { id :: String, parent :: String }
  -> payload
unsafeConnect (DOMInterpret { attributeParent }) = attributeParent

unsafeText
  :: forall m payload
   . DOMInterpret m payload
  -> { id :: String, parent :: Maybe String, scope :: Scope }
  -> payload
unsafeText (DOMInterpret { makeText }) = makeText

unsafeSetText
  :: forall m payload
   . DOMInterpret m payload
  -> String
  -> AnEvent m String
  -> AnEvent m payload
unsafeSetText (DOMInterpret { setText }) id txt = map
  (setText <<< { id, text: _ })
  txt

unsafeSetAttribute
  :: forall m element payload
   . DOMInterpret m payload
  -> String
  -> AnEvent m (Attribute element)
  -> AnEvent m payload
unsafeSetAttribute (DOMInterpret { setProp, setCb }) id atts = map
  ( ( \{ key, value } -> case value of
        Prop' s -> setProp { id, key, value: s }
        Cb' c -> setCb { id, key, value: c }
    ) <<<
      unsafeUnAttribute
  )
  (atts)

dyn
  :: forall logic s m lock payload
   . Korok s m
  => AnEvent m (AnEvent m (Child logic (Node m lock payload) m lock))
  -> Entity logic (Node m lock payload) m lock
dyn e =
  BC.dyn
    ( bang
        ( bang
            ( Insert $ Element'
                ( Node \psr di ->
                    let
                      (Node nd) = elementify "input"
                        ( ( bang $ (unsafeCoerce :: Attribute' -> Attribute _)
                              { key: "data-deku-scope"
                              , value: Prop' $ case psr.scope of
                                  Local s -> s
                                  Global -> "@global@"
                              }
                          ) <|>
                            ( bang $ (unsafeCoerce :: Attribute' -> Attribute _)
                                { key: "type"
                                , value: Prop' "hidden"
                                }
                            )
                        )
                        (BC.fixed [])
                    in
                      nd psr di

                )
            )
        ) <|> e
    )

elementify
  :: forall s m element lock payload
   . Korok s m
  => String
  -> AnEvent m (Attribute element)
  -> Domable m lock payload
  -> Node m lock payload
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
  :: forall n s m lock payload
   . Compare n Neg1 GT
  => Korok s m
  => Vect n (Domable m lock payload)
  -> (Vect n (Domable m lock payload) -> Domable m lock payload)
  -> Domable m lock payload
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
  :: forall m151 payload152 b159 d161 t165 m168 t174 t176 m183 lock184 lock188
       payload189
   . Newtype b159
       { ids :: d161
       | t165
       }
  => { disconnectElement ::
         DOMInterpret m168 t174
         -> { id :: String
            , parent :: String
            , scope :: Scope
            | t176
            }
         -> t174
     , doLogic :: Int -> DOMInterpret m151 payload152 -> String -> payload152
     , ids :: b159 -> d161
     , toElt ::
         Node m183 lock184 payload189
         -> Element (DOMInterpret m183 payload189) m183 lock188 payload189
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
  => Korok s m
  => Vect n (Domable m lock0 payload)
  -> ( forall lockfoo
        . Vect n (Domable m lockfoo payload)
       -> (Domable m lock0 payload -> Domable m lockfoo payload)
       -> Domable m lockfoo payload
     )
  -> Domable m lock0 payload
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
  :: forall m lock payload
   . Monad m
  => AnEvent m String
  -> Domable m lock payload
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

text_ :: forall m lock payload. Monad m => String -> Domable m lock payload
text_ txt = text (bang txt)

deku
  :: forall s m payload
   . Korok s m
  => Web.DOM.Element
  -> (forall lock. Domable m lock payload)
  -> DOMInterpret m payload
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

deku1
  :: forall s m payload
   . Korok s m
  => Web.DOM.Element
  -> (forall lock. AnEvent m (Domable m lock payload))
  -> DOMInterpret m payload
  -> AnEvent m payload
deku1 root children = deku root (EventfulElement' $ EventfulElement children)

dekuA
  :: forall s m payload
   . Korok s m
  => Web.DOM.Element
  -> (forall lock. Array (Domable m lock payload))
  -> DOMInterpret m payload
  -> AnEvent m payload
dekuA root children = deku root (FixedChildren' $ FixedChildren children)

data Stage = Begin | Middle | End

__internalDekuFlatten
  :: forall s m lock payload
   . Korok s m
  => PSR m
  -> DOMInterpret m payload
  -> Domable m lock payload
  -> AnEvent m payload
__internalDekuFlatten = Bolson.flatten
  portalFlatten
