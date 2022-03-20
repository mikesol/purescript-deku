module Deku.Control.Functions
  ( start
  , istart
  , startUsing
  , startUsingWithHint
  , loopUsingScene
  , loopUsingSceneWithRes
  , modifyRes
  , imodifyRes
  , makeScene
  , makeSceneFlipped
  , makeSceneR
  , makeSceneRFlipped
  , makeSceneR'
  , makeSceneR'Flipped
  , loop
  , iloop
  , branch
  , ibranch
  , icont
  , freeze
  , (@>)
  , (@!>)
  , (@|>)
  , (@||>)
  , (<@)
  , (<|@)
  , (<||@)
  , class GraphHint
  ) where

import Prelude

import Control.Apply.Indexed ((:*>))
import Control.Comonad (extract)
import Data.Either (Either(..))
import Data.Tuple.Nested (type (/\))
import Effect (Effect)
import Record as R
import Deku.Change (class Change, ichange)
import Deku.Control.Indexed (IxDOM(..))
import Deku.Control.Types (class IsScene, DOMState', DOM, Frame0, Scene', InitialDOM, getFrame, unFrame, unsafeDOM, unsafeUnDOM)
import Deku.Create (class Create, icreate)
import Deku.CreateT (class CreateT)
import Deku.Interpret (class DOMInterpret)
import Deku.Patch (class GetSubgraphs, class GetTumults, class Patch, PatchInfo, ipatch)

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

infixr 6 makeScene as @>

makeSceneFlipped
  :: forall scene env dom engine proofA push res graph control
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => ( forall proofB
        . DOM dom engine proofB res graph control
       -> scene env dom engine proofB push res
     )
  -> ( Either env push
       -> (push -> Effect Unit)
       -> Either (scene env dom engine proofA push res)
            (DOM dom engine proofA res graph control)
     )
  -> scene env dom engine proofA push res
makeSceneFlipped trans m = makeScene m trans

infixr 6 makeSceneFlipped as <@

istart
  :: forall scene env dom engine push res graph control
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => ( env
       -> (push -> Effect Unit)
       -> IxDOM dom engine Frame0 res () graph control
     )
  -> ( forall proofB
        . DOM dom engine proofB res graph control
       -> scene env dom engine proofB push res
     )
  -> scene env dom engine Frame0 push res
istart m ct = makeScene
  ( \e p -> case e of
      Left en -> let IxDOM f = m en p in Left $ makeSceneR' (f start) ct
      -- this will lead to a freeze
      -- it's the comonad version of bottom
      -- but as we can never start with a push from our own component
      -- this will "never" happen... until it does...
      Right _ -> Right start
  )
  freeze

infixr 6 istart as @!>

startUsing
  :: forall scene env dom engine push res graph subgraphs tumults control
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => GetSubgraphs graph subgraphs
  => GetTumults graph tumults
  => Patch subgraphs tumults () graph
  => PatchInfo subgraphs tumults
  -> (env -> (push -> Effect Unit) -> control)
  -> ( forall proofA
        . DOM dom engine proofA res graph control
       -> scene env dom engine proofA push res
     )
  -> scene env dom engine Frame0 push res
startUsing patchInfo control next = (\e p -> (ipatch patchInfo $> control e p))
  @!>
    next

class GraphHint (i :: Type) (o :: Row Type) | i -> o

instance graphHintRec :: GraphHint { | o } o

instance graphHintTuple :: GraphHint right o => GraphHint (left /\ right) o

instance graphHintF :: GraphHint x o => GraphHint (y -> x) o

startUsingWithHint
  :: forall scene env dom engine push res hintable hint graph subgraphs
       tumults control
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => GraphHint hintable hint
  => CreateT hint () graph
  => Patch subgraphs tumults () graph
  => GetSubgraphs graph subgraphs
  => GetTumults graph tumults
  => hintable
  -> PatchInfo subgraphs tumults
  -> (env -> (push -> Effect Unit) -> control)
  -> ( forall proofA
        . DOM dom engine proofA res graph control
       -> scene env dom engine proofA push res
     )
  -> scene env dom engine Frame0 push res
startUsingWithHint _ patchInfo control next =
  (\e p -> (ipatch patchInfo $> control e p)) @!> next

loopUsingScene
  :: forall scene env dom engine push res sn graph control
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => Create sn () graph
  => Change sn graph
  => ( env
       -> (push -> Effect Unit)
       -> control
       -> { scene :: { | sn }, control :: control }
     )
  -> ( Either env push
       -> (push -> Effect Unit)
       -> control
       -> { scene :: { | sn }, control :: control }
     )
  -> (env -> (push -> Effect Unit) -> control)
  -> scene env dom engine Frame0 push res
loopUsingScene a b = loopUsingSceneWithRes (f a) (f b)
  where
  f
    :: forall a b c
     . ( a
         -> b
         -> c
         -> { scene :: { | sn }, control :: control }
       )
    -> ( a
         -> b
         -> c
         -> { scene :: { | sn }, control :: control, res :: res }
       )
  f = (map <<< map <<< map) (R.union { res: mempty :: res })

loopUsingSceneWithRes
  :: forall scene env dom engine push res sn graph control
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => Create sn () graph
  => Change sn graph
  => ( env
       -> (push -> Effect Unit)
       -> control
       -> { scene :: { | sn }, control :: control, res :: res }
     )
  -> ( Either env push
       -> (push -> Effect Unit)
       -> control
       -> { scene :: { | sn }, control :: control, res :: res }
     )
  -> (env -> (push -> Effect Unit) -> control)
  -> scene env dom engine Frame0 push res
loopUsingSceneWithRes sceneF0 sceneF initialControl =
  ( \env push ->
      let
        { scene, control, res } = sceneF0 env push (initialControl env push)
      in
        icreate scene :*> imodifyRes (const res) $> control
  ) @!>
    iloop \env push icontrol ->
      let
        { scene, control, res } = sceneF env push icontrol
      in
        ichange scene *> imodifyRes (const res) $> control

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

iloop
  :: forall scene env dom engine proofA push res graph control
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => ( forall proofB
        . Either env push
       -> (push -> Effect Unit)
       -> control
       -> IxDOM dom engine proofB res graph graph control
     )
  -> DOM dom engine proofA res graph control
  -> scene env dom engine proofA push res
iloop fa = loop (\wa e p -> let IxDOM f = fa e p (extract wa) in f wa)

-- | Accepts a "branch" frame for making a scene, where `Left` is a new scene and `Right` is the current scene looped.
-- |
branch
  :: forall scene env dom engine proofA push res graph control
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => ( forall proofB
        . DOM dom engine proofB res graph control
       -> Either env push
       -> (push -> Effect Unit)
       -> Either (scene env dom engine proofB push res)
            (DOM dom engine proofB res graph control)
     )
  -> DOM dom engine proofA res graph control
  -> scene env dom engine proofA push res
branch fa w = makeScene (fa w) (branch fa)

icont
  :: forall scene env dom engine proof push res graphi grapho a b
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => ( DOM dom engine proof res grapho b
       -> scene env dom engine proof push res
     )
  -> IxDOM dom engine proof res graphi grapho b
  -> DOM dom engine proof res graphi a
  -> scene env dom engine proof push res
icont c (IxDOM x) = c <<< x

ibranch
  :: forall scene env dom engine proofA push res graph control
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => ( forall proofB
        . Either env push
       -> (push -> Effect Unit)
       -> control
       -> Either
            ( DOM dom engine proofB res graph control
              -> scene env dom engine proofB push res
            )
            (IxDOM dom engine proofB res graph graph control)
     )
  -> DOM dom engine proofA res graph control
  -> scene env dom engine proofA push res
ibranch fa =
  branch
    ( \wa e p -> case fa e p (extract wa) of
        Left l -> Left $ l wa
        Right (IxDOM r) -> Right $ r wa
    )

-- | Freezes the current dom frame.
-- |
freeze
  :: forall scene env dom engine proof push res graph x
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => DOM dom engine proof res graph x
  -> scene env dom engine proof push res
freeze s = makeScene (const $ const $ Right s) freeze

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

makeSceneRFlipped
  :: forall scene env dom engine proofA push res graph control
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => ( forall proofB
        . DOM dom engine proofB res graph control
       -> scene env dom engine proofB push res
     )
  -> ( Either env push
       -> (push -> Effect Unit)
       -> DOM dom engine proofA res graph control
     )
  -> scene env dom engine proofA push res
makeSceneRFlipped a b = makeSceneR b a

infixr 6 makeSceneRFlipped as <|@

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

makeSceneR'Flipped
  :: forall scene env dom engine proofA push res graph control
   . Monoid res
  => DOMInterpret dom engine
  => IsScene scene
  => ( forall proofB
        . DOM dom engine proofB res graph control
       -> scene env dom engine proofB push res
     )
  -> DOM dom engine proofA res graph control
  -> scene env dom engine proofA push res
makeSceneR'Flipped a b = makeSceneR' b a

infixr 6 makeSceneR'Flipped as <||@

-- | Modifies the residual for a frame and returns the result.
-- | If a frame never modifies its residual, the value of `mempty`
-- | for `res` is returned to the scene.
modifyRes
  :: forall dom engine proof res i a
   . (res -> res)
  -> DOM dom engine proof res i a
  -> DOM dom engine proof res i res
modifyRes f w = unsafeDOM { context: (context { res = res' }), value: res' }
  where
  { context } = unsafeUnDOM w

  res' = f context.res

-- | Modifies the residual for a frame and returns the result.
-- | If a frame never modifies its residual, the value of `mempty`
-- | for `res` is returned to the scene.
imodifyRes
  :: forall dom engine proof res i
   . (res -> res)
  -> IxDOM dom engine proof res i i res
imodifyRes f = IxDOM (modifyRes f)
