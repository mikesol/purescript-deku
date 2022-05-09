module Deku.Control
  ( elementify
  , text
  , text_
  , deku
  , deku1
  , deku2
  , dekuA
  , globalPortal
  , portal
  , switcher
  , __internalDekuFlatten
  ) where

import Prelude

import Control.Alt ((<|>))
import Control.Lazy (fix)
import Control.Monad.ST.Class (class MonadST, liftST)
import Control.Monad.ST.Internal as Ref
import Control.Plus (empty)
import Data.Filterable (filter)
import Data.Foldable (foldl, oneOfMap, for_, oneOf, traverse_)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Maybe (Maybe(..))
import Data.Tuple (snd)
import Data.Tuple.Nested (type (/\), (/\))
import Data.Vec (toArray, Vec)
import Deku.Attribute (Attribute, AttributeValue(..), unsafeUnAttribute)
import Deku.Core (Child(..), DOMInterpret(..), Domable(..), DynamicChildren(..), Element(..), EventfulElement(..), FixedChildren(..))
import Deku.Core (Child(..), DOMInterpret(..), Domable(..), DynamicChildren(..), Element(..), EventfulElement(..), FixedChildren(..), PSR)
import FRP.Event (AnEvent, bang, keepLatest, makeEvent, mapAccum, memoize, subscribe)
import FRP.Event (AnEvent, keepLatest, makeEvent, subscribe)
import Foreign.Object as Object
import Type.Equality (class TypeEquals)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM as Web.DOM

----
unsafeElement
  :: forall m payload
   . DOMInterpret m payload
  -> { id :: String, parent :: String, scope :: String, tag :: String }
  -> payload
unsafeElement (DOMInterpret { makeElement }) = makeElement

unsafeText
  :: forall m payload
   . DOMInterpret m payload
  -> { id :: String, parent :: String, scope :: String }
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

elementify
  :: forall s m element lock payload
   . MonadST s m
  => String
  -> AnEvent m (Attribute element)
  -> Domable m lock payload
  -> Element m lock payload
elementify tag atts children = Element go
  where
  go { parent, scope, raiseId } di@(DOMInterpret { ids, deleteFromCache }) =
    makeEvent \k -> do
      me <- ids
      raiseId me
      map ((*>) (k (deleteFromCache { id: me }))) $ subscribe
        ( ( oneOf
              [ bang (unsafeElement di { id: me, parent, scope, tag })
              , unsafeSetAttribute di me atts
              ]
          )
            <|> __internalDekuFlatten
              { parent: me, scope, raiseId: \_ -> pure unit }
              di
              children
        )
        k

newtype MutAr a = MutAr (Array a)

foreign import mutAr :: forall m a. Array a -> m (MutAr a)
foreign import unsafeUpdateMutAr :: forall m a. Int -> a -> MutAr a -> m Unit
foreign import readAr :: forall m a. MutAr a -> m (Array a)

deleteMeASAP
  :: forall m lock0 lock1 payload0 payload1
   . TypeEquals lock0 lock1
  => TypeEquals payload0 payload1
  => Domable m lock0 payload0
  -> Domable m lock1 payload1
deleteMeASAP = unsafeCoerce

internalPortal
  :: forall n s m lock0 lock1 payload
   . MonadST s m
  => Boolean
  -> (String -> String)
  -> Vec n (Domable m lock0 payload)
  -> ( Vec n (Domable m lock1 payload)
       -> (Domable m lock0 payload -> Domable m lock1 payload)
       -> Domable m lock1 payload
     )
  -> Domable m lock0 payload
