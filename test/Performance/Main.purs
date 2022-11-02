module Performance.Main where

import Prelude hiding (compare)

import Data.Argonaut.Core (stringifyWithIndent)
import Data.Argonaut.Encode (encodeJson)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Aff (Milliseconds(..), launchAff_)
import Effect.Class (liftEffect)
import Effect.Class.Console as Console
import Effect.Exception (catchException)
import Node.Encoding (Encoding(..))
import Node.FS.Sync (mkdir, writeTextFile)
import Performance.Setup.Measure (ComparisonSummary, TestType(..), compare, testTypeToString, withBrowser)
import Performance.Setup.Puppeteer as Puppeteer
import Performance.Snapshot (percentChange, snapshots)
import Test.Spec (Spec, around, describe, it)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (defaultConfig, runSpec')

main :: Effect Unit
main = launchAff_ do
  runSpec' (defaultConfig { timeout = Just (Milliseconds 60_000.0) })
    [ consoleReporter ]
    do
      describe "Peformance" spec

-- These tests have wide acceptance ranges because of the variability of banchmarks
-- via Puppeteer in general. But they do have some light boundaries and should
-- be manually reviewed in any pull request which touches library internals.
spec :: Spec Unit
spec = around withBrowser do
  it "Should satisfy state benchmark" \browser -> do
    -- We can safely disregard 'Failed to parse CPU profile' log messages. This
    -- disables those logs from this point onwards in the program execution (all
    -- following benchmarks).
    liftEffect do
      Puppeteer.filterConsole
      catchException mempty (mkdir "test-results")

    let test = StateTest
    result <- compare browser 3 test
    liftEffect do
      writeResult test result
      Console.log
        "Wrote state test results to test-results (including snapshot change)."

  it "Should satisfy todo benchmark" \browser -> do
    let test = TodoTest
    result <- compare browser 3 test
    liftEffect do
      writeResult test result
      Console.log
        "Wrote todo test results to test-results (including snapshot change)."

writeResult :: TestType -> ComparisonSummary -> Effect Unit
writeResult
  test
  { componentAverage
  , hookAverage
  , dekuAverage
  , componentResults
  , hookResults
  , dekuResults
  } = do
  writePath "summary" $ encodeJson
    { componentAverage, hookAverage, dekuAverage }

  writePath "results" $ encodeJson
    { componentResults, hookResults, dekuResults }

  writePath "change" $ encodeJson $ case test of
    StateTest ->
      { componentChange:
          percentChange snapshots.state.componentAverage componentAverage
      , hookChange:
          percentChange snapshots.state.hookAverage hookAverage
      , dekuChange:
          percentChange snapshots.state.dekuAverage dekuAverage
      }
    TodoTest ->
      { componentChange:
          percentChange snapshots.todo.componentAverage componentAverage
      , hookChange:
          percentChange snapshots.todo.hookAverage hookAverage
      , dekuChange:
          percentChange snapshots.todo.dekuAverage dekuAverage
      }
  where
  writePath label =
    stringifyWithIndent 2 >>> writeTextFile UTF8 (mkPath label)

  mkPath label =
    "test-results/" <> testTypeToString test <> "-" <> label <> ".json"
