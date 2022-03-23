module Deku.Control.Types
  ( DOM
  , DOMState'
  , InitialGraph
  , InitialDOM
  , Frame0
  , Scene(..)
  , Scene'
  , oneFrame
  , oneFrame'
  , SubScene(..)
  , uRes
  , oneSubFrame
  , oneSubFrame'
  , unsafeUnDOM
  , unsafeDOM
  , class IsScene
  , getFrame
  , unFrame
  ) where

import Prelude

import Control.Comonad (class Comonad)
import Control.Extend (class Extend)
import Data.Either (Either)
import Data.Tuple.Nested ((/\), type (/\))
import Effect (Effect)

newtype DOM
  (dom :: Type)
  (engine :: Type)
  (proof :: Type)
  (res :: Type)
  (graph :: Row Type)
  (a :: Type) = DOM { context :: DOMState' dom engine res, value :: a }

derive instance functorDOM :: Functor (DOM dom engine proof res graph)

instance extendDOM :: Extend (DOM dom engine proof res graph) where
  extend f wa@(DOM { context }) = DOM { context, value: f wa }

instance comonadDOM :: Comonad (DOM dom engine proof res graph) where
  extract (DOM { value }) = value

-- | A `proof` term for the initial frame.
data Frame0

-- | The `Graph` at which any scene starts.
type InitialGraph :: forall k. Row k
type InitialGraph = ()

type InitialDOM dom engine res a = DOM dom engine Frame0 res InitialGraph a

-- | Type used for the internal representation of the current dom state.
type DOMState' dom (engine :: Type) res =
  { res :: res
  , instructions :: Array (dom -> engine)
  }

-- | "For office use only" way to access the innards of a frame. Obliterates type safety. Use at your own risk.
unsafeUnDOM
  :: forall dom engine proof res graph a
   . DOM dom engine proof res graph a
  -> { context :: DOMState' dom engine res, value :: a }
unsafeUnDOM (DOM { context, value }) = { context, value }

-- | "For office use only" way to construct a frame. Obliterates type safety. Use at your own risk.
unsafeDOM
  :: forall dom engine proof res graph a
   . { context :: DOMState' dom engine res, value :: a }
  -> DOM dom engine proof res graph a
unsafeDOM = DOM

-- | The information yielded by `oneFrame`.
-- | If `Scene` were a cofree comonad, this would be what is returned by `head` _and_ `tail` combined into one record.
-- | - `instructions`: An array of instructions, ie making things, changing them, or turning them on/off, to be actualized by `dom` and rendered in `engine`.
-- | - `res`: A monoid containing a residual from the dom computation. Use this if you need to pass computations from an dom graph to downstream consumers. In general, it is best if computations happen before dom graph rendering, so it's best to use `res` only in cases where a computation is dependent on values that can only be calculated in the dom-graph, ie scheduling based on the dom clock.
-- | - `next`: The next `Scene`, aka `tail` if `Scene` were a cofree comonad.
type Scene'
  :: forall k
   . (Type -> Type -> Type -> k -> Type -> Type -> Type)
  -> Type
  -> Type
  -> Type
  -> k
  -> Type
  -> Type
  -> Type
type Scene' scene env dom engine proof push res =
  { instructions :: Array (dom -> engine)
  , res :: res
  , next :: scene env dom engine proof push res
  }

uRes :: forall r. { res :: Unit | r } -> { res :: Unit | r }
uRes = identity

newtype Scene :: forall k. Type -> Type -> Type -> k -> Type -> Type -> Type
newtype Scene env dom engine proofA push res = Scene
  ( Either env push
    -> (push -> Effect Unit)
    -> forall (proofB :: k)
     . Scene' Scene env dom engine proofB push res
  )

class IsScene
  :: forall k. (Type -> Type -> Type -> k -> Type -> Type -> Type) -> Constraint
class IsScene scene where
  getFrame
    :: forall env dom engine proofA push res
     . scene env dom engine proofA push res
    -> ( Either env push
         -> (push -> Effect Unit)
         -> forall proofB
          . Scene' scene env dom engine proofB push res
       )
  unFrame
    :: forall env dom engine proofA push res
     . ( Either env push
         -> (push -> Effect Unit)
         -> forall proofB
          . Scene' scene env dom engine proofB push res
       )
    -> scene env dom engine proofA push res

instance isSceneScene :: IsScene Scene where
  getFrame = oneFrame
  unFrame = Scene

oneFrame
  :: forall env dom engine proofA push res
   . Scene env dom engine proofA push res
  -> ( Either env push
       -> (push -> Effect Unit)
       -> forall proofB
        . Scene' Scene env dom engine proofB push res
     )
oneFrame (Scene scene) = scene

oneFrame'
  :: forall env dom engine proofA push res
   . Scene env dom engine proofA push res
  -> Either env push
  -> (push -> Effect Unit)
  -> (Array (dom -> engine) /\ res /\ Scene env dom engine proofA push res)
oneFrame' s e p = go (oneFrame s e p)
  where
  go x = instructions /\ res /\ next
    where
    { instructions, res, next } = x

--
newtype SubScene
  :: forall k. Type -> Type -> Type -> k -> Type -> Type -> Type
newtype SubScene env dom engine proofA push res = SubScene
  ( Either env push
    -> (push -> Effect Unit)
    -> forall (proofB :: k)
     . Scene' SubScene env dom engine proofB push res
  )

instance isSceneSubScene :: IsScene SubScene where
  getFrame = oneSubFrame
  unFrame = SubScene

oneSubFrame
  :: forall env dom engine proofA push res
   . SubScene env dom engine proofA push res
  -> ( Either env push
       -> (push -> Effect Unit)
       -> forall proofB
        . Scene' SubScene env dom engine proofB push res
     )
oneSubFrame (SubScene scene) = scene

oneSubFrame'
  :: forall env dom engine proofA push res
   . SubScene env dom engine proofA push res
  -> Either env push
  -> (push -> Effect Unit)
  -> ( Array (dom -> engine) /\ res /\ SubScene env dom
         engine
         proofA
         push
         res
     )
oneSubFrame' s e p = go (oneSubFrame s e p)
  where
  go x = instructions /\ res /\ next
    where
    { instructions, res, next } = x
