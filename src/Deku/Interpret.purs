-- | This module is for internal use only, and should only be consulted by people
-- | implementing a Deku backend. It is not part of the public API, and does not yet
-- | have documentation. If you are not implementing a Deku backend, please ping
-- | the #frp channel of the PureScript Discord. If enough people are implementing
-- | Deku backends, someone may document this stuff at some point.
module Deku.Interpret
  ( EliminatableInstruction(..)
  , FFIDOMSnapshot(..)
  , FunctionOfFFIDOMSnapshot(..)
  , FunctionOfFFIDOMSnapshotU
  , Instruction(..)
  , RenderableInstruction(..)
  , FreeEFunctionOfFFIDOMSnapshotU
  , FreeE
  , fullDOMInterpret
  , getAllComments
  , hydratingDOMInterpret
  , makeFFIDOMSnapshot
  , setHydrating
  , ssrDOMInterpret
  , unSetHydrating
  ) where

import Prelude

import Bolson.Core (Scope)
import Bolson.Core as Bolson
import Control.Monad.Free (Free, liftF)
import Control.Monad.ST (ST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Global as Region
import Control.Monad.ST.Internal as Ref
import Control.Plus (empty)
import Data.Maybe (Maybe(..), maybe)
import Deku.Core (DomableF(..))
import Deku.Core as Core
import Effect (Effect)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import Test.QuickCheck (arbitrary, mkSeed)
import Test.QuickCheck.Gen (Gen, evalGen)

-- foreign
data FFIDOMSnapshot

type FunctionOfFFIDOMSnapshot a =
  (FFIDOMSnapshot -> Effect a)

type FunctionOfFFIDOMSnapshotU = FunctionOfFFIDOMSnapshot Unit

type FreeE a = Free Event a
type FreeEFunctionOfFFIDOMSnapshotU = FreeE FunctionOfFFIDOMSnapshotU

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
  -> FunctionOfFFIDOMSnapshotU

foreign import makeDynBeacon_
  :: RunOnJust
  -> Boolean
  -> Core.MakeDynBeacon
  -> FunctionOfFFIDOMSnapshotU

foreign import removeDynBeacon_
  :: Core.RemoveDynBeacon
  -> FunctionOfFFIDOMSnapshotU

foreign import attributeParent_
  :: RunOnJust
  -> Core.AttributeParent
  -> FunctionOfFFIDOMSnapshotU

foreign import makeRoot_
  :: Core.MakeRoot
  -> FunctionOfFFIDOMSnapshotU

foreign import makeText_
  :: RunOnJust
  -> Boolean
  -> (forall a. (a -> Unit) -> Maybe a -> Unit)
  -> Core.MakeText
  -> FunctionOfFFIDOMSnapshotU

foreign import setText_
  :: Core.SetText
  -> FunctionOfFFIDOMSnapshotU

foreign import setProp_
  :: Boolean -> Core.SetProp -> FunctionOfFFIDOMSnapshotU

foreign import unsetAttribute_
  :: Boolean -> Core.UnsetAttribute -> FunctionOfFFIDOMSnapshotU

foreign import setCb_
  :: Boolean -> Core.SetCb -> FunctionOfFFIDOMSnapshotU

foreign import makePursx_
  :: RunOnJust
  -> Boolean
  -> (forall a. (a -> Unit) -> Maybe a -> Unit)
  -> Core.MakePursx
  -> FunctionOfFFIDOMSnapshotU

foreign import deleteFromCache_
  :: Core.DeleteFromCache -> FunctionOfFFIDOMSnapshotU

foreign import giveNewParent_
  :: (Int -> Maybe Int)
  -> RunOnJust
  -> Core.GiveNewParent FreeEFunctionOfFFIDOMSnapshotU
  -> FunctionOfFFIDOMSnapshotU

foreign import disconnectElement_
  :: Core.DisconnectElement -> FunctionOfFFIDOMSnapshotU

foreign import setHydrating :: FunctionOfFFIDOMSnapshotU
foreign import unSetHydrating :: FunctionOfFFIDOMSnapshotU

foreign import getPos :: String -> FFIDOMSnapshot -> Effect (Maybe Int)
foreign import getDynFamily :: String -> FFIDOMSnapshot -> Effect (Maybe String)
foreign import getParent :: String -> FFIDOMSnapshot -> Effect String
foreign import getScope :: String -> FFIDOMSnapshot -> Effect Scope

fullDOMInterpret
  :: Ref.STRef Region.Global Int
  -> Core.DOMInterpret FreeEFunctionOfFFIDOMSnapshotU
fullDOMInterpret seed = Core.DOMInterpret
  { ids: do
      s <- Ref.read seed
      let
        o = show
          (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
      void $ Ref.modify (add 1) seed
      pure o
  , makeElement:liftF <<<  pure <<<  makeElement_ runOnJust false
  , makeDynBeacon:liftF <<<  pure <<<  makeDynBeacon_ runOnJust false
  , attributeParent: liftF <<<  pure <<< attributeParent_ runOnJust
  , makeRoot: liftF <<<  pure <<< makeRoot_
  , makeText: liftF <<<  pure <<< makeText_ runOnJust false (maybe unit)
  , makePursx: liftF <<<  pure <<<  makePursx_ runOnJust false (maybe unit)
  , setProp: liftF <<<  pure <<< setProp_ false
  , setCb: liftF <<<  pure <<< setCb_ false
  , unsetAttribute: liftF <<<  pure <<< unsetAttribute_ false
  , setText: liftF <<<  pure <<< setText_
  , sendToPos: liftF <<<  pure <<< sendToPos
  , removeDynBeacon: liftF <<<  pure <<< removeDynBeacon_
  , deleteFromCache: liftF <<<  pure <<< deleteFromCache_
  , giveNewParent: liftF <<<  pure <<< giveNewParent_ Just runOnJust
  , disconnectElement: liftF <<<  pure <<< disconnectElement_
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

sendToPos :: Core.SendToPos -> FunctionOfFFIDOMSnapshotU
sendToPos a = \state -> do
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
  -> Core.DOMInterpret FreeEFunctionOfFFIDOMSnapshotU
hydratingDOMInterpret seed = Core.DOMInterpret
  { ids: do
      s <- Ref.read seed
      let
        o = show
          (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
      void $ Ref.modify (add 1) seed
      pure o
  , makeElement: liftF <<<  pure <<< makeElement_ runOnJust true
  , makeDynBeacon: liftF <<<  pure <<< makeDynBeacon_ runOnJust true
  , attributeParent: liftF <<<  pure <<< attributeParent_ runOnJust
  , makeRoot: liftF <<<  pure <<< makeRoot_
  , makeText: liftF <<<  pure <<< makeText_ runOnJust true (maybe unit)
  , makePursx: liftF <<<  pure <<< makePursx_ runOnJust true (maybe unit)
  , setProp: liftF <<<  pure <<< setProp_ true
  , setCb: liftF <<<  pure <<< setCb_ true
  , unsetAttribute: liftF <<<  pure <<< unsetAttribute_ true
  , setText: liftF <<<  pure <<< setText_
  , sendToPos: liftF <<<  pure <<< sendToPos
  , deleteFromCache: liftF <<<  pure <<< deleteFromCache_
  , removeDynBeacon: liftF <<<  pure <<< removeDynBeacon_
  , giveNewParent: liftF <<<  pure <<< giveNewParent_ Just runOnJust
  , disconnectElement: liftF <<<  pure <<< disconnectElement_
  }