module Deku.Control
  ( elementify
  , text
  , text_
  , deku
  , deku0
  , deku1
  , deku2
  , dekuA
  , blank
  , globalPortal
  , portal
  , class Plant
  , plant
  ) where

import Prelude

import Control.Alt ((<|>))
import Data.Either (Either(..))
import Data.Foldable (oneOf, oneOfMap)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Maybe (Maybe(..))
import Deku.Internal (__internalDekuFlatten)
import Data.Vec (toArray, Vec)
import Deku.Attribute (Attribute, unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Element(..), StreamingElt(..))
import Effect (Effect)
import Effect.AVar (tryPut)
import Effect.AVar as AVar
import Effect.Exception (throwException)
import FRP.Behavior (sample_)
import FRP.Event (Event, bang, keepLatest, makeEvent, subscribe)
import Safe.Coerce (coerce)
import Type.Equality (class TypeEquals, proof)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM as Web.DOM

----
unsafeElement
  :: forall payload
   . DOMInterpret payload
  -> { id :: String, parent :: String, scope :: String, tag :: String }
  -> payload
unsafeElement (DOMInterpret { makeElement }) = makeElement

unsafeText
  :: forall payload
   . DOMInterpret payload
  -> { id :: String, parent :: String, scope :: String }
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
unsafeSetAttribute (DOMInterpret { setAttribute }) id atts = map
  ( setAttribute <<< (\{ key, value } -> { id, key, value }) <<<
      unsafeUnAttribute
  )
  (atts)

elementify
  :: forall element lock payload
   . String
  -> Event (Attribute element)
  -> Event (Event (StreamingElt lock payload))
  -> Element lock payload
elementify tag atts children = Element go
  where
  go { parent, scope, raiseId } di@(DOMInterpret { ids }) = keepLatest
    ( (sample_ ids (bang unit)) <#> \me -> makeEvent \k -> do
        raiseId me
        subscribe
          ( ( oneOf
                [ bang (unsafeElement di { id: me, parent, scope, tag })
                , unsafeSetAttribute di me atts
                ]
            )
              <|> __internalDekuFlatten me di children
          )
          k
    )

newtype MutAr a = MutAr (Array a)

foreign import mutAr :: forall a. Array a -> Effect (MutAr a)
foreign import unsafeUpdateMutAr :: forall a. Int -> a -> MutAr a -> Effect Unit
foreign import readAr :: forall a. MutAr a -> Effect (Array a)

internalPortal
  :: forall n lock0 lock1 payload
   . (String -> String)
  -> Vec n (Element lock0 payload)
  -> ( Vec n (Element lock1 payload)
       -> (Element lock0 payload -> Element lock1 payload)
       -> Event (Event (StreamingElt lock1 payload))
     )
  -> Element lock0 payload
internalPortal scopeF gaga closure = Element go
  where
  go psr di = makeEvent \k -> do
    av <- mutAr (map (const "") $ toArray gaga)
    let
      actualized = oneOf $ mapWithIndex
        ( \ix (Element gogo) ->
            gogo
              { parent: "@portal@"
              , scope: scopeF psr.scope
              , predecessor: Nothing
              , raiseId: \id -> unsafeUpdateMutAr ix id av
              }
              di
        )
        gaga
    u0 <- subscribe actualized k
    av2 <- AVar.empty
    let
      asIds :: Array String -> Vec n String
      asIds = unsafeCoerce
    idz <- asIds <$> readAr av
    let
      injectable = map
        ( \id -> Element
            \{ parent } (DOMInterpret { giveNewParent }) ->
              bang (giveNewParent { id, parent })
        )
        idz
      realized = __internalDekuFlatten psr.parent di
        (proof (coerce (closure injectable (\(Element q) -> Element q))))
    u <- subscribe realized k
    void $ tryPut u av2
    -- cancel immediately, as it should be run synchronously
    -- so if this actually does something then we have a problem
    pure do
      u0
      cncl2 <- AVar.take av2 \q -> case q of
        Right usu -> usu
        Left e -> throwException e
      -- cancel immediately, as it should be run synchronously
      -- so if this actually does something then we have a problem
      cncl2

globalPortal
  :: forall n lock payload
   . Vec n (Element lock payload)
  -> (Vec n (Element lock payload) -> Event (Event (StreamingElt lock payload)))
  -> Element lock payload
globalPortal e f = internalPortal (const "@portal@") e (\x _ -> f x)

portal
  :: forall n lock0 payload
   . Vec n (Element lock0 payload)
  -> ( forall lock1
        . Vec n (Element lock1 payload)
       -> (Element lock0 payload -> Element lock1 payload)
       -> Event (Event (StreamingElt lock1 payload))
     )
  -> Element lock0 payload
