module Deku.Interpret
  ( class DOMInterpret
  , FFIDOMSnapshot
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
  , setSingleSubgraph
  ) where

import Prelude

import Data.Array as Array
import Data.Either (Either(..))
import Data.FoldableWithIndex (traverseWithIndex_)
import Data.Lazy (defer)
import Data.Maybe (Maybe(..))
import Data.Monoid.Additive (Additive)
import Data.Newtype (unwrap)
import Data.Set as Set
import Data.Traversable (sequence)
import Data.Tuple (fst, snd)
import Data.Tuple.Nested (type (/\), (/\))
import Data.Typelevel.Undefined (undefined)
import Data.Variant (match)
import Data.Vec as V
import Data.Vec as Vec
import Deku.Control.Types (Frame0, SubScene(..), oneSubFrame)
import Deku.Graph.Attribute (prop)
import Deku.Rendered (Instruction)
import Deku.Rendered as R
import Deku.Tumult.Reconciliation (reconcileTumult)
import Effect (Effect)
import FRP.Event (create, subscribe)
import Unsafe.Coerce (unsafeCoerce)

data FFIDOMSnapshot
foreign import makeFFIDOMSnapshot :: Effect FFIDOMSnapshot
foreign import renderDOM :: Array (Effect Unit) -> Effect Unit

type SubgraphInput (terminus :: Symbol) (n :: Type) env push dom engine =
  { id :: String
  , terminus :: String
  , envs :: V.Vec n env
  , scenes ::
      Int -> SubScene terminus env dom engine Frame0 push (Additive Int)
  }

type SetSubgraphInput (n :: Type) env =
  { id :: String
  , envs :: V.Vec n env
  }

type SetSingleSubgraphInput env =
  { id :: String
  , index :: Int
  , env :: env
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
    :: forall terminus env push n
     . SubgraphInput terminus n env push dom engine
    -> dom
    -> engine
  -- | Make tumult.
  makeTumult :: R.MakeTumult -> dom -> engine
  massiveChange :: R.MassiveChange -> dom -> engine
  setAttribute :: R.SetAttribute -> dom -> engine
  -- | Set subgraph.
  setSubgraph
    :: forall env n
     . SetSubgraphInput n env
    -> dom
    -> engine
  setSingleSubgraph
    :: forall env
     . SetSingleSubgraphInput env
    -> dom
    -> engine
  setText :: R.SetText -> dom -> engine
  setTumult :: R.SetTumult -> dom -> engine

instance freeDOMInterpret :: DOMInterpret Unit Instruction where
  connectXToY = const <<< R.iConnectXToY
  disconnectXFromY = const <<< R.iDisconnectXFromY
  destroyUnit = const <<< R.iDestroyUnit
  makeElement = const <<< R.iMakeElement
  makeRoot = const <<< R.iMakeRoot
  makeText = const <<< R.iMakeText
  makeTumult = const <<< R.iMakeTumult
  massiveCreate = const <<< R.iMassiveCreate
  -- todo: FIX
  makeSubgraph { id } _ = R.iMakeSubgraph { id, instructions: defer \_ -> [] }
  setAttribute = const <<< R.iSetAttribute
  setSingleSubgraph { id } _ = R.iSetSingleSubgraph { id }
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
  :: forall terminus env push
   . AsSubgraphHack terminus env
  -> Int
  -> SubScene terminus env FFIDOMSnapshot (Effect Unit) Frame0 push Unit
mcUnsubgraph (AsSubgraphHack i) = i

newtype AsSubgraphHack terminus env = AsSubgraphHack
  ( forall push dom engine
     . DOMInterpret dom engine
    => Int
    -> SubScene terminus env dom engine Frame0 push Unit
  )

foreign import massiveCreate_
  :: ( forall terminus env push
        . AsSubgraphHack terminus env
       -> Int
       -> SubScene terminus env FFIDOMSnapshot (Effect Unit) Frame0 push Unit
     )
  -> ( forall terminus env push n
        . SubgraphInput terminus n env push FFIDOMSnapshot (Effect Unit)
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

foreign import makeSubgraph_
  :: forall env push scene
   . String
  -> String
  -> Array env
  -> (Int -> scene)
  -> Array
       ( Either env push
         -> scene
         -> { instructions :: Array (FFIDOMSnapshot -> Effect Unit)
            , forOrdering :: Int
            , nextScene :: scene
            }
       )
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import makeTumult_
  :: String
  -> String
  -> Array (Array Instruction)
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
  :: (forall n env. SetSubgraphInput n env -> FFIDOMSnapshot -> Effect Unit)
  -> (R.SetAttribute -> FFIDOMSnapshot -> Effect Unit)
  -> (R.SetText -> FFIDOMSnapshot -> Effect Unit)
  -> (R.SetTumult -> FFIDOMSnapshot -> Effect Unit)
  -> R.MassiveChange
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import setTumult_
  :: String
  -> String
  -> Array (Array Instruction)
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
  :: forall env push
   . String
  -> Array (Either env push)
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import setSingleSubgraph_
  :: forall env push
   . String
  -> Int
  -> Either env push
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
  , setSingleSubgraph: \{ id } -> setAttribute
      { id, key: "devnull", value: prop "true" }
  , setTumult: \{ id } -> setAttribute
      { id, key: "devnull", value: prop "true" }
  }

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
  makeSubgraph { id, terminus, envs, scenes } dom = do
    evts <- sequence (envs $> create)
    let
      funks = evts <#>
        ( \evt eop scene ->
            let
              res = oneSubFrame scene eop evt.push
            in
              { instructions: res.instructions
              , nextScene: res.next
              , forOrdering: unwrap res.res
              }
        )
    evts # traverseWithIndex_ \i evt -> subscribe evt.event \p ->
      setSingleSubgraph_ id i (Right p) dom
    makeSubgraph_ id
      terminus
      (Vec.toArray envs)
      scenes
      (V.toArray funks)
      dom
  makeTumult { id, terminus, instructions } toFFI =
    makeTumult_
      id
      terminus
      instructions
      Nothing
      Just
      makeInstructionsEffectful
      toFFI
  setAttribute = setAttribute_
  setText = setText_
  massiveChange noEta = massiveChange_ setSubgraph setAttribute setText
    setTumult
    noEta
  setSubgraph { id, envs } dom = setSubgraph_ id (map Left $ Vec.toArray envs)
    (dom)
  setSingleSubgraph { id, index, env } dom = setSingleSubgraph_ id
    index
    (Left env)
    (dom)
  setTumult { id, terminus, instructions } toFFI = setTumult_
    id
    terminus
    instructions
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
  setSingleSubgraph { id, index, env } (x /\ y) =
    setSingleSubgraph { id, index, env } x /\ setSingleSubgraph
      { id, index, env }
      y
  setTumult a (x /\ y) = setTumult a x /\ setTumult a y
