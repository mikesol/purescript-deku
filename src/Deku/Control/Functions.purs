module Deku.Control.Functions
  ( modifyRes
  , makeSceneR
  , start
  , infiniteLoop
  , freeze
  , u
  , loopUsingSceneG
  , loopUsingSceneGWithRes
  , loopUsingSceneSG
  , loopUsingSceneSGWithRes
  , (@>)
  , (@!>)
  , (%>)
  , (%!>)
  ) where

import Prelude

import Control.Comonad (extract)
import Data.Either (Either(..))
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Control.Monadic (MDOM(..))
import Deku.Control.Types (class IsScene, DOM, DOMState', Frame0, InitialDOM, Scene, Scene', SubScene, getFrame, unFrame, unsafeDOM, unsafeUnDOM)
import Deku.Create (class Create, class CreateSG, create, createSG)
import Deku.Graph.DOM (Element, Root)
import Deku.Interpret (class DOMInterpret)
import Effect (Effect)

u :: forall a. a -> a /\ Unit
u a = a /\ unit

start
  :: forall dom engine res
   . Monoid res
  => DOMInterpret dom engine
  => InitialDOM dom engine res Unit
start = unsafeDOM { context: initialDOMState, value: unit }

initialDOMState
  :: forall dom engine res
   . Monoid res
  => DOMState' dom engine res
initialDOMState =
  { res: mempty
  , instructions: []
  }

freeze :: forall a b m. Applicative m => a -> b -> m b
freeze = const $ pure

-- | Make a scene. The infix operator for this operation is `@>`.
-- |
-- | It accepts as arguments:
-- | - a frame to render
-- | - a function that accepts a frame from the next moment in time (`proofB`) and returns a scene.
-- |
-- | From these arguments, it produces a `Scene`.
-- | ```
makeScene
  :: forall scene env dom engine proofA push res graph control
   . Monoid res
  => IsScene scene
  => DOMInterpret dom engine
  => ( Either env push
       -> (push -> Effect Unit)
       -> Either (scene env dom engine proofA push res)
            (DOM dom engine proofA res graph control)
     )
  -> ( forall proofB
        . DOM dom engine proofB res graph control
       -> scene env dom engine proofB push res
     )
  -> scene env dom engine proofA push res
makeScene m trans = unFrame go
  where
  go
    :: forall proofB
     . Either env push
    -> (push -> Effect Unit)
    -> Scene' scene env dom engine proofB push res
  go env push = case m env push of
    Left s -> getFrame s env push
    Right r ->
      let
        { context, value } = unsafeUnDOM r
      in
        { instructions: context.instructions
        , res: context.res
        , next:
            trans
              $ unsafeDOM
                { context: context { instructions = [], res = mempty }
                , value
                }
        }

withStart
  :: forall scene env dom engine push res graph control
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => ( env
       -> (push -> Effect Unit)
       -> InitialDOM dom engine res Unit
       -> DOM dom engine Frame0 res graph control
     )
  -> ( forall proofB
        . DOM dom engine proofB res graph control
       -> scene env dom engine proofB push res
     )
  -> scene env dom engine Frame0 push res
withStart m ct = makeScene
  ( \e p -> case e of
      Left en -> let f = m en p in Left $ makeSceneR' (f start) ct
      -- this will lead to a infiniteLoop
      -- it's the comonad version of bottom
      -- but as we can never start with a push from our own component
      -- this will "never" happen... until it does...
      Right _ -> Right start
  )
  infiniteLoop

-- | Freezes the current dom frame.
-- |
infiniteLoop
  :: forall scene env dom engine proof push res graph x
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => DOM dom engine proof res graph x
  -> scene env dom engine proof push res
infiniteLoop s = makeScene (const $ const $ Right s) infiniteLoop

-- | Loops dom.
-- |
-- | The first argument is the loop and the second argument is the incoming graph that gets rendered before the loop.
-- | This means that all changes applied in the loop must be separately applied to the incoming frame if they are relevant.
-- | ```
loop
  :: forall scene env dom engine proofA push res graph control
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => ( forall proofB
        . DOM dom engine proofB res graph control
       -> Either env push
       -> (push -> Effect Unit)
       -> DOM dom engine proofB res graph control
     )
  -> DOM dom engine proofA res graph control
  -> scene env dom engine proofA push res
loop fa ma = makeSceneR (fa ma) (loop fa)

