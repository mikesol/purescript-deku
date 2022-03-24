module Deku.Interpret
  ( class DOMInterpret
  , FFIDOMSnapshot
  , AsSubgraphHack(..)
  , SubgraphInput
  , Ie
  , makeRoot
  , makeFFIDOMSnapshot
  , massiveCreate
  , massiveChange
  , makePursx
  , connectXToY
  , destroyUnit
  , disconnectXFromY
  , makeElement
  , makeText
  , makeSubgraph
  , setAttribute
  , setSubgraph
  , renderDOM
  , setText
  ) where

import Prelude

import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.Monoid.Additive (Additive)
import Data.Newtype (unwrap)
import Data.Nullable (Nullable, null, toNullable)
import Data.Tuple (fst, snd)
import Data.Tuple.Nested (type (/\), (/\))
import Data.Typelevel.Undefined (undefined)
import Deku.Control.Types (Frame0, SubScene(..), oneSubFrame)
import Deku.Rendered (Instruction)
import Deku.Rendered as R
import Effect (Effect)
import FRP.Event (create, filterMap, subscribe)
import Unsafe.Coerce (unsafeCoerce)

data FFIDOMSnapshot
foreign import makeFFIDOMSnapshot :: Effect FFIDOMSnapshot
foreign import renderDOM :: Array (Effect Unit) -> Effect Unit

type SubgraphInput index env push dom engine =
  { id :: String
  , envs :: Array (Ie index env)
  , scenes ::
      index -> SubScene env dom engine Frame0 push (Additive Int)
  }

type SetSubgraphInput index env =
  { id :: String
  , envs :: Array (Ie index env)
  }

class DOMInterpret dom engine where
  -- | Connect pointer x to pointer y. For example, connect a sine wave oscillator to a highpass filter.
  connectXToY :: R.ConnectXToY -> dom -> engine
  disconnectXFromY :: R.DisconnectXFromY -> dom -> engine
  destroyUnit :: R.DestroyUnit -> dom -> engine
  massiveCreate :: R.MassiveCreate -> dom -> engine
  makeRoot :: R.MakeRoot -> dom -> engine
  makeElement :: R.MakeElement -> dom -> engine
  makeText :: R.MakeText -> dom -> engine
  makePursx :: R.MakePursx -> dom -> engine
  makeSubgraph
    :: forall index env push
     . SubgraphInput index env push dom engine
    -> dom
    -> engine
  massiveChange :: R.MassiveChange -> dom -> engine
  setAttribute :: R.SetAttribute -> dom -> engine
  -- | Set subgraph.
  setSubgraph
    :: forall index env
     . SetSubgraphInput index env
    -> dom
    -> engine
  setText :: R.SetText -> dom -> engine

handleSubgraph
  :: forall index env push
   . (R.MakeSubgraph -> Instruction)
  -> SubgraphInput index env push Unit Instruction
  -> Unit
  -> Instruction
handleSubgraph f { id, envs, scenes } = const $ f
  { id
  , instructions:
      let
        instructions = map
          ( \{ index: a, env: b } -> map (\z -> z unit)
              (oneSubFrame (scenes a) (Left b) (const $ pure unit)).instructions
          )
          ( filterMap
              ( \i -> case i.env of
                  Nothing -> Nothing
                  Just env -> Just $ i { env = env }
              )
              envs
          )
      in
        instructions
  }
instance freeDOMInterpret :: DOMInterpret Unit Instruction where
  connectXToY = const <<< R.iConnectXToY
  disconnectXFromY = const <<< R.iDisconnectXFromY
  destroyUnit = const <<< R.iDestroyUnit
  makePursx = const <<< R.iMakePursx
  makeElement = const <<< R.iMakeElement
  makeRoot = const <<< R.iMakeRoot
  makeText = const <<< R.iMakeText
  massiveCreate = const <<< R.iMassiveCreate
  makeSubgraph = handleSubgraph R.iMakeSubgraph
  setAttribute = const <<< R.iSetAttribute
  setSubgraph { id } _ = R.iSetSubgraph { id }
  massiveChange = const <<< R.iMassiveChange
  setText = const <<< R.iSetText