internalPortal isGlobal scopeF gaga closure = Element' $ Element go
  where
  go psr di@(DOMInterpret { deleteFromCache }) = makeEvent \k -> do
    av <- mutAr (map (const "") $ toArray gaga)
    let
      actualized = oneOf $ mapWithIndex
        ( \ix -> fix \f i -> case i of
            Element' (Element gogo) -> gogo
              { parent: "@portal@"
              , scope: scopeF psr.scope
              , raiseId: \id -> unsafeUpdateMutAr ix id av
              }
              di
            _ -> f (Element' (elementify "div" empty i))
        )
        gaga
    u0 <- subscribe actualized k
    av2 <- liftST $ Ref.new (pure unit)
    let
      asIds :: Array String -> Vec n String
      asIds = unsafeCoerce
    idz <- asIds <$> readAr av
    let
      -- we never connect or disconnect the referentially opaque node
      -- instead, it is always managed inside a referentially transparent node
      -- that can be properly connected and disconnected
      injectable = map
        ( \id -> Element' $ Element
            \{ parent, scope, raiseId } (DOMInterpret { giveNewParent }) ->
              makeEvent \k2 -> do
                raiseId id
                k2 (giveNewParent { id, parent, scope })
                pure (pure unit)
        )
        idz
      realized = __internalDekuFlatten psr di
        ( deleteMeASAP
            ( closure injectable
                ( unsafeCoerce
                    :: Domable m lock0 payload -> Domable m lock1 payload
                )
            )
        )
    u <- subscribe realized k
    void $ liftST $ Ref.write u av2
    -- cancel immediately, as it should be run synchronously
    -- so if this actually does something then we have a problem
    pure do
      u0
      when (not isGlobal) $ for_ (toArray idz) \id -> k
        (deleteFromCache { id })
      join (liftST $ Ref.read av2)

globalPortal
  :: forall n s m lock payload
   . MonadST s m => Vec n (Domable m lock payload)
  -> (Vec n (Domable m lock payload) -> Domable m lock payload)
  -> Domable m lock payload
globalPortal e f = internalPortal true (const "@portal@") e (\x _ -> f x)

portal
  :: forall n s m lock0 payload
   . MonadST s m =>Vec n (Domable m lock0 payload)
  -> ( forall lock1
        . Vec n (Domable m lock1 payload)
       -> (Domable m lock0 payload -> Domable m lock1 payload)
       -> Domable m lock1 payload
     )
  -> Domable m lock0 payload
portal e = internalPortal false identity e

text
  :: forall m lock payload
   . Monad m
  => AnEvent m String
  -> Domable m lock payload
text txt = Element' $ Element go
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
   . MonadST s m
  => Web.DOM.Element
  -> (forall lock. Domable m lock payload)
  -> DOMInterpret m payload
  -> AnEvent m payload
deku root children di@(DOMInterpret { ids, makeRoot }) = makeEvent \k -> do
  me <- ids
  subscribe
    ( bang (makeRoot { id: me, root })
        <|> __internalDekuFlatten
          { parent: me, scope: "rootScope", raiseId: \_ -> pure unit }
          di
          (deleteMeASAP children)
    )
    k

deku1
  :: forall s m payload
   . MonadST s m
  => Web.DOM.Element
  -> (forall lock. AnEvent m (Domable m lock payload))
  -> DOMInterpret m payload
  -> AnEvent m payload
deku1 root children = deku root (EventfulElement' $ EventfulElement children)

deku2
  :: forall s m payload
   . MonadST s m
  => Web.DOM.Element
  -> (forall lock. Element m lock payload)
  -> DOMInterpret m payload
  -> AnEvent m payload
deku2 root children = deku root (Element' children)

dekuA
  :: forall s m payload
   . MonadST s m
  => Web.DOM.Element
  -> (forall lock. Array (Domable m lock payload))
  -> DOMInterpret m payload
  -> AnEvent m payload
dekuA root children = deku root (FixedChildren' $ FixedChildren children)

switcher
  :: forall s m i lock payload
   . MonadST s m
  => (i -> Domable m lock payload)
  -> AnEvent m i
  -> Domable m lock payload
switcher f event = DynamicChildren' $ DynamicChildren $ keepLatest
  $ memoize (counter event) \cenv -> map
    ( \(p /\ n) -> bang (Insert $ f p) <|>
        ((const Remove) <$> filter (eq (n + 1) <<< snd) cenv)
    )
    cenv
  where

  counter :: forall a. AnEvent m a → AnEvent m (a /\ Int)
  counter ev = mapAccum fn ev 0
    where
    fn a b = (b + 1) /\ (a /\ b)

data Stage = Begin | Middle | End

__internalDekuFlatten
  :: forall s m lock payload
   . Applicative m
  => MonadST s m
  => PSR m
  -> DOMInterpret m payload
  -> Domable m lock payload
  -> AnEvent m payload
__internalDekuFlatten
  psr
  di@(DOMInterpret { ids, disconnectElement, sendToTop }) = case _ of
  FixedChildren' (FixedChildren f) -> oneOfMap (__internalDekuFlatten psr di) f
  EventfulElement' (EventfulElement e) -> keepLatest
    (map (__internalDekuFlatten psr di) e)
  Element' e -> element e
  DynamicChildren' (DynamicChildren children) ->
    makeEvent \(k :: payload -> m Unit) -> do
      cancelInner <- liftST $ Ref.new Object.empty
      cancelOuter <-
        -- each child gets its own scope
        subscribe children \inner ->
          do
            -- holds the previous id
            myUnsubId <- ids
            myUnsub <- liftST $ Ref.new (pure unit)
            eltsUnsubId <- ids
            eltsUnsub <- liftST $ Ref.new (pure unit)
            myId <- liftST $ Ref.new Nothing
            myImmediateCancellation <- liftST $ Ref.new (pure unit)
            myScope <- ids
            stageRef <- liftST $ Ref.new Begin
            c0 <- subscribe inner \kid' -> do
              stage <- liftST $ Ref.read stageRef
              case kid', stage of
                SendToTop, Middle -> (liftST $ Ref.read myId) >>= traverse_
                  (k <<< sendToTop <<< { id: _ })
                Remove, Middle -> do
                  void $ liftST $ Ref.write End stageRef
                  let
                    mic =
                      ( (liftST $ Ref.read myId) >>= traverse_ \old ->
                          k
                            ( disconnectElement
                                { id: old, parent: psr.parent, scope: myScope }
                            )
                      ) *> join (liftST $ Ref.read myUnsub)
                        *> join (liftST $ Ref.read eltsUnsub)
                        *>
                          ( void $ liftST $ Ref.modify
                              (Object.delete myUnsubId)
                              cancelInner
                          )
                        *>
                          ( void $ liftST $ Ref.modify
                              (Object.delete eltsUnsubId)
                              cancelInner
                          )
                  (void $ liftST $ Ref.write mic myImmediateCancellation) *> mic
                Insert kid, Begin -> do
                  -- holds the current id
                  void $ liftST $ Ref.write Middle stageRef
                  c1 <- subscribe
                    ( __internalDekuFlatten
                        { parent: psr.parent
                        , scope: myScope
                        , raiseId: \id -> do
                            void $ liftST $ Ref.write (Just id) myId
                        }
                        di
                        -- hack to make sure that kid only ever raises its
                        -- ID once
                        -- if it is anything other than an element we wrap it in one
                        -- otherwise, we'd risk raising many ids to a parent
                        case kid of
                          Element' _ -> kid
                          _ -> Element' $ elementify "div" empty kid
                    )
                    k
                  void $ liftST $ Ref.modify (Object.insert eltsUnsubId c1)
                    cancelInner
                  void $ liftST $ Ref.write c1 eltsUnsub
                _, _ -> pure unit
            void $ liftST $ Ref.write c0 myUnsub
            void $ liftST $ Ref.modify (Object.insert myUnsubId c0) cancelInner
            join (liftST $ Ref.read myImmediateCancellation)
      pure do
        (liftST $ Ref.read cancelInner) >>= foldl (*>) (pure unit)
        cancelOuter
  where
  element (Element e) = e psr di