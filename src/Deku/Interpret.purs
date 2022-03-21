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
  , connectXToY
  , destroyUnit
  , disconnectXFromY
  , makeElement
  , makeText
  , makeSubgraph
  , makeTumult
  , setAttribute
  , setSubgraph
  , setTumult
  , renderDOM
  , setText
  ) where

import Prelude

import Data.Array as Array
import Data.Either (Either(..))
import Data.Map as Map
import Data.Maybe (Maybe(..))
import Data.Monoid.Additive (Additive)
import Data.Newtype (unwrap)
import Data.Nullable (Nullable, toNullable)
import Data.Set as Set
import Data.Tuple (fst, snd)
import Data.Tuple.Nested (type (/\), (/\))
import Data.Typelevel.Undefined (undefined)
import Data.Variant (match)
import Deku.Control.Types (Frame0, SubScene(..), oneSubFrame)
import Deku.Graph.Attribute (prop)
import Deku.Rendered (Instruction)
import Deku.Rendered as R
import Deku.Tumult.Reconciliation (reconcileTumult)
import Effect (Effect)
import FRP.Event (create, filterMap, subscribe)
import Unsafe.Coerce (unsafeCoerce)

data FFIDOMSnapshot
foreign import makeFFIDOMSnapshot :: Effect FFIDOMSnapshot
foreign import renderDOM :: Array (Effect Unit) -> Effect Unit

