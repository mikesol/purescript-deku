module Deku.Control
  ( elementify
  , sendToTop
  , text
  , bus
  , text_
  , deku
  , deku1
  , deku2
  , dekuA
  , blank
  , portal
  , class Portal
  , Bus(..)
  -----
  , flatten
  ) where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Array (cons)
import Data.Either (Either(..))
import Data.Exists (Exists, runExists)
import Data.Foldable (for_, oneOf, oneOfMap, traverse_)
import Data.Maybe (Maybe(..), maybe)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (Attribute, unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Element(..))
import Effect (Effect, foreachE)
import Effect.AVar (tryPut)
import Effect.AVar as AVar
import Effect.Exception (throwException)
import Effect.Ref as Ref
import Effect.Unsafe (unsafePerformEffect)
import FRP.Behavior (sampleBy, sample_)
import FRP.Event (Event, EventIO, create, keepLatest, makeEvent, subscribe)
import FRP.Event.Class (bang)
import Safe.Coerce (coerce)
import Type.Equality (class TypeEquals, proof)
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

flatten
  :: forall lock payload
   . String
  -> DOMInterpret payload
  -> Event (Event (Element lock payload))
  -> Event payload
flatten parent di@(DOMInterpret { ids, disconnectElement }) children =
  makeEvent \k -> do
    cancelInner <- Ref.new []
    cancelOuter <-
      -- each child gets its own scope
      subscribe children \inner ->
        do
          -- holds the previous id
          prevId <- Ref.new Nothing
          prevUnsub <- Ref.new (pure unit :: Effect Unit)
          c0 <- subscribe (sampleBy (/\) ids inner) \(newScope /\ Element kid) -> do
            -- holds the current id
            av <- AVar.empty
            predecessor <- Ref.read prevId
            c1 <- subscribe
              ( kid
                  { parent
                  , scope: newScope
                  , predecessor
                  , raiseId: \id -> do
                      Ref.read prevId >>= traverse_ \old ->
                        k
                          ( disconnectElement
                              { id: old, parent, scope: newScope }
                          )
                      void $ tryPut id av
                  }
                  di
              )
              k
            cncl <- AVar.take av \q -> case q of
              Right r -> do
                Ref.write r prevId
                join (Ref.read prevUnsub)
                Ref.write c1 prevUnsub
              Left e -> throwException e
            -- cancel immediately, as it should be run synchronously
            -- so if this actually does something then we have a problem
            cncl
          Ref.modify_ (cons c0) cancelInner
    pure do
      Ref.read cancelInner >>= flip foreachE identity
      cancelOuter

elementify
  :: forall element lock payload
   . String
  -> Event (Attribute element)
  -> Event (Event (Element lock payload))
  -> Element lock payload
elementify tag atts children = Element go
  where
  go { parent, scope, raiseId } di@(DOMInterpret { ids }) = keepLatest
    ( (sample_ ids (bang unit)) <#> \me -> makeEvent \k -> do
        raiseId (Just me)
        subscribe
          ( ( oneOf
                [ bang (unsafeElement di { id: me, parent, scope, tag })
                , unsafeSetAttribute di me atts
                ]
            )
              <|> flatten me di children
          )
          k
    )

class Portal i o | i -> o where
  portal :: o -> (o -> i) -> o

instance
  ( TypeEquals locki locko
  , TypeEquals payloadi payloado
  ) =>
  Portal (Event (Event (Element locki payloadi))) (Element locko payloado) where
  portal (Element gogo) closure = Element go
    where
    go psr di = makeEvent \k -> do
      av <- AVar.empty
      let
        actualized = gogo
          { parent: "@portal@"
          , scope: "@portal@"
          , predecessor: Nothing
          , raiseId: \id -> void $ tryPut id av
          }
          di
      u0 <- subscribe actualized k
      av2 <- AVar.empty
      cncl <- AVar.take av \q -> case q of
        Right id' -> for_ id' \id -> do
          let
            injectable = Element
              \{ parent } (DOMInterpret { giveNewParent }) ->
                bang (giveNewParent { id, parent })
            realized = flatten psr.parent di
              (proof (coerce (closure injectable)))
          u <- subscribe realized k
          void $ tryPut u av2
        Left e -> throwException e
      -- cancel immediately, as it should be run synchronously
      -- so if this actually does something then we have a problem
      cncl
      pure do
        u0
        cncl2 <- AVar.take av2 \q -> case q of
          Right u -> u
          Left e -> throwException e
        -- cancel immediately, as it should be run synchronously
        -- so if this actually does something then we have a problem
        cncl2

instance
  ( TypeEquals locki locko
  , TypeEquals payloadi payloado
  ) =>
  Portal (Event (Element locki payloadi))
    (Element locko payloado) where
  portal a b = portal a (map (bang :: _ -> Event _) b)

instance
  ( TypeEquals locki locko
  , TypeEquals payloadi payloado
  ) =>
  Portal (Element locki payloadi)
    (Element locko payloado) where
  portal a b = portal a
    (map ((bang :: _ -> Event _) <<< (bang :: _ -> Event _)) b)

instance
  ( TypeEquals locki locko
  , TypeEquals payloadi payloado
  ) =>
  Portal (Array (Element locki payloadi))
    (Element locko payloado) where
  portal a b = portal a
    ( map
        ( \children -> oneOfMap (bang :: _ -> Event _)
            (map (bang :: _ -> Event _) children)
        )
        b
    )

sendToTop :: forall lock payload. Element lock payload
sendToTop = Element go
  where
  go
    { raiseId, predecessor }
    (DOMInterpret { sendToTop: stt }) = makeEvent \k -> do
    raiseId predecessor
    subscribe
      (maybe empty (bang <<< stt <<< { id: _ }) predecessor)
      k

text
  :: forall lock payload
   . Event String
  -> Element lock payload
text txt = Element go
  where
  go { parent, scope, raiseId } di@(DOMInterpret { ids }) = keepLatest
    ( (sample_ ids (bang unit)) <#> \me -> makeEvent \k -> do
        raiseId (Just me)
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
        raiseId (Just me)
        subscribe
          (bang (makeNoop { id: me, parent, scope }))
          k
    )

text_ :: forall lock payload. String -> Element lock payload
text_ txt = text (bang txt)

deku
  :: forall payload
   . Web.DOM.Element
  -> (forall lock. Event (Event (Element lock payload)))
  -> DOMInterpret payload
  -> Event payload
deku root children di@(DOMInterpret { ids, makeRoot }) =
  keepLatest
    ( (sample_ ids (bang unit)) <#> \me ->
        bang (makeRoot { id: me, root })
          <|> flatten me di (proof (coerce children))
    )

deku1
  :: forall payload
   . Web.DOM.Element
  -> (forall lock. Event (Element lock payload))
  -> DOMInterpret payload
  -> Event payload
deku1 root children = deku root (bang children)

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
  (oneOfMap bang (map bang children))

newtype Bus r a = Bus (EventIO a -> r)

bus :: forall r. Exists (Bus r) -> r
bus = runExists (\(Bus x) -> x (unsafePerformEffect create))