foreign import connectXToY_
  :: forall r
   . { fromId :: String, toId :: String | r }
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import disconnectXFromY_
  :: forall r
   . { fromId :: String, toId :: String | r }
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import destroyUnit_
  :: forall r. { id :: String | r } -> FFIDOMSnapshot -> Effect Unit

foreign import makePursx_
  :: ( Nullable String
       -> R.MassiveCreate
       -> FFIDOMSnapshot
       -> Effect Unit
     )
  -> R.MakePursx
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import makeElement_
  :: R.MakeElement
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import makeRoot_
  :: R.MakeRoot
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import makeText_
  :: R.MakeText
  -> FFIDOMSnapshot
  -> Effect Unit

mcUnsubgraph
  :: forall index env push
   . AsSubgraphHack index env
  -> index
  -> SubScene env FFIDOMSnapshot (Effect Unit) Frame0 push Unit
mcUnsubgraph (AsSubgraphHack i) = i

newtype AsSubgraphHack index env = AsSubgraphHack
  ( forall push dom engine
     . DOMInterpret dom engine
    => index
    -> SubScene env dom engine Frame0 push Unit
  )

foreign import massiveCreate_
  :: ( forall index env push
        . AsSubgraphHack index env
       -> index
       -> SubScene env FFIDOMSnapshot (Effect Unit) Frame0 push Unit
     )
  -> ( forall index env push
        . SubgraphInput index env push FFIDOMSnapshot (Effect Unit)
       -> FFIDOMSnapshot
       -> (Effect Unit)
     )
  -> (R.MakeRoot -> FFIDOMSnapshot -> Effect Unit)
  -> (R.MakeElement -> FFIDOMSnapshot -> Effect Unit)
  -> (R.MakeText -> FFIDOMSnapshot -> Effect Unit)
  -> (R.MakePursx -> FFIDOMSnapshot -> Effect Unit)
  -> Nullable String
  -> R.MassiveCreate
  -> FFIDOMSnapshot
  -> Effect Unit

type Ie index env =
  { pos :: Int
  , index :: index
  , env :: Maybe env
  }

type Pie push index env =
  { pos :: Int, index :: index, env :: Nullable (Either env push) }

foreign import makeSubgraph_
  :: forall index env push scene
   . String
  -- this is the generic function for how to interpret a scene
  -> (index -> scene)
  -> Array (Pie push index env)
  -- this is how to spawn a specific scene loop
  -- effectful because it starts a subscription to an event
  -> ( Int
       -> index
       -> Effect
            { loop ::
                Either env push
                -> scene
                -> { instructions :: Array (FFIDOMSnapshot -> Effect Unit)
                   , forOrdering :: Int
                   , nextScene :: scene
                   }
            , unsubscribe :: Effect Unit
            }
     )
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import setText_
  :: R.SetText
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import massiveChange_
  :: ( forall index env
        . SetSubgraphInput index env
       -> FFIDOMSnapshot
       -> Effect Unit
     )
  -> (R.SetAttribute -> FFIDOMSnapshot -> Effect Unit)
  -> (R.SetText -> FFIDOMSnapshot -> Effect Unit)
  -> R.MassiveChange
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import setAttribute_
  :: R.SetAttribute -> FFIDOMSnapshot -> Effect Unit

foreign import setSubgraph_
  :: forall env push index
   . String
  -> Array (Pie push index env)
  -> FFIDOMSnapshot
  -> Effect Unit

envsToFFI
  :: forall index env push
   . Array (Ie index env)
  -> Array (Pie push index env)
envsToFFI = map go
  where
  go { pos, index, env } = { pos, index, env: toNullable $ map Left env }