type SubgraphInput index (terminus :: Symbol) env push dom engine =
  { id :: String
  , terminus :: String
  , envs :: Array (Ie index env)
  , scenes ::
      index -> SubScene terminus env dom engine Frame0 push (Additive Int)
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
  makeSubgraph
    :: forall index terminus env push
     . SubgraphInput index terminus env push dom engine
    -> dom
    -> engine
  -- | Make tumult.
  makeTumult :: R.MakeTumult -> dom -> engine
  massiveChange :: R.MassiveChange -> dom -> engine
  setAttribute :: R.SetAttribute -> dom -> engine
  -- | Set subgraph.
  setSubgraph
    :: forall index env
     . SetSubgraphInput index env
    -> dom
    -> engine
  setText :: R.SetText -> dom -> engine
  setTumult :: R.SetTumult -> dom -> engine

handleSubgraph
  :: forall index terminus env push
   . (R.MakeSubgraph -> Instruction)
  -> SubgraphInput index terminus env push Unit Instruction
  -> Unit
  -> Instruction
handleSubgraph f { id, envs, terminus, scenes } = const $ f
  { id
  , terminus
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
  makeElement = const <<< R.iMakeElement
  makeRoot = const <<< R.iMakeRoot
  makeText = const <<< R.iMakeText
  makeTumult = const <<< R.iMakeTumult
  massiveCreate = const <<< R.iMassiveCreate
  makeSubgraph = handleSubgraph R.iMakeSubgraph
  setAttribute = const <<< R.iSetAttribute
  setSubgraph { id } _ = R.iSetSubgraph { id }
  massiveChange = const <<< R.iMassiveChange
  setText = const <<< R.iSetText
  setTumult = const <<< R.iSetTumult

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
  :: forall index terminus env push
   . AsSubgraphHack index terminus env
  -> index
  -> SubScene terminus env FFIDOMSnapshot (Effect Unit) Frame0 push Unit
mcUnsubgraph (AsSubgraphHack i) = i

newtype AsSubgraphHack index terminus env = AsSubgraphHack
  ( forall push dom engine
     . DOMInterpret dom engine
    => index
    -> SubScene terminus env dom engine Frame0 push Unit
  )

foreign import massiveCreate_
  :: ( forall index terminus env push
        . AsSubgraphHack index terminus env
       -> index
       -> SubScene terminus env FFIDOMSnapshot (Effect Unit) Frame0 push Unit
     )
  -> ( forall index terminus env push
        . SubgraphInput index terminus env push FFIDOMSnapshot (Effect Unit)
       -> FFIDOMSnapshot
       -> (Effect Unit)
     )
  -> (R.MakeTumult -> FFIDOMSnapshot -> Effect Unit)
  -> (R.MakeRoot -> FFIDOMSnapshot -> Effect Unit)
  -> (R.MakeElement -> FFIDOMSnapshot -> Effect Unit)
  -> (R.MakeText -> FFIDOMSnapshot -> Effect Unit)
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
  -> String
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

foreign import makeTumult_
  :: String
  -> String
  -> Array { pos :: Int, instructions :: Nullable (Array Instruction) }
  -> Maybe (Array Instruction)
  -> (Array Instruction -> Maybe (Array Instruction))
  -> ( Array Instruction
       -> Maybe (Array Instruction)
       -> Array (FFIDOMSnapshot -> Effect Unit)
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
  -> (R.SetTumult -> FFIDOMSnapshot -> Effect Unit)
  -> R.MassiveChange
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import setTumult_
  :: String
  -> String
  -> Array { pos :: Int, instructions :: Nullable (Array Instruction) }
  -> Maybe (Array Instruction)
  -> (Array Instruction -> Maybe (Array Instruction))
  -> ( Array Instruction
       -> Maybe (Array Instruction)
       -> Array (FFIDOMSnapshot -> Effect Unit)
     )
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

interpretInstruction
  :: forall dom engine
   . DOMInterpret dom engine
  => Instruction
  -> dom
  -> engine
interpretInstruction = unwrap >>> match
  { disconnectXFromY: \a -> disconnectXFromY a
  , destroyUnit: \a -> destroyUnit a
  , makeElement: \a -> makeElement a
  , makeRoot: \a -> makeRoot a
  , massiveCreate: \a -> massiveCreate a
  , makeText: \a -> makeText a
  -----------------------------------
  -- for now, we cannot get back tumult and subgraph
  -- add dummies
  -- maybe figure this out in the future
  , makeSubgraph: \{ id } -> makeElement
      { id
      , tag: "div"
      , attributes: [ { key: "style", value: prop "display:content;" } ]
      }
  , makeTumult: \{ id } -> makeElement
      { id
      , tag: "div"
      , attributes: [ { key: "style", value: prop "display:content;" } ]
      }
  -----------------------------------
  , connectXToY: \a -> connectXToY a
  , setText: \a -> setText a
  , massiveChange: \a -> massiveChange a
  , setAttribute: \a -> setAttribute a
  , setSubgraph: \{ id } -> setAttribute
      { id, key: "devnull", value: prop "true" }
  , setTumult: \{ id } -> setAttribute
      { id, key: "devnull", value: prop "true" }
  }

envsToFFI
  :: forall index env push
   . Array (Ie index env)
  -> Array (Pie push index env)
envsToFFI = map go
  where
  go { pos, index, env } = { pos, index, env: toNullable $ map Left env }

makeInstructionsEffectful
  :: Array Instruction
  -> Maybe (Array Instruction)
  -> Array (FFIDOMSnapshot -> Effect Unit)
makeInstructionsEffectful a = case _ of
  Nothing -> map (interpretInstruction) a
  Just b -> map (interpretInstruction)
    ( Array.fromFoldable $ reconcileTumult (Set.fromFoldable a)
        (Set.fromFoldable b)
    )

instance effectfulDOMInterpret ::
  DOMInterpret FFIDOMSnapshot (Effect Unit) where
  connectXToY = connectXToY_
  disconnectXFromY = disconnectXFromY_
  destroyUnit = destroyUnit_
  makeElement = makeElement_
  makeRoot = makeRoot_
  massiveCreate noEta = massiveCreate_ mcUnsubgraph makeSubgraph makeTumult
    makeRoot
    makeElement
    makeText
    noEta
  makeText = makeText_
  makeSubgraph { id, terminus, scenes, envs } dom =
    flip (makeSubgraph_ id terminus scenes (envsToFFI envs)) dom \pos index ->
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

  makeTumult { id, terminus, instructions } toFFI =
    makeTumult_
      id
      terminus
      ( map (\(a /\ b) -> { pos: a, instructions: toNullable b })
          (Map.toUnfoldable instructions)
      )
      Nothing
      Just
      makeInstructionsEffectful
      toFFI
  setAttribute = setAttribute_
  setText = setText_
  massiveChange noEta = massiveChange_ setSubgraph setAttribute setText
    setTumult
    noEta
  -- todo - can we avoid the double map?
  setSubgraph { id, envs } dom = setSubgraph_ id
    (envsToFFI envs)
    (dom)
  setTumult { id, terminus, instructions } toFFI = setTumult_
    id
    terminus
    ( map (\(a /\ b) -> { pos: a, instructions: toNullable b })
        (Map.toUnfoldable instructions)
    )
    Nothing
    Just
    makeInstructionsEffectful
    (toFFI)

-- A utility typeclass used to convert PS arguments to arguments that are understood by the Web DOM API.

domEngine1st
  :: forall terminus env proof push res
   . SubScene terminus env (Unit /\ FFIDOMSnapshot)
       (Instruction /\ Effect Unit)
       proof
       push
       res
  -> SubScene terminus env Unit Instruction proof push res
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
  :: forall terminus env proof push res
   . SubScene terminus env (Unit /\ FFIDOMSnapshot)
       (Instruction /\ Effect Unit)
       proof
       push
       res
  -> SubScene terminus env FFIDOMSnapshot (Effect Unit) proof push res
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
  makeSubgraph { id, terminus, envs, scenes } (x /\ y) =
    makeSubgraph { id, terminus, envs, scenes: map domEngine1st scenes } x /\
      makeSubgraph { id, terminus, envs, scenes: map domEngine2nd scenes } y
  massiveCreate a (x /\ y) = massiveCreate a x /\ massiveCreate a y
  makeText a (x /\ y) = makeText a x /\ makeText a y
  makeRoot a (x /\ y) = makeRoot a x /\ makeRoot a y
  makeElement a (x /\ y) = makeElement a x /\ makeElement a y
  makeTumult a (x /\ y) = makeTumult a x /\ makeTumult a y
  setText a (x /\ y) = setText a x /\ setText a y
  setAttribute a (x /\ y) = setAttribute a x /\ setAttribute a y
  massiveChange a (x /\ y) = massiveChange a x /\ massiveChange a y
  setSubgraph { id, envs } (x /\ y) = setSubgraph { id, envs } x /\ setSubgraph
    { id, envs }
    y
  setTumult a (x /\ y) = setTumult a x /\ setTumult a y
