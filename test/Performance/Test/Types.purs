module Performance.Test.Types where

import Prelude

data Test
  = StateHook
  | StateComponent
  | StateDeku
  | TodoHook
  | TodoComponent
  | TodoDeku

derive instance Eq Test
derive instance Ord Test

testToString :: Test -> String
testToString = case _ of
  StateHook -> "state-hook"
  StateComponent -> "state-component"
  StateDeku -> "state-deku"
  TodoHook -> "todo-hook"
  TodoComponent -> "todo-component"
  TodoDeku -> "todo-deku"

-- Used by a test along with its string id to control test start / stop
startSuffix = "-start" :: String
completedSuffix = "-complete" :: String