instance effectfulDOMInterpret ::
  DOMInterpret FFIDOMSnapshot (Effect Unit) where
  connectXToY = connectXToY_
  disconnectXFromY = disconnectXFromY_
  destroyUnit = destroyUnit_
  makeElement = makeElement_
  makeRoot = makeRoot_
  makePursx noEta = makePursx_
    ( massiveCreate_
        mcUnsubgraph
        makeSubgraph
        makeRoot
        makeElement
        makeText
        makePursx
    )
    noEta
  massiveCreate noEta = massiveCreate_
    mcUnsubgraph
    makeSubgraph
    makeRoot
    makeElement
    makeText
    makePursx
    null
    noEta
  makeText = makeText_
  makeSubgraph { id, scenes, envs } dom =
    flip (makeSubgraph_ id scenes (envsToFFI envs)) dom \pos index ->
      do
        -- todo: would makeEvent have a better memory profile here?
        evt <- create
        let
          loop = \eop scene ->
            let
              res = oneSubFrame scene eop evt.push
            in
              { instructions: res.instructions
              , nextScene: res.next
              , forOrdering: unwrap res.res
              }
        unsubscribe <- subscribe evt.event \p ->
          setSubgraph_ id [ { pos, index, env: toNullable $ Just (Right p) } ]
            dom
        pure { loop, unsubscribe }
  setAttribute = setAttribute_
  setText = setText_
  massiveChange noEta = massiveChange_ setSubgraph setAttribute setText
    noEta
  -- todo - can we avoid the double map?
  setSubgraph { id, envs } dom = setSubgraph_ id
    (envsToFFI envs)
    (dom)

-- A utility typeclass used to convert PS arguments to arguments that are understood by the Web DOM API.

domEngine1st
  :: forall env proof push res
   . SubScene env (Unit /\ FFIDOMSnapshot)
       (Instruction /\ Effect Unit)
       proof
       push
       res
  -> SubScene env Unit Instruction proof push res
domEngine1st (SubScene sceneA) = SubScene
  ( \env push ->
      let
        eaA = sceneA env push
      in
        -- highly unsafe. only works because the result is effectful and we don't have any form of currying in the
        -- ffi, so the effect won't be triggered and the `undefined` won't be used
        { instructions: map
            (\f aSide -> fst $ f (aSide /\ (unsafeCoerce undefined)))
            eaA.instructions
        , res: eaA.res
        , next: domEngine1st eaA.next
        }
  )

domEngine2nd
  :: forall env proof push res
   . SubScene env (Unit /\ FFIDOMSnapshot)
       (Instruction /\ Effect Unit)
       proof
       push
       res
  -> SubScene env FFIDOMSnapshot (Effect Unit) proof push res
domEngine2nd (SubScene sceneA) = SubScene
  ( \env push ->
      let
        eaA = sceneA env push
      in
        { instructions: map (\f bSide -> snd $ f (unit /\ bSide))
            eaA.instructions
        , res: eaA.res
        , next: domEngine2nd eaA.next
        }
  )

instance mixedDOMInterpret ::
  DOMInterpret (Unit /\ FFIDOMSnapshot) (Instruction /\ Effect Unit) where
  connectXToY a (x /\ y) = connectXToY a x /\ connectXToY a y
  disconnectXFromY a (x /\ y) = disconnectXFromY a x /\ disconnectXFromY a y
  destroyUnit a (x /\ y) = destroyUnit a x /\ destroyUnit a y
  makePursx a (x /\ y) = makePursx a x /\ makePursx a y
  makeSubgraph { id, envs, scenes } (x /\ y) =
    makeSubgraph { id, envs, scenes: map domEngine1st scenes } x /\
      makeSubgraph { id, envs, scenes: map domEngine2nd scenes } y
  massiveCreate a (x /\ y) = massiveCreate a x /\ massiveCreate a y
  makeText a (x /\ y) = makeText a x /\ makeText a y
  makeRoot a (x /\ y) = makeRoot a x /\ makeRoot a y
  makeElement a (x /\ y) = makeElement a x /\ makeElement a y
  setText a (x /\ y) = setText a x /\ setText a y
  setAttribute a (x /\ y) = setAttribute a x /\ setAttribute a y
  massiveChange a (x /\ y) = massiveChange a x /\ massiveChange a y
  setSubgraph { id, envs } (x /\ y) = setSubgraph { id, envs } x /\ setSubgraph
    { id, envs }
    y
