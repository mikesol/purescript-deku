-- | This module is for internal use only, and should only be consulted by people
-- | implementing a Deku backend. It is not part of the public API, and does not yet
-- | have documentation. If you are not implementing a Deku backend, please ping
-- | the #frp channel of the PureScript Discord. If enough people are implementing
-- | Deku backends, someone may document this stuff at some point.
module Deku.Interpret
  ( FFIDOMSnapshot
  , fullDOMInterpret
  , makeFFIDOMSnapshot
  , ssrDOMInterpret
  , hydratingDOMInterpret
  , Instruction(..)
  , EliminatableInstruction(..)
  , RenderableInstruction(..)
  , FunctionOfFFIDOMSnaphot(..)
  , setHydrating
  , unSetHydrating
  , getAllComments
  ) where

import Prelude

import Bolson.Core (Scope)
import Bolson.Core as Bolson
import Control.Monad.ST (ST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Global as Region
import Control.Monad.ST.Internal as Ref
import Control.Plus (empty)
import Data.Maybe (Maybe(..), maybe)
import Deku.Core (DomableF(..))
import Deku.Core as Core
import Effect (Effect)
import Safe.Coerce (coerce)
import Test.QuickCheck (arbitrary, mkSeed)
import Test.QuickCheck.Gen (Gen, evalGen)

-- foreign
data FFIDOMSnapshot

newtype FunctionOfFFIDOMSnaphot = FunctionOfFFIDOMSnaphot
  (FFIDOMSnapshot -> Effect Unit)

foreign import makeFFIDOMSnapshot :: Effect FFIDOMSnapshot

type RunOnJust = forall a. Maybe a -> (a -> Effect Boolean) -> Effect Boolean

runOnJust :: RunOnJust
runOnJust (Just a) f = f a
runOnJust _ _ = pure false

foreign import getAllComments :: FFIDOMSnapshot -> Effect Unit

foreign import makeElement_
  :: RunOnJust
  -> Boolean
  -> Core.MakeElement
  -> FunctionOfFFIDOMSnaphot

foreign import makeDynBeacon_
  :: RunOnJust
  -> Boolean
  -> Core.MakeDynBeacon
  -> FunctionOfFFIDOMSnaphot

foreign import removeDynBeacon_
  :: Core.RemoveDynBeacon
  -> FunctionOfFFIDOMSnaphot

foreign import attributeParent_
  :: RunOnJust
  -> Core.AttributeParent
  -> FunctionOfFFIDOMSnaphot

foreign import makeRoot_
  :: Core.MakeRoot
  -> FunctionOfFFIDOMSnaphot

foreign import makeText_
  :: RunOnJust
  -> Boolean
  -> (forall a. (a -> Unit) -> Maybe a -> Unit)
  -> Core.MakeText
  -> FunctionOfFFIDOMSnaphot

foreign import setText_
  :: Core.SetText
  -> FunctionOfFFIDOMSnaphot

foreign import setProp_
  :: Boolean -> Core.SetProp -> FunctionOfFFIDOMSnaphot

foreign import unsetAttribute_
  :: Boolean -> Core.UnsetAttribute -> FunctionOfFFIDOMSnaphot

foreign import setCb_
  :: Boolean -> Core.SetCb -> FunctionOfFFIDOMSnaphot

foreign import makePursx_
  :: RunOnJust
  -> Boolean
  -> (forall a. (a -> Unit) -> Maybe a -> Unit)
  -> Core.MakePursx
  -> FunctionOfFFIDOMSnaphot

foreign import deleteFromCache_
  :: Core.DeleteFromCache -> FunctionOfFFIDOMSnaphot

foreign import giveNewParent_
  :: (Int -> Maybe Int)
  -> RunOnJust
  -> Core.GiveNewParent FunctionOfFFIDOMSnaphot
  -> FunctionOfFFIDOMSnaphot

foreign import disconnectElement_
  :: Core.DisconnectElement -> FunctionOfFFIDOMSnaphot

foreign import setHydrating :: FunctionOfFFIDOMSnaphot
foreign import unSetHydrating :: FunctionOfFFIDOMSnaphot

foreign import getPos :: String -> FFIDOMSnapshot -> Effect (Maybe Int)
foreign import getDynFamily :: String -> FFIDOMSnapshot -> Effect (Maybe String)
foreign import getParent :: String -> FFIDOMSnapshot -> Effect String
foreign import getScope :: String -> FFIDOMSnapshot -> Effect Scope

fullDOMInterpret
  :: Ref.STRef Region.Global Int
  -> Core.DOMInterpret FunctionOfFFIDOMSnaphot
fullDOMInterpret seed = Core.DOMInterpret
  { ids: do
      s <- Ref.read seed
      let
        o = show
          (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
      void $ Ref.modify (add 1) seed
      pure o
  , makeElement: makeElement_ runOnJust false
  , makeDynBeacon: makeDynBeacon_ runOnJust false
  , attributeParent: attributeParent_ runOnJust
  , makeRoot: makeRoot_
  , makeText: makeText_ runOnJust false (maybe unit)
  , makePursx: makePursx_ runOnJust false (maybe unit)
  , setProp: setProp_ false
  , setCb: setCb_ false
  , unsetAttribute: unsetAttribute_ false
  , setText: setText_
  , sendToPos
  , removeDynBeacon: removeDynBeacon_
  , deleteFromCache: deleteFromCache_
  , giveNewParent: giveNewParent_ Just runOnJust
  , disconnectElement: disconnectElement_
  }

data RenderableInstruction
  = MakeElement Core.MakeElement
  | MakeText Core.MakeText
  | MakeOpenDynBeacon Core.MakeDynBeacon
  | MakeCloseDynBeacon Core.MakeDynBeacon
  | MakePursx Core.MakePursx
  | SetProp Core.SetProp
  | SetText Core.SetText
  | UnsetAttribute Core.UnsetAttribute

data EliminatableInstruction
  = SendToPos Core.SendToPos
  | MakeRoot Core.MakeRoot
  | GiveNewParent
      ( Core.GiveNewParent
          (Ref.STRef Global (Array Instruction) -> ST Global Unit)
      )
  | DisconnectElement Core.DisconnectElement
  | RemoveDynBeacon Core.RemoveDynBeacon
  | DeleteFromCache Core.DeleteFromCache

data Instruction
  = RenderableInstruction RenderableInstruction
  | EliminatableInstruction EliminatableInstruction

ssrMakeElement
  :: forall r. Core.MakeElement -> Ref.STRef r (Array Instruction) -> ST r Unit
ssrMakeElement a i = void $ Ref.modify
  (_ <> [ RenderableInstruction $ MakeElement a ])
  i

ssrMakeDynBeacon
  :: forall r
   . Core.MakeDynBeacon
  -> Ref.STRef r (Array Instruction)
  -> ST r Unit
ssrMakeDynBeacon a i = void $ Ref.modify
  ( _ <>
      [ RenderableInstruction $ MakeOpenDynBeacon a
      , RenderableInstruction $ MakeCloseDynBeacon a
      ]
  )
  i

ssrMakeText
  :: forall r. Core.MakeText -> Ref.STRef r (Array Instruction) -> ST r Unit
ssrMakeText a i = void $ Ref.modify
  (_ <> [ RenderableInstruction $ MakeText a ])
  i

ssrMakePursx
  :: forall r. Core.MakePursx -> Ref.STRef r (Array Instruction) -> ST r Unit
ssrMakePursx a i = void $ Ref.modify
  (_ <> [ RenderableInstruction $ MakePursx a ])
  i

ssrSetProp
  :: forall r. Core.SetProp -> Ref.STRef r (Array Instruction) -> ST r Unit
ssrSetProp a i = void $ Ref.modify (_ <> [ RenderableInstruction $ SetProp a ])
  i

ssrUnsetAttribute
  :: forall r
   . Core.UnsetAttribute
  -> Ref.STRef r (Array Instruction)
  -> ST r Unit
ssrUnsetAttribute a i = void $ Ref.modify
  (_ <> [ RenderableInstruction $ UnsetAttribute a ])
  i

ssrSetText
  :: forall r. Core.SetText -> Ref.STRef r (Array Instruction) -> ST r Unit
ssrSetText a i = void $ Ref.modify (_ <> [ RenderableInstruction $ SetText a ])
  i

ssrGiveNewParent
  :: forall r
   . ( Core.GiveNewParent
         (Ref.STRef Global (Array Instruction) -> ST Global Unit)
     )
  -> Ref.STRef r (Array Instruction)
  -> ST r Unit
ssrGiveNewParent a i = void $ Ref.modify
  (_ <> [ EliminatableInstruction $ GiveNewParent a ])
  i

ssrMakeRoot
  :: forall r. Core.MakeRoot -> Ref.STRef r (Array Instruction) -> ST r Unit
ssrMakeRoot a i = void $ Ref.modify
  (_ <> [ EliminatableInstruction $ MakeRoot a ])
  i

ssrSendToPos
  :: forall r. Core.SendToPos -> Ref.STRef r (Array Instruction) -> ST r Unit
ssrSendToPos a i = void $ Ref.modify
  (_ <> [ EliminatableInstruction $ SendToPos a ])
  i

ssrDeleteFromCache
  :: forall r
   . Core.DeleteFromCache
  -> Ref.STRef r (Array Instruction)
  -> ST r Unit
ssrDeleteFromCache a i = void $ Ref.modify
  (_ <> [ EliminatableInstruction $ DeleteFromCache a ])
  i

ssrRemoveDynBeacon
  :: forall r
   . Core.DeleteFromCache
  -> Ref.STRef r (Array Instruction)
  -> ST r Unit
ssrRemoveDynBeacon a i = void $ Ref.modify
  (_ <> [ EliminatableInstruction $ RemoveDynBeacon a ])
  i

ssrDisconnectElement
  :: forall r
   . Core.DisconnectElement
  -> Ref.STRef r (Array Instruction)
  -> ST r Unit
ssrDisconnectElement a i = void $ Ref.modify
  (_ <> [ EliminatableInstruction $ DisconnectElement a ])
  i

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
  , makeRoot: ssrMakeRoot
  , makeText: ssrMakeText
  , makePursx: ssrMakePursx
  , setProp: ssrSetProp
  , unsetAttribute: ssrUnsetAttribute
  , makeDynBeacon: ssrMakeDynBeacon
  , setCb: \_ _ -> pure unit
  , setText: ssrSetText
  , sendToPos: ssrSendToPos
  , deleteFromCache: ssrDeleteFromCache
  , removeDynBeacon: ssrRemoveDynBeacon
  , giveNewParent: ssrGiveNewParent
  , disconnectElement: ssrDisconnectElement
  }

sendToPos :: Core.SendToPos -> FunctionOfFFIDOMSnaphot
sendToPos a = FunctionOfFFIDOMSnaphot \state -> do
  scope <- getScope a.id state
  parent <- getParent a.id state
  dynFamily <- getDynFamily a.id state
  let
    newA =
      { scope
      , parent
      , dynFamily
      , id: a.id
      , pos: Just a.pos
      , ez: false
      -- change me!
      , ctor: DomableF (Bolson.envy empty)
      }
  coerce (giveNewParent_ Just runOnJust newA) state

hydratingDOMInterpret
  :: Ref.STRef Region.Global Int
  -> Core.DOMInterpret FunctionOfFFIDOMSnaphot
hydratingDOMInterpret seed = Core.DOMInterpret
  { ids: do
      s <- Ref.read seed
      let
        o = show
          (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
      void $ Ref.modify (add 1) seed
      pure o
  , makeElement: makeElement_ runOnJust true
  , makeDynBeacon: makeDynBeacon_ runOnJust true
  , attributeParent: attributeParent_ runOnJust
  , makeRoot: makeRoot_
  , makeText: makeText_ runOnJust true (maybe unit)
  , makePursx: makePursx_ runOnJust true (maybe unit)
  , setProp: setProp_ true
  , setCb: setCb_ true
  , unsetAttribute: unsetAttribute_ true
  , setText: setText_
  , sendToPos
  , deleteFromCache: deleteFromCache_
  , removeDynBeacon: removeDynBeacon_
  , giveNewParent: giveNewParent_ Just runOnJust
  , disconnectElement: disconnectElement_
  }