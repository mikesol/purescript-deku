module Deku.Internal
  ( __internalDekuFlatten
  ) where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (fold, traverse_)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Core (DOMInterpret(..), Element(..), StreamingElt(..))
import Effect.AVar (tryPut)
import Effect.AVar as AVar
import Effect.Exception (throwException)
import Effect.Random as Random
import Effect.Ref as Ref
import FRP.Behavior (sampleBy)
import FRP.Event (Event, makeEvent, subscribe)
import Foreign.Object as Object

__internalDekuFlatten
  :: forall lock payload
   . String
  -> DOMInterpret payload
  -> Event (Event (StreamingElt lock payload))
  -> Event payload
__internalDekuFlatten parent di@(DOMInterpret { ids, disconnectElement, sendToTop }) children =
  makeEvent \k -> do
    cancelInner <- Ref.new Object.empty
    cancelOuter <-
      -- each child gets its own scope
      subscribe children \inner ->
        do
          -- holds the previous id
          prevId <- Ref.new Nothing
          prevUnsub <- Ref.new (pure unit)
          myUnsub <- Ref.new (pure unit)
          myImmediateCancellation <- Ref.new (pure unit)
          rn <- map show Random.random
          c0 <- subscribe (sampleBy (/\) ids inner) \(newScope /\ kid') ->
            case kid' of
              SendToTop -> Ref.read prevId >>= traverse_
                (k <<< sendToTop <<< { id: _ })
              Remove -> do
                let
                  mic =
                    ( Ref.read prevId >>= traverse_ \old ->
                        k
                          ( disconnectElement
                              { id: old, parent }
                          )
                    ) *> join (Ref.read myUnsub) *> join (Ref.read prevUnsub) *>
                      Ref.modify_
                        (Object.delete rn)
                        cancelInner
                Ref.write mic myImmediateCancellation *> mic
              Elt (Element kid) -> do
                -- holds the current id
                av <- AVar.empty
                c1 <- subscribe
                  ( kid
                      { parent
                      , scope: newScope
                      , raiseId: \id -> do
                          Ref.read prevId >>= traverse_ \old ->
                            k
                              ( disconnectElement
                                  { id: old, parent }
                              )
                          void $ tryPut id av
                      }
                      di
                  )
                  k
                cncl <- AVar.take av \q -> case q of
                  Right r -> do
                    Ref.write (Just r) (prevId)
                    join (Ref.read prevUnsub)
                    Ref.write c1 prevUnsub
                  Left e -> throwException e
                -- cancel immediately, as it should be run synchronously
                -- so if this actually does something then we have a problem
                cncl
          Ref.write c0 myUnsub
          Ref.modify_ (Object.insert rn c0) cancelInner
          join (Ref.read myImmediateCancellation)
    pure do
      Ref.read cancelInner >>= fold
      cancelOuter
