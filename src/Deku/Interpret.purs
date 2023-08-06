-- | This module is for internal use only, and should only be consulted by people
-- | implementing a Deku backend. It is not part of the public API, and does not yet
-- | have documentation. If you are not implementing a Deku backend, please ping
-- | the #frp channel of the PureScript Discord. If enough people are implementing
-- | Deku backends, someone may document this stuff at some point.
module Deku.Interpret
  ( EliminatableInstruction(..)
  , FFIDOMSnapshot(..)
  , FunctionOfFFIDOMSnapshotU
  , FunctionOfArrayInstructionsU
  , EffectfulExecutor
  , EffectfulPayload
  , Instruction(..)
  , RenderableInstruction(..)
  , STPayload
  , forcePayloadE
  , deferPayloadE
  , __internalDekuFlatten
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
import Bolson.Core (Scope(..))
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (class MonadST, liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Global as Region
import Control.Monad.ST.Internal as Ref
import Data.Array as Array
import Data.Foldable (for_)
import Data.List ((:))
import Data.List as List
import Data.Map as Map
import Data.Maybe (Maybe(..), maybe)
import Data.Monoid.Endo (Endo(..))
import Data.Newtype (unwrap)
import Data.String.Utils (includes)
import Deku.Core (DOMInterpret(..), Node', Nut(..), Nut', NutF(..), flattenArgs)
import Deku.Core as Core
import Effect (Effect)
import FRP.Behavior (sample)
import FRP.Event (create, subscribe)
import Safe.Coerce (coerce)

-- foreign
data FFIDOMSnapshot

type FunctionOfFFIDOMSnapshotU =
  FFIDOMSnapshot -> Effect Unit

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
  -> Core.GiveNewParent EffectfulPayload
  -> FunctionOfFFIDOMSnapshotU

giveNewParentOrReconstruct
  :: DOMInterpret EffectfulPayload
  -> EffectfulExecutor
  -> (Int -> Maybe Int)
  -> RunOnJust
  -> Core.GiveNewParent EffectfulPayload
  -> EffectfulPayload
giveNewParentOrReconstruct
  di@
    ( DOMInterpret
        { associateWithUnsubscribe
        }
    )
  executor
  just
  roj
  gnp
  ffi = do
  let
    hasIdAndInScope = giveNewParent_ just roj gnp ffi
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
        myId <- liftST $ Ref.new Nothing
        let
          newRaiseId = raiseId *> void <<< liftST <<< flip Ref.write myId <<<
            Just
        let
          ohBehave = __internalDekuFlatten
            gnp.ctor
            { dynFamily
            , ez
            , deferralPath: gnp.deferralPath
            , parent: Just parent
            , pos
            , raiseId: newRaiseId
            , scope
            }
            di
        pump <- liftST create
        unsubscribe <- liftST $ subscribe
          (sample ohBehave pump.event)
          executor
        pump.push identity
        fetchedId <- liftST $ Ref.read myId
        for_ fetchedId $ executor <<< associateWithUnsubscribe <<<
          { unsubscribe, id: _ }
  hasId <- stateHasKey gnp.id ffi
  if hasId then do
    scope <- getScope gnp.id ffi
    case scope, gnp.scope of
      Global, _ -> hasIdAndInScope
      Local x, Local y -> do
        -- the free thing won't work
        -- that's fine, though
        -- we can issue `associateWithUnsubscribe`
        -- add an `unsubscribe` field in the ffi
        -- and then thunk this on delete from cache
        if includes x y then hasIdAndInScope else needsFreshNut
      _, _ -> needsFreshNut
  else needsFreshNut

__internalDekuFlatten
  :: forall payload
   . NutF payload
  -> Node' payload
__internalDekuFlatten c a b = BC.flatten flattenArgs
  ((coerce :: NutF payload -> Nut' payload) c)
  a
  b

foreign import disconnectElement_
  :: Core.DisconnectElement -> FunctionOfFFIDOMSnapshotU

foreign import associateWithUnsubscribe_
  :: Core.AssociateWithUnsubscribe -> FunctionOfFFIDOMSnapshotU

foreign import setHydrating :: FunctionOfFFIDOMSnapshotU
foreign import unSetHydrating :: FunctionOfFFIDOMSnapshotU

foreign import getPos :: String -> FFIDOMSnapshot -> Effect (Maybe Int)
foreign import getDynFamily :: String -> FFIDOMSnapshot -> Effect (Maybe String)
foreign import getParent :: String -> FFIDOMSnapshot -> Effect String
foreign import getScope :: String -> FFIDOMSnapshot -> Effect Scope

fullDOMInterpret
  :: Ref.STRef Region.Global Int
  -> Ref.STRef Global (Map.Map (List.List Int) (Array EffectfulPayload))
  -> EffectfulExecutor
  -> Core.DOMInterpret EffectfulPayload
fullDOMInterpret seed deferredCache executor =
  let
    l = Core.DOMInterpret
      { ids: do
          s <- Ref.read seed
          void $ Ref.modify (add 1) seed
          pure s
      , associateWithUnsubscribe:  associateWithUnsubscribe_
      , deferPayload: deferPayloadE deferredCache
      , oneOffEffect: \{ effect } _ -> effect
      , forcePayload:  forcePayloadE deferredCache executor
      , makeElement:  makeElement_ runOnJust false
      , makeDynBeacon:  makeDynBeacon_ runOnJust false
      , attributeParent:  attributeParent_ runOnJust
      , makeRoot:  makeRoot_
      , makeText:  makeText_ runOnJust false (maybe unit)
      , makePursx:  makePursx_ runOnJust false (maybe unit)
      , setProp:  setProp_ false
      , setCb:  setCb_ false
      , unsetAttribute:  unsetAttribute_ false
      , setText:  setText_
      , sendToPos:  sendToPos
      , removeDynBeacon: 
          removeDynBeacon_
      , deleteFromCache: 
          deleteFromCache_
      , giveNewParent: \gnp -> giveNewParentOrReconstruct l executor Just
          runOnJust
          gnp
      , disconnectElement: 
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
  | GiveNewParent (Core.GiveNewParent STPayload)
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
   . Core.GiveNewParent STPayload
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

deferPayloadE
  :: forall i o
   . Functor o
  => MonadST Global o
  => Ref.STRef Global
       (Map.Map (List.List Int) (Array (i -> o Unit)))
  -> List.List Int
  -> (i -> o Unit)
  -> i
  -> o Unit
deferPayloadE deferredCache l p _ = do
  void $ liftST $ Ref.modify
    ( flip Map.alter l case _ of
        Nothing ->Just [ p ]
        Just x -> Just (x <> [ p ])
    )
    deferredCache


forcePayloadE
  :: forall i o
   . Functor o
  => MonadST Global o
  => Ref.STRef Global
       (Map.Map (List.List Int) (Array (i -> o Unit)))
  -> ((i -> o Unit) -> o Unit)
  -> List.List Int
  -> i
  -> o Unit
forcePayloadE deferredCache executor l = fn
  where
  fn _ = do
    o <- liftST $ Ref.read deferredCache
    let
      tail = case _ of
        n : List.Nil -> (n + 1) : List.Nil
        a : b -> a : tail b
        x -> x
      leftBound = Just l
      rightBound = Just $ tail l
      { newMap, instructions } = flip (Map.foldSubmap leftBound rightBound) o
        \k v ->
          { newMap: Endo (Map.delete k)
          , instructions: Endo $ Array.cons v
          }
    void $ liftST $ Ref.modify (unwrap newMap)
      deferredCache
    for_ (join $ unwrap instructions []) executor

type FunctionOfArrayInstructionsU =
  Ref.STRef Global (Array Instruction) -> ST Global Unit

type STPayload = FunctionOfArrayInstructionsU

type EffectfulPayload = FunctionOfFFIDOMSnapshotU

type EffectfulExecutor = EffectfulPayload -> Effect Unit
type STExecutor = STPayload -> ST Global Unit

ssrDOMInterpret
  :: Ref.STRef Global Int
  -> Ref.STRef Global (Map.Map (List.List Int) (Array STPayload))
  -> STExecutor
  -> Core.DOMInterpret STPayload
ssrDOMInterpret seed deferredCache executor = Core.DOMInterpret
  { ids: do
      s <- Ref.read seed
      void $ Ref.modify (add 1) seed
      pure s
  , associateWithUnsubscribe: \_ _ -> pure unit
  , deferPayload: deferPayloadE deferredCache
  , oneOffEffect: \_ _ -> pure unit
  , forcePayload:  forcePayloadE deferredCache executor
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
      , deferralPath: List.Nil
      , pos: Just a.pos
      , ez: false
      , raiseId: mempty
      -- change me!
      , ctor: (\(Nut x) -> x) mempty
      }
  coerce (giveNewParent_ Just runOnJust newA) state

hydratingDOMInterpret
  :: Ref.STRef Region.Global Int
  -> Ref.STRef Global (Map.Map (List.List Int) (Array EffectfulPayload))
  -> EffectfulExecutor
  -> Core.DOMInterpret EffectfulPayload
hydratingDOMInterpret seed deferredCache executor =
  let
    l = Core.DOMInterpret
      { ids: do
          s <- Ref.read seed
          void $ Ref.modify (add 1) seed
          pure s
      , associateWithUnsubscribe:  associateWithUnsubscribe_
      , deferPayload: deferPayloadE deferredCache
      , oneOffEffect: \{ effect } _ -> effect
      , forcePayload:  forcePayloadE deferredCache executor
      , makeElement:  makeElement_ runOnJust true
      , makeDynBeacon:  makeDynBeacon_ runOnJust true
      , attributeParent:  attributeParent_ runOnJust
      , makeRoot:  makeRoot_
      , makeText:  makeText_ runOnJust true (maybe unit)
      , makePursx:  makePursx_ runOnJust true (maybe unit)
      , setProp:  setProp_ true
      , setCb:  setCb_ true
      , unsetAttribute:  unsetAttribute_ true
      , setText:  setText_
      , sendToPos:  sendToPos
      , deleteFromCache: 
          deleteFromCache_
      , removeDynBeacon: 
          removeDynBeacon_
      , giveNewParent: \gnp -> giveNewParentOrReconstruct l executor Just
          runOnJust
          gnp
      , disconnectElement: 
          disconnectElement_
      }
  in
    l