portal e = internalPortal identity e

class Plant seed tree | seed -> tree where
  plant :: seed -> tree

instance
  ( TypeEquals locki locko
  , TypeEquals payloadi payloado
  ) =>
  Plant (Event (Event (StreamingElt locki payloadi)))
    (Event (Event (StreamingElt locko payloado))) where
  plant i = proof (coerce i)

instance
  ( TypeEquals locki locko
  , TypeEquals payloadi payloado
  ) =>
  Plant (Event (Event (Element locki payloadi)))
    (Event (Event (StreamingElt locko payloado))) where
  plant i = proof (coerce ((map <<< map) Elt i))

instance
  ( TypeEquals locki locko
  , TypeEquals payloadi payloado
  ) =>
  Plant (Event (StreamingElt locki payloadi))
    (Event (Event (StreamingElt locko payloado))) where
  plant i = proof (coerce (bang i))

instance
  ( TypeEquals locki locko
  , TypeEquals payloadi payloado
  ) =>
  Plant (Event (Element locki payloadi))
    (Event (Event (StreamingElt locko payloado))) where
  plant i = proof (coerce ((bang <<< map Elt) i))

instance
  ( TypeEquals locki locko
  , TypeEquals payloadi payloado
  ) =>
  Plant (Element locki payloadi) (Event (Event (StreamingElt locko payloado))) where
  plant i = proof (coerce ((bang <<< bang <<< Elt) i))

instance
  ( TypeEquals locki locko
  , TypeEquals payloadi payloado
  ) =>
  Plant (Array (Element locki payloadi))
    (Event (Event (StreamingElt locko payloado))) where
  plant i = proof (coerce (oneOfMap bang $ map (bang <<< Elt) i))

instance
  ( TypeEquals locki locko
  , TypeEquals payloadi payloado
  ) =>
  Plant (Array (Event (Element locki payloadi)))
    (Event (Event (StreamingElt locko payloado))) where
  plant i = proof (coerce (oneOfMap bang $ (map <<< map) Elt i))

instance
  ( TypeEquals locki locko
  , TypeEquals payloadi payloado
  ) =>
  Plant (StreamingElt locki payloadi)
    (Event (Event (StreamingElt locko payloado))) where
  plant i = proof (coerce ((bang <<< bang) i))

text
  :: forall lock payload
   . Event String
  -> Element lock payload
text txt = Element go
  where
  go { parent, scope, raiseId } di@(DOMInterpret { ids }) = keepLatest
    ( (sample_ ids (bang unit)) <#> \me -> makeEvent \k -> do
        raiseId me
        subscribe
          ( oneOf
              [ bang (unsafeText di { id: me, parent, scope })
              , unsafeSetText di me txt
              ]
          )
          k
    )

blank :: forall lock payload. Element lock payload
blank = Element go
  where
  go { parent, scope, raiseId } (DOMInterpret { ids, makeNoop }) = keepLatest
    ( (sample_ ids (bang unit)) <#> \me -> makeEvent \k -> do
        raiseId me
        subscribe
          (bang (makeNoop { id: me, parent, scope }))
          k
    )

text_ :: forall lock payload. String -> Element lock payload
text_ txt = text (bang txt)

deku
  :: forall payload
   . Web.DOM.Element
  -> (forall lock. Event (Event (StreamingElt lock payload)))
  -> DOMInterpret payload
  -> Event payload
deku root children di@(DOMInterpret { ids, makeRoot }) =
  keepLatest
    ( (sample_ ids (bang unit)) <#> \me ->
        bang (makeRoot { id: me, root })
          <|> __internalDekuFlatten me di (proof (coerce children))
    )

deku0
  :: forall payload
   . Web.DOM.Element
  -> (forall lock. Event (Event (Element lock payload)))
  -> DOMInterpret payload
  -> Event payload
deku0 root children = deku root ((map <<< map) Elt children)

deku1
  :: forall payload
   . Web.DOM.Element
  -> (forall lock. Event (Element lock payload))
  -> DOMInterpret payload
  -> Event payload
deku1 root children = deku root (bang (map Elt children))

deku2
  :: forall payload
   . Web.DOM.Element
  -> (forall lock. Element lock payload)
  -> DOMInterpret payload
  -> Event payload
deku2 root children = deku1 root (bang children)

dekuA
  :: forall payload
   . Web.DOM.Element
  -> (forall lock. Array (Element lock payload))
  -> DOMInterpret payload
  -> Event payload
dekuA root children = deku root
  (oneOfMap bang (map (bang <<< Elt) children))
