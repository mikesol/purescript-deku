module Deku.Internal
  ( __internalDekuFlatten
  ) where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (fold, traverse_)
import Data.Maybe (Maybe(..))
import Deku.Core (DOMInterpret(..), Element(..), StreamingElt(..))
import Effect.AVar (tryPut)
import Effect.AVar as AVar
import Effect.Exception (throwException)
import Effect.Ref as Ref
import FRP.Event (Event, makeEvent, subscribe)
import Foreign.Object as Object

data Stage = Begin | Middle | End

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
          eltsUnsub <- Ref.new (pure unit)
          myUnsub <- Ref.new (pure unit)
          myId <- Ref.new Nothing
          myImmediateCancellation <- Ref.new (pure unit)
          unsubId <- ids
          newScope <- ids
          stageRef <- Ref.new Begin
          c0 <- subscribe inner \kid' -> do
            stage <- Ref.read stageRef
            case kid', stage of
              SendToTop, Middle -> Ref.read myId >>= traverse_
                (k <<< sendToTop <<< { id: _ })
              Remove, Middle -> do
                Ref.write End stageRef
                let
                  mic =
                    ( Ref.read myId >>= traverse_ \old ->
                        k
                          ( disconnectElement
                              { id: old, parent }
                          )
                    ) *> join (Ref.read myUnsub) *> join (Ref.read eltsUnsub) *>
                      Ref.modify_
                        (Object.delete unsubId)
                        cancelInner
                Ref.write mic myImmediateCancellation *> mic
              Elt (Element kid), Begin -> do
                -- holds the current id
                Ref.write Middle stageRef
                av <- AVar.empty
                c1 <- subscribe
                  ( kid
                      { parent
                      , scope: newScope
                      , raiseId: \id -> do
                          void $ tryPut id av
                      }
                      di
                  )
                  k
                cncl <- AVar.take av \q -> case q of
                  Right r -> do
                    Ref.write (Just r) (myId)
                    join (Ref.read eltsUnsub)
                    Ref.write c1 eltsUnsub
                  Left e -> throwException e
                -- cancel immediately, as it should be run synchronously
                -- so if this actually does something then we have a problem
                cncl
              -- ignore
              _, _ -> pure unit
          Ref.write c0 myUnsub
          Ref.modify_ (Object.insert unsubId c0) cancelInner
          join (Ref.read myImmediateCancellation)
    pure do
      Ref.read cancelInner >>= fold
      cancelOuter
