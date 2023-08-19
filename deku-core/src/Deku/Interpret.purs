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
  , FreeEFunctionOfFFIDOMSnapshot
  , EFunctionOfFFIDOMSnapshot(..)
  , fullDOMInterpret
  , getAllComments
  , hydratingDOMInterpret
  , makeFFIDOMSnapshot
  , setHydrating
  , ssrDOMInterpret
  , unSetHydrating
  ) where

import Prelude

import Bolson.Control as BC
import Bolson.Core (Element(..), PSR, Scope(..))
import Bolson.Core as Bolson
import Control.Monad.Free (Free, liftF, wrap)
import Control.Monad.ST (ST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Global as Region
import Control.Monad.ST.Internal as Ref
import Control.Plus (empty)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (unwrap)
import Data.String.Utils (includes)
import Deku.Core (DOMInterpret(..), Nut', NutF(..), Node(..))
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

newtype EFunctionOfFFIDOMSnapshot a = EFunctionOfFFIDOMSnapshot
  (Event (FunctionOfFFIDOMSnapshot a))

derive instance Functor EFunctionOfFFIDOMSnapshot

type FreeEFunctionOfFFIDOMSnapshot a = Free EFunctionOfFFIDOMSnapshot a
type FreeEFunctionOfFFIDOMSnapshotU = FreeEFunctionOfFFIDOMSnapshot Unit

foreign import makeFFIDOMSnapshot :: Effect FFIDOMSnapshot

foreign import stateHasKey :: String -> FFIDOMSnapshot -> Effect Boolean

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

giveNewParentOrReconstruct
  :: DOMInterpret FreeEFunctionOfFFIDOMSnapshotU
  -> (Int -> Maybe Int)
  -> RunOnJust
  -> Core.GiveNewParent FreeEFunctionOfFFIDOMSnapshotU
  -> FreeEFunctionOfFFIDOMSnapshotU
giveNewParentOrReconstruct di just roj gnp = join $ liftF
  $ EFunctionOfFFIDOMSnapshot
  $ pure \ffi -> do
      let
        hasIdAndInScope = do
          pure $ liftF $ EFunctionOfFFIDOMSnapshot $ pure $
            giveNewParent_ just roj gnp
        needsFreshNut =
          do
            let
              { dynFamily
              , ez
              , parent
              , pos
              , raiseId
              , scope
              } = gnp
            let
              ( ee
                  :: EFunctionOfFFIDOMSnapshot
                       (Free EFunctionOfFFIDOMSnapshot Unit)
              ) = EFunctionOfFFIDOMSnapshot $ map (\a _ -> pure a) $
                __internalDekuFlatten
                  { dynFamily
                  , ez
                  , parent: Just parent
                  , pos
                  , raiseId
                  , scope
                  }
                  di
                  gnp.ctor
            pure (wrap ee)
      hasId <- stateHasKey gnp.id ffi
      if hasId then do
        scope <- getScope gnp.id ffi
        case scope, gnp.scope of
          Global, _ -> hasIdAndInScope
          Local x, Local y ->
            if includes x y then hasIdAndInScope else needsFreshNut
          _, _ -> needsFreshNut
      else needsFreshNut

__internalDekuFlatten
  :: forall payload
   . PSR (pos :: Maybe Int, dynFamily :: Maybe String, ez :: Boolean)
  -> DOMInterpret payload
  -> NutF payload
  -> Event payload
__internalDekuFlatten a b c = BC.flatten
  { doLogic: \pos (DOMInterpret { sendToPos: sendToPos' }) id -> sendToPos'
      { id, pos }
  , ids: unwrap >>> _.ids
  , disconnectElement:
      \(DOMInterpret { disconnectElement }) { id, scope, parent } ->
        disconnectElement { id, scope, parent, scopeEq: eq }
  , toElt: \(Node e) -> Element e
  }
  a
  b
  ((coerce :: NutF payload -> Nut' payload) c)

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
fullDOMInterpret seed =
  let
    l = Core.DOMInterpret
      { ids: do
          s <- Ref.read seed
          let
            o = show
              (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
          void $ Ref.modify (add 1) seed
          pure o
      , makeElement: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<<
          makeElement_
            runOnJust
            false
      , makeDynBeacon: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<<
          makeDynBeacon_ runOnJust false
      , attributeParent: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<<
          attributeParent_ runOnJust
      , makeRoot: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<< makeRoot_
      , makeText: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<< makeText_
          runOnJust
          false
          (maybe unit)
      , makePursx: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<< makePursx_
          runOnJust
          false
          (maybe unit)
      , setProp: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<< setProp_ false
      , setCb: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<< setCb_ false
      , unsetAttribute: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<<
          unsetAttribute_ false
      , setText: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<< setText_
      , sendToPos: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<< sendToPos
      , removeDynBeacon: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<<
          removeDynBeacon_
      , deleteFromCache: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<<
          deleteFromCache_
      , giveNewParent: \gnp -> giveNewParentOrReconstruct l Just runOnJust gnp
      , disconnectElement: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<<
          disconnectElement_
      }
  in
    l

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
      , raiseId: mempty
      -- change me!
      , ctor: NutF (Bolson.envy empty)
      }
  coerce (giveNewParent_ Just runOnJust newA) state

hydratingDOMInterpret
  :: Ref.STRef Region.Global Int
  -> Core.DOMInterpret FreeEFunctionOfFFIDOMSnapshotU
hydratingDOMInterpret seed =
  let
    l = Core.DOMInterpret
      { ids: do
          s <- Ref.read seed
          let
            o = show
              (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
          void $ Ref.modify (add 1) seed
          pure o
      , makeElement: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<<
          makeElement_
            runOnJust
            true
      , makeDynBeacon: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<<
          makeDynBeacon_ runOnJust true
      , attributeParent: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<<
          attributeParent_ runOnJust
      , makeRoot: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<< makeRoot_
      , makeText: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<< makeText_
          runOnJust
          true
          (maybe unit)
      , makePursx: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<< makePursx_
          runOnJust
          true
          (maybe unit)
      , setProp: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<< setProp_ true
      , setCb: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<< setCb_ true
      , unsetAttribute: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<<
          unsetAttribute_ true
      , setText: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<< setText_
      , sendToPos: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<< sendToPos
      , deleteFromCache: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<<
          deleteFromCache_
      , removeDynBeacon: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<<
          removeDynBeacon_
      , giveNewParent: \gnp -> giveNewParentOrReconstruct l Just runOnJust gnp
      , disconnectElement: liftF <<< EFunctionOfFFIDOMSnapshot <<< pure <<<
          disconnectElement_
      }
  in
    l