-- | Similar to `makeScene`, but without the possibility to branch to a new scene. Aliased as `@|>`.
makeSceneR
  :: forall scene env dom engine proofA push res graph control
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => ( Either env push
       -> (push -> Effect Unit)
       -> DOM dom engine proofA res graph control
     )
  -> ( forall proofB
        . DOM dom engine proofB res graph control
       -> scene env dom engine proofB push res
     )
  -> scene env dom engine proofA push res
makeSceneR a b = makeScene ((map <<< map) Right a) b

infixr 6 makeSceneR as @|>

-- | Similar to `makeSceneR'`, but without the possibility to consult an env. Aliased as `@||>`.
makeSceneR'
  :: forall scene env dom engine proofA push res graph control
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => DOM dom engine proofA res graph control
  -> ( forall proofB
        . DOM dom engine proofB res graph control
       -> scene env dom engine proofB push res
     )
  -> scene env dom engine proofA push res
makeSceneR' a b = makeSceneR (const $ const a) b

infixr 6 makeSceneR' as @||>

-- | Modifies the residual for a frame and returns the result.
-- | If a frame never modifies its residual, the value of `mempty`
-- | for `res` is returned to the scene.
modifyRes'Impl
  :: forall dom engine proof res i a
   . (res -> res)
  -> DOM dom engine proof res i a
  -> DOM dom engine proof res i res
modifyRes'Impl f w = unsafeDOM
  { context: (context { res = res' }), value: res' }
  where
  { context } = unsafeUnDOM w

  res' = f context.res

modifyRes
  :: forall dom engine proof res i
   . (res -> res)
  -> MDOM dom engine proof res i res
modifyRes f = MDOM (modifyRes'Impl f)

---
loopUsingSceneG
  :: forall env dom engine push res sn graph control
   . Monoid res
  => DOMInterpret dom engine
  => Create (root :: Element Root sn) () graph
  => ( env
       -> (push -> Effect Unit)
       -> { root :: Element Root sn } /\ control
     )
  -> ( forall proofB
        . Either env push
       -> control
       -> MDOM dom engine proofB res graph control
     )
  -> Scene env dom engine Frame0 push res
loopUsingSceneG f = loopUsingSceneGWithRes
  ((map <<< map) (\(x /\ y) -> (x /\ y /\ (mempty :: res))) f)

loopUsingSceneGWithRes
  :: forall env dom engine push res sn graph control
   . Monoid res
  => DOMInterpret dom engine
  => Create (root :: Element Root sn) () graph
  => ( env
       -> (push -> Effect Unit)
       -> { root :: Element Root sn } /\ control /\ res
     )
  -> ( forall proofB
        . Either env push
       -> control
       -> MDOM dom engine proofB res graph control
     )
  -> Scene env dom engine Frame0 push res
loopUsingSceneGWithRes sceneF0 loopF =
  ( \env push stt ->
      let
        scene /\ control /\ res = sceneF0 env push
      in
        (modifyRes'Impl (const res) (create (stt $> scene))) $> control
  ) `withStart`
    (loop \f x _ -> let (MDOM o) = loopF x (extract f) in o f)

-- sg
loopUsingSceneSG
  :: forall env dom engine push res sn graph control
   . Monoid res
  => DOMInterpret dom engine
  => CreateSG sn () graph
  => ( env
       -> (push -> Effect Unit)
       -> { | sn } /\ control
     )
  -> ( forall proofB
        . Either env push
       -> control
       -> MDOM dom engine proofB res graph control
     )
  -> SubScene env dom engine Frame0 push res
loopUsingSceneSG f = loopUsingSceneSGWithRes
  ((map <<< map) (\(x /\ y) -> (x /\ y /\ (mempty :: res))) f)

loopUsingSceneSGWithRes
  :: forall env dom engine push res sn graph control
   . Monoid res
  => DOMInterpret dom engine
  => CreateSG sn () graph
  => ( env
       -> (push -> Effect Unit)
       -> { | sn } /\ control /\ res
     )
  -> ( forall proofB
        . Either env push
       -> control
       -> MDOM dom engine proofB res graph control
     )
  -> SubScene env dom engine Frame0 push res
loopUsingSceneSGWithRes sceneF0 loopF =
  ( \env push stt ->
      let
        scene /\ control /\ res = sceneF0 env push
      in
        (modifyRes'Impl (const res) (createSG (stt $> scene))) $> control
  ) `withStart`
    (loop \f x _ -> let (MDOM o) = loopF x (extract f) in o f)

infix 6 loopUsingSceneG as @>
infix 6 loopUsingSceneGWithRes as @!>

infix 6 loopUsingSceneSG as %>
infix 6 loopUsingSceneSGWithRes as %!>
