module Deku.Interpret
  ( FFIDOMSnapshot
  , fullDOMInterpret
  , makeFFIDOMSnapshot
  , ssrDOMInterpret
  , hydratingDOMInterpret
  , Instruction(..)
  ) where

import Prelude

import Control.Monad.ST (ST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as RRef
import Deku.Core as Core
import Effect (Effect)
import Effect.Ref as Ref
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

foreign import makeRoot_
  :: Core.MakeRoot
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import makeText_
  :: Boolean
  -> Core.MakeText
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import setText_
  :: Core.SetText
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import setProp_
  :: Core.SetProp -> FFIDOMSnapshot -> Effect Unit

foreign import setCb_
  :: Core.SetCb -> FFIDOMSnapshot -> Effect Unit

foreign import makePursx_
  :: Boolean
  -> Core.MakePursx
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import deleteFromCache_
  :: Core.DeleteFromCache -> FFIDOMSnapshot -> Effect Unit

foreign import giveNewParent_
  :: Core.GiveNewParent -> FFIDOMSnapshot -> Effect Unit

foreign import disconnectElement_
  :: Core.DisconnectElement -> FFIDOMSnapshot -> Effect Unit

foreign import sendToTop_ :: Core.SendToTop -> FFIDOMSnapshot -> Effect Unit

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
  , makeRoot: makeRoot_
  , makeText: makeText_ false
  , makePursx: makePursx_ false
  , setProp: setProp_
  , setCb: setCb_
  , setText: setText_
  , sendToTop: sendToTop_
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
  :: Core.MakeElement -> RRef.STRef Global (Array Instruction) -> ST Global Unit
ssrMakeElement a i = void $ RRef.modify (_ <> [ MakeElement a ]) i

ssrMakeText
  :: Core.MakeText -> RRef.STRef Global (Array Instruction) -> ST Global Unit
ssrMakeText a i = void $ RRef.modify (_ <> [ MakeText a ]) i

ssrMakePursx
  :: Core.MakePursx -> RRef.STRef Global (Array Instruction) -> ST Global Unit
ssrMakePursx a i = void $ RRef.modify (_ <> [ MakePursx a ]) i

ssrSetProp
  :: Core.SetProp -> RRef.STRef Global (Array Instruction) -> ST Global Unit
ssrSetProp a i = void $ RRef.modify (_ <> [ SetProp a ]) i

ssrSetText
  :: Core.SetText -> RRef.STRef Global (Array Instruction) -> ST Global Unit
ssrSetText a i = void $ RRef.modify (_ <> [ SetText a ]) i

ssrDOMInterpret
  :: RRef.STRef Global Int
  -> Core.DOMInterpret (ST Global)
       (RRef.STRef Global (Array Instruction) -> ST Global Unit)
ssrDOMInterpret seed = Core.DOMInterpret
  { ids: do
      s <- RRef.read seed
      let
        o = show
          (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
      void $ RRef.modify (add 1) seed
      pure o
  , makeElement: ssrMakeElement
  , makeRoot: \_ _ -> pure unit
  , makeText: ssrMakeText
  , makePursx: ssrMakePursx
  , setProp: ssrSetProp
  , setCb: \_ _ -> pure unit
  , setText: ssrSetText
  , sendToTop: \_ _ -> pure unit
  , deleteFromCache: \_ _ -> pure unit
  , giveNewParent: \_ _ -> pure unit
  , disconnectElement: \_ _ -> pure unit
  }

hydratingDOMInterpret
  :: Ref.Ref Int -> Core.DOMInterpret Effect (FFIDOMSnapshot -> Effect Unit)
hydratingDOMInterpret seed = Core.DOMInterpret
  { ids: do
      s <- Ref.read seed
      let
        o = show
          (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
      void $ Ref.modify (add 1) seed
      pure o
  , makeElement: makeElement_ true
  , makeRoot: makeRoot_
  , makeText: makeText_ true
  , makePursx: makePursx_ true
  , setProp: setProp_
  , setCb: setCb_
  , setText: setText_
  , sendToTop: sendToTop_
  , deleteFromCache: deleteFromCache_
  , giveNewParent: giveNewParent_
  , disconnectElement: disconnectElement_
  }