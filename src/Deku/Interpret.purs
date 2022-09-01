module Deku.Interpret
  ( FFIDOMSnapshot
  , fullDOMInterpret
  , makeFFIDOMSnapshot
  , ssrDOMInterpret
  , hydratingDOMInterpret
  , Instruction(..)
  , setHydrating
  , unSetHydrating
  ) where

import Prelude

import Control.Monad.ST (ST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Global as Region
import Control.Monad.ST.Internal as Ref
import Data.Maybe (Maybe(..), maybe)
import Deku.Core as Core
import Effect (Effect)
import Test.QuickCheck (arbitrary, mkSeed)
import Test.QuickCheck.Gen (Gen, evalGen)

-- foreign
data FFIDOMSnapshot

foreign import makeFFIDOMSnapshot :: Effect FFIDOMSnapshot

type RunOnJust = forall a. Maybe a -> (a -> Effect Boolean) -> Effect Boolean

runOnJust :: RunOnJust
runOnJust (Just a) f = f a
runOnJust _ _ = pure false

foreign import makeElement_
  :: RunOnJust
  -> Boolean
  -> Core.MakeElement
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import attributeParent_
  :: RunOnJust
  -> Core.AttributeParent
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import makeRoot_
  :: Core.MakeRoot
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import makeText_
  :: RunOnJust
  -> Boolean
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
  :: RunOnJust
  -> Boolean
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
  :: Ref.STRef Region.Global Int -> Core.DOMInterpret (FFIDOMSnapshot -> Effect Unit)
fullDOMInterpret seed = Core.DOMInterpret
  { ids: do
      s <- Ref.read seed
      let
        o = show
          (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
      void $ Ref.modify (add 1) seed
      pure o
  , makeElement: makeElement_ runOnJust false
  , attributeParent: attributeParent_ runOnJust
  , makeRoot: makeRoot_
  , makeText: makeText_ runOnJust false (maybe unit)
  , makePursx: makePursx_ runOnJust false (maybe unit)
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
  :: forall r. Core.MakeElement -> Ref.STRef r (Array Instruction) -> ST r Unit
ssrMakeElement a i = void $ Ref.modify (_ <> [ MakeElement a ]) i

ssrMakeText
  :: forall r. Core.MakeText -> Ref.STRef r (Array Instruction) -> ST r Unit
ssrMakeText a i = void $ Ref.modify (_ <> [ MakeText a ]) i

ssrMakePursx
  :: forall r. Core.MakePursx -> Ref.STRef r (Array Instruction) -> ST r Unit
ssrMakePursx a i = void $ Ref.modify (_ <> [ MakePursx a ]) i

ssrSetProp
  :: forall r. Core.SetProp -> Ref.STRef r (Array Instruction) -> ST r Unit
ssrSetProp a i = void $ Ref.modify (_ <> [ SetProp a ]) i

ssrSetText
  :: forall r. Core.SetText -> Ref.STRef r (Array Instruction) -> ST r Unit
ssrSetText a i = void $ Ref.modify (_ <> [ SetText a ]) i

ssrDOMInterpret
  :: Ref.STRef Global Int
  -> Core.DOMInterpret (Ref.STRef Global (Array Instruction) -> ST Global Unit)
ssrDOMInterpret seed = Core.DOMInterpret
  { ids: do
      s <- Ref.read seed
      let
        o = show
          (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
      void $ Ref.modify (add 1) seed
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
  :: Ref.STRef Region.Global Int -> Core.DOMInterpret (FFIDOMSnapshot -> Effect Unit)
hydratingDOMInterpret seed = Core.DOMInterpret
  { ids: do
      s <- Ref.read seed
      let
        o = show
          (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
      void $ Ref.modify (add 1) seed
      pure o
  , makeElement: makeElement_ runOnJust true
  , attributeParent: attributeParent_ runOnJust
  , makeRoot: makeRoot_
  , makeText: makeText_ runOnJust true (maybe unit)
  , makePursx: makePursx_ runOnJust true (maybe unit)
  , setProp: setProp_ true
  , setCb: setCb_ true
  , setText: setText_
  , sendToPos: sendToPos_
  , deleteFromCache: deleteFromCache_
  , giveNewParent: giveNewParent_
  , disconnectElement: disconnectElement_
  }