module Deku.Internal
  ( __internalDekuFlatten
  ) where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (fold, oneOfMap, traverse_)
import Data.Maybe (Maybe(..))
import Deku.Core (Child(..), DOMInterpret(..), Domable(..), DynamicChildren(..), Element(..), EventfulElement(..), FixedChildren(..))
import Effect.AVar (tryPut)
import Effect.AVar as AVar
import Effect.Exception (throwException)
import Effect.Ref as Ref
import FRP.Event (Event, keepLatest, makeEvent, subscribe)
import Foreign.Object as Object

data Stage = Begin | Middle | End

__internalDekuFlatten
  :: forall lock payload
   . String
  -> DOMInterpret payload
  -> Domable lock payload
  -> Event payload
__internalDekuFlatten
  parent
  di@(DOMInterpret { ids, disconnectElement, sendToTop }) = case _ of
     FixedChildren' (FixedChildren f) -> oneOfMap element f
     EventfulElement' (EventfulElement e) -> keepLatest (map (__internalDekuFlatten parent di) e)
     Element' e -> element e
     DynamicChildren' (DynamicChildren children) ->
      makeEvent \k -> do
        cancelInner <- Ref.new Object.empty
        cancelOuter <-
          -- each child gets its own scope
          subscribe children \inner ->
            do
              -- holds the previous id
              myUnsubId <- ids
              myUnsub <- Ref.new (pure unit)
              eltsUnsubId <- ids
              eltsUnsub <- Ref.new (pure unit)
              myId <- Ref.new Nothing
              myImmediateCancellation <- Ref.new (pure unit)
              myScope <- ids
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
                                  { id: old, parent, scope: myScope }
                              )
                        ) *> join (Ref.read myUnsub)
                          *> join (Ref.read eltsUnsub)
                          *> Ref.modify_
                            (Object.delete myUnsubId)
                            cancelInner
                          *> Ref.modify_
                            (Object.delete eltsUnsubId)
                            cancelInner
                    Ref.write mic myImmediateCancellation *> mic
                  Insert (Element kid), Begin -> do
                    -- holds the current id
                    Ref.write Middle stageRef
                    av <- AVar.empty
                    c1 <- subscribe
                      ( kid
                          { parent
                          , scope: myScope
                          , raiseId: \id -> do
                              void $ tryPut id av
                          }
                          di
                      )
                      k
                    cncl <- AVar.take av \q -> case q of
                      Right r -> do
                        Ref.write (Just r) (myId)
                        Ref.modify_ (Object.insert eltsUnsubId c1) cancelInner
                        Ref.write c1 eltsUnsub
                      Left e -> throwException e
                    -- cancel immediately, as it should be run synchronously
                    -- so if this actually does something then we have a problem
                    cncl
                  -- ignore
                  _,
                  _ -> pure unit
              Ref.write c0 myUnsub
              Ref.modify_ (Object.insert myUnsubId c0) cancelInner
              join (Ref.read myImmediateCancellation)
        pure do
          Ref.read cancelInner >>= fold
          cancelOuter
  where
  element (Element e) = e
      { parent
      , scope: "trivial"
      , raiseId: mempty
      }
      di