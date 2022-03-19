-- | Run a `Scene` to produce sound using the Web DOM API.
module Deku.Run
  ( TriggeredRun
  , TriggeredScene(..)
  , RunDOM
  , RunEngine
  , run
  , defaultOptions
  ) where

import Prelude

import Data.DateTime.Instant (unInstant)
import Data.Either (Either(..))
import Data.Newtype (class Newtype)
import Data.Time.Duration (Milliseconds)
import Data.Tuple (fst, snd)
import Data.Tuple.Nested ((/\), type (/\))
import Deku.Control.Types (Frame0, Scene, oneFrame)
import Deku.Interpret (FFIDOMSnapshot, renderDOM)
import Deku.Rendered (Instruction)
import Effect (Effect)
import Effect.Ref as Ref
import FRP.Behavior (Behavior, sampleBy)
import FRP.Behavior.Time (instant)
import FRP.Event (Event, create, makeEvent, subscribe)

type RunDOM = Unit /\ FFIDOMSnapshot

type RunEngine = Instruction /\ Effect Unit

defaultOptions :: {}
defaultOptions = {}

-- | Run a scene.
-- |
-- | - `Event trigger` is the event to which the scene reacts. `trigger` will contain things like an initial event, mouse clicks, MIDI onsets, OSC commands and any other event to which the scene should respond.  Because of this, the polymorphic type `trigger` is often defined as an ADT with different potential incoming actions, similar to how [actions are defined in Halogen](https://github.com/purescript-halogen/purescript-halogen/blob/master/docs/guide/02-Introducing-Components.md#actions). Note that no sound will be produced unless there is _at least_ one event. For this reason, there is usually some form of initial event, ie `data Trigger = InitialEvent | MouseClick | etc..`, that is sent to start dom rendering. All of the examples in this repo contain an initial event, which is often `pure unit` in the case where there in _only_ the initial event.
-- | - `Behavior world` is the outside environment. `world` will usually contain things like the current mouse position, the ambient temperature, the axial tilt of the Earth, or other things that can be modeled as a continuous function of time. One important thing to note is that `world` _lags_ `trigger` by 0 or 1 events in the [browser event queue](https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop). For most real-world applications, this does not matter, but it does lead to subtle logic bugs if `trigger` and `world` are corrolated. For this reason, it is good to decouple `trigger` and `world`.
-- | - `EngineInfo` is the engine information needed for rendering.
-- | - `FFIDOM` is the dom state needed for rendering
-- | - `Scene` is the scene to render. See `BehavingScene` to understand how `trigger` and `world` are blended into the inptu environment going to `Scene`.
type RunSig
  sceneType
  engineInfoType
  output
  trigger
  world
  push
  res =
  Monoid res
  => Event trigger
  -> Behavior world
  -> engineInfoType
  -> FFIDOMSnapshot
  -> Scene (sceneType trigger world)
       RunDOM
       RunEngine
       Frame0
       push
       res
  -> Event output

run
  :: forall trigger world push res
   . RunSig TriggeredScene {} (TriggeredRun res)
       trigger
       world
       push
       res
run trigger inWorld _ domInfo scene =
  makeEvent \reporter -> do
    evt <- create
    currentScene <- Ref.new scene
    let
      newWorld =
        { world: _
        , sysTime: _
        }
          <$> inWorld
          <*> map unInstant instant
      eventAndEnv =
        sampleBy
          ( \{ world
             , sysTime
             }
             b ->
              TriggeredScene
                { trigger: b
                , world
                , sysTime
                }
          )
          newWorld
          trigger
    let
      subFn ee = do
        sceneNow <- Ref.read currentScene
        let
          fromScene =
            oneFrame sceneNow
              ee
              evt.push
        let
          applied = map ((#) (unit /\ domInfo)) fromScene.instructions
        renderDOM (map snd applied)
        Ref.write fromScene.next currentScene
        reporter
          { instructions: map fst applied
          , res: fromScene.res
          }
    unsubscribe0 <- subscribe eventAndEnv (subFn <<< Left)
    unsubscribe1 <- subscribe evt.event (subFn <<< Right)
    pure (unsubscribe0 *> unsubscribe1)

type TriggeredRun res =
  { instructions :: Array Instruction
  , res :: res
  }

newtype TriggeredScene trigger world = TriggeredScene
  { trigger :: trigger
  , world :: world
  , sysTime :: Milliseconds
  }

derive instance newtypeTriggeredScene ::
  Newtype (TriggeredScene trigger world) _
