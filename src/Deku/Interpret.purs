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
import Control.Monad.ST.Internal as RRef
import Data.Maybe (Maybe, maybe)
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

ssrDOMInterpret
  :: forall r
   . RRef.STRef r Int
  -> Core.DOMInterpret (ST r)
       (RRef.STRef r (Array Instruction) -> ST r Unit)
ssrDOMInterpret seed = Core.DOMInterpret
  { ids: do
      s <- RRef.read seed
      let
        o = show
          (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
      void $ RRef.modify (add 1) seed
      pure o
  , makeElement: ssrMakeElement
  , attributeParent: \_ _ -> pure unit
  , makeRoot: \_ _ -> pure unit
  , makeText: ssrMakeText
  , makePursx: ssrMakePursx
  , setProp: ssrSetProp
  , setCb: \_ _ -> pure unit
  , setText: ssrSetText
  , sendToPos: \_ _ -> pure unit
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
  , attributeParent: attributeParent_
  , makeRoot: makeRoot_
  , makeText: makeText_ true (maybe unit)
  , makePursx: makePursx_ true (maybe unit)
  , setProp: setProp_ true
  , setCb: setCb_ true
  , setText: setText_
  , sendToPos: sendToPos_
  , deleteFromCache: deleteFromCache_
  , giveNewParent: giveNewParent_
  , disconnectElement: disconnectElement_
  }