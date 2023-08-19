module Performance.Snapshot where

import Prelude

import Data.Argonaut.Core (Json)
import Data.Argonaut.Decode (JsonDecodeError, decodeJson)
import Data.Either (Either, fromRight')
import Data.Int (toNumber)
import Data.Int as Int
import Data.Newtype (unwrap)
import Effect.Exception.Unsafe (unsafeThrow)
import Performance.Setup.Measure (PerformanceSummary)
import Performance.Snapshot.StateTest as StateTest
import Performance.Snapshot.TodoTest as TodoTest

-- A subset of the `ComparisonSummary` type in `Performance.Setup.Measure`
type Snapshot =
  { componentAverage :: PerformanceSummary
  , hookAverage :: PerformanceSummary
  , dekuAverage :: PerformanceSummary
  }

decodeSnapshot :: Json -> Either JsonDecodeError Snapshot
decodeSnapshot = decodeJson

snapshots :: { state :: Snapshot, todo :: Snapshot }
snapshots = fromRight' (\_ -> unsafeThrow "expected Right") do
  state <- decodeJson StateTest.result
  todo <- decodeJson TodoTest.result
  pure { state, todo }

type Percent = String

formatPercent :: Int -> String
formatPercent percent = show percent <> "%"

percentChange
  :: PerformanceSummary
  -> PerformanceSummary
  -> { averageFPS :: Percent
     , averageHeap :: Percent
     , peakHeap :: Percent
     , scriptTime :: Percent
     }
percentChange value1 value2 = do
  let
    change new old = do
      let
        newN = toNumber new
        oldN = toNumber old
      formatPercent $ Int.round (((newN - oldN) / oldN) * 100.0)
  { averageFPS:
      change value1.averageFPS value2.averageFPS
  , averageHeap:
      change (unwrap value1.averageHeap) (unwrap value2.averageHeap)
  , peakHeap:
      change (unwrap value1.peakHeap) (unwrap value2.peakHeap)
  , scriptTime:
      change (unwrap value1.scriptTime) (unwrap value2.scriptTime)
  }
