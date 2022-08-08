module Deku.Interpret
  ( FFIDOMSnapshot
  , fullDOMInterpret
  , makeFFIDOMSnapshot
  , mermaidDOMInterpret
  , Instruction(..)
  , setHydrating
  , unSetHydrating
  ) where

import Prelude

import Control.Monad.ST (ST)
import Control.Monad.ST.Internal as RRef
import Data.Maybe (Maybe, maybe)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Core as Core
import Effect (Effect)
import Effect.Ref as Ref
import Mermaid (Mermaid, liftImpure, liftPure)
import Test.QuickCheck (arbitrary, mkSeed)
import Test.QuickCheck.Gen (Gen, evalGen)

-- foreign
data FFIDOMSnapshot

foreign import makeFFIDOMSnapshot :: Effect FFIDOMSnapshot

foreign import makeElement_
  :: Boolean
  -> Core.MakeElement
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import attributeParent_
  :: Core.AttributeParent
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import makeRoot_
  :: Core.MakeRoot
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import makeText_
  :: Boolean
  -> (forall a. (a -> Unit) -> Maybe a -> Unit)
  -> Core.MakeText
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import setText_
  :: Core.SetText
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import setProp_
  :: Boolean -> Core.SetProp -> FFIDOMSnapshot -> Effect Unit

foreign import setCb_
  :: Boolean -> Core.SetCb -> FFIDOMSnapshot -> Effect Unit

foreign import makePursx_
  :: Boolean
  -> (forall a. (a -> Unit) -> Maybe a -> Unit)
  -> Core.MakePursx
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import deleteFromCache_
  :: Core.DeleteFromCache -> FFIDOMSnapshot -> Effect Unit

foreign import giveNewParent_
  :: Core.GiveNewParent -> FFIDOMSnapshot -> Effect Unit

foreign import disconnectElement_
  :: Core.DisconnectElement -> FFIDOMSnapshot -> Effect Unit

foreign import sendToPos_ :: Core.SendToPos -> FFIDOMSnapshot -> Effect Unit

foreign import setHydrating :: FFIDOMSnapshot -> Effect Unit
foreign import unSetHydrating :: FFIDOMSnapshot -> Effect Unit

fullDOMInterpret
  :: Ref.Ref Int -> Core.DOMInterpret Effect (FFIDOMSnapshot -> Effect Unit)
fullDOMInterpret seed = Core.DOMInterpret
  { ids: do
      s <- Ref.read seed
      let
        o = show
          (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
      void $ Ref.modify (add 1) seed
      pure o
  , makeElement: makeElement_ false
  , attributeParent: attributeParent_
  , makeRoot: makeRoot_
  , makeText: makeText_ false (maybe unit)
  , makePursx: makePursx_ false (maybe unit)
  , setProp: setProp_ false
  , setCb: setCb_ false
  , setText: setText_
  , sendToPos: sendToPos_
  , deleteFromCache: deleteFromCache_
  , giveNewParent: giveNewParent_
  , disconnectElement: disconnectElement_
  }

data Instruction
  = MakeElement Core.MakeElement
  | MakeText Core.MakeText
  | MakePursx Core.MakePursx
  | SetProp Core.SetProp
  | SetText Core.SetText

ssrMakeElement
  :: forall r. Core.MakeElement -> RRef.STRef r (Array Instruction) -> ST r Unit
ssrMakeElement a i = void $ RRef.modify (_ <> [ MakeElement a ]) i

ssrMakeText
  :: forall r. Core.MakeText -> RRef.STRef r (Array Instruction) -> ST r Unit
ssrMakeText a i = void $ RRef.modify (_ <> [ MakeText a ]) i

ssrMakePursx
  :: forall r. Core.MakePursx -> RRef.STRef r (Array Instruction) -> ST r Unit
ssrMakePursx a i = void $ RRef.modify (_ <> [ MakePursx a ]) i

ssrSetProp
  :: forall r. Core.SetProp -> RRef.STRef r (Array Instruction) -> ST r Unit
ssrSetProp a i = void $ RRef.modify (_ <> [ SetProp a ]) i

ssrSetText
  :: forall r. Core.SetText -> RRef.STRef r (Array Instruction) -> ST r Unit
ssrSetText a i = void $ RRef.modify (_ <> [ SetText a ]) i

mermaidDOMInterpret
  :: forall r
   . RRef.STRef r Int
  -> Core.DOMInterpret (Mermaid r)
       (RRef.STRef r (Array Instruction) /\ FFIDOMSnapshot -> Mermaid r Unit)
mermaidDOMInterpret seed = Core.DOMInterpret
  { ids: liftPure do
      seed' <- RRef.read seed
      let
        o = show $ evalGen (arbitrary :: Gen Int)
          { newSeed: mkSeed seed', size: 5 }
      void $ RRef.modify (add 1) seed
      pure o
  , makeElement: \a (b /\ c) -> do
      liftImpure $ makeElement_ true a c
      liftPure $ ssrMakeElement a b
  , attributeParent: \a (_ /\ c) -> do
      liftImpure $ attributeParent_ a c
  , makeRoot: \a (_ /\ c) -> do
      liftImpure $ makeRoot_ a c
  , makeText: \a (b /\ c) -> do
      liftImpure $ makeText_ true (maybe unit) a c
      liftPure $ ssrMakeText a b
  , makePursx: \a (b /\ c) -> do
      liftImpure $ makePursx_ true (maybe unit) a c
      liftPure $ ssrMakePursx a b
  , setProp: \a (b /\ c) -> do
      liftImpure $ setProp_ true a c
      liftPure $ ssrSetProp a b
  , setCb: \a (_ /\ c) -> do
      liftImpure $ setCb_ true a c
  , setText: \a (b /\ c) -> do
      liftImpure $ setText_ a c
      liftPure $ ssrSetText a b
  , sendToPos: \a (_ /\ c) -> do
      liftImpure $ sendToPos_ a c
  , deleteFromCache: \a (_ /\ c) -> do
      liftImpure $ deleteFromCache_ a c
  , giveNewParent: \a (_ /\ c) -> do
      liftImpure $ giveNewParent_ a c
  , disconnectElement: \a (_ /\ c) -> do
      liftImpure $ disconnectElement_ a c
  }
