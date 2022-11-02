module Performance.Setup.Measure where

import Prelude hiding (compare)

import Control.Monad.Rec.Class (forever)
import Data.Array (fold, replicate)
import Data.Array as Array
import Data.Foldable (foldl, for_, maximum, sum)
import Data.Maybe (Maybe(..), fromJust, fromMaybe, isJust)
import Data.Traversable (for)
import Effect.Aff (Aff, bracket, delay, error, forkAff, killFiber, throwError)
import Effect.Aff as Aff
import Effect.Aff.AVar as AVar
import Effect.Class (liftEffect)
import Node.Path (resolve)
import Partial.Unsafe (unsafePartial)
import Performance.Setup.Puppeteer (Browser, FilePath(..), Kilobytes(..), Milliseconds(..), Page)
import Performance.Setup.Puppeteer as Puppeteer
import Performance.Test.Todo.Shared (addNewId, checkId, editId, saveId, undoId)
import Performance.Test.Types (Test(..), completedSuffix, startSuffix, testToString)

type PerformanceSummary =
  { averageFPS :: Int
  , peakHeap :: Kilobytes
  , averageHeap :: Kilobytes
  , scriptTime :: Milliseconds
  , totalTime :: Milliseconds
  }

type ComparisonSummary =
  { hookResults :: Array PerformanceSummary
  , hookAverage :: PerformanceSummary
  , componentResults :: Array PerformanceSummary
  , componentAverage :: PerformanceSummary
  , dekuResults :: Array PerformanceSummary
  , dekuAverage :: PerformanceSummary
  }

-- | Bracket test runs by supplying a new browser to each one
withBrowser :: (Browser -> Aff Unit) -> Aff Unit
withBrowser = bracket (Puppeteer.launch { headless: true })
  Puppeteer.closeBrowser

data TestType = StateTest | TodoTest

testTypeToString :: TestType -> String
testTypeToString = case _ of
  StateTest -> "state-test"
  TodoTest -> "todo-test"

compare :: Browser -> Int -> TestType -> Aff ComparisonSummary
compare browser n testType = do
  let runs = replicate n (compareOnce browser testType)
  results <- for runs (delay (Aff.Milliseconds 100.0) *> _)

  let
    hookResults = map _.hook results
    componentResults = map _.component results
    dekuResults = map _.deku results
    hookAverage = average hookResults
    componentAverage = average componentResults
    dekuAverage = average dekuResults

  pure
    { hookResults
    , hookAverage
    , componentResults
    , componentAverage
    , dekuResults
    , dekuAverage
    }

compareOnce
  :: Browser
  -> TestType
  -> Aff
       { hook :: PerformanceSummary
       , component :: PerformanceSummary
       , deku :: PerformanceSummary
       }
compareOnce browser = case _ of
  StateTest -> do
    hook <- measure browser StateHook
    component <- measure browser StateComponent
    deku <- measure browser StateDeku
    pure { hook, component, deku }

  TodoTest -> do
    hook <- measure browser TodoHook
    component <- measure browser TodoComponent
    deku <- measure browser TodoDeku
    pure { hook, component, deku }

measure :: Browser -> Test -> Aff PerformanceSummary
measure browser test = do
  page <- Puppeteer.newPage browser

  path <- liftEffect $ resolve [] "test/test.html"
  Puppeteer.goto page ("file://" <> path)

  -- Prepare by selecting the test to mount
  let selector = prependHash (testToString test)
  mbTestElem <- Puppeteer.waitForSelector page selector

  -- Prepare for the test by collecting garbage (for more accurate heap usage
  -- metrics) and starting metrics collection
  let
    tracePath = FilePath $ fold
      [ "test-results/", testToString test, "-trace.json" ]

  -- Initialize data for capturing heap measurements
  var <- AVar.new { captures: [], count: 0 }

  -- Collect garbage in preparation for heap measurements
  Puppeteer.enableHeapProfiler page
  Puppeteer.collectGarbage page

  -- Start recording the performance trace, depositing the resulting trace file
  -- to `tracePath` so it can be manually analyzed
  Puppeteer.startTrace page tracePath

  -- Collect initial timestamp and heap usage
  initialPageMetrics <- Puppeteer.pageMetrics page

  -- Start collecting heap measurements every 10 milliseconds
  --
  -- TODO: It may be better to ditch the dependencies and just use this strategy
  -- with `requestAnimationFrame` to measure the FPS as well.
  heapFiber <- forkAff $ forever do
    { heapUsed } <- Puppeteer.pageMetrics page
    { captures, count } <- AVar.take var
    AVar.put { captures: Array.snoc captures heapUsed, count: count + 1 } var
    delay $ Aff.Milliseconds 10.0

  -- Run the test to completion
  for_ mbTestElem Puppeteer.click
  runScriptForTest page test

  -- Retrieve heap captures
  { captures, count } <- AVar.take var

  -- Collect final timestamp and heap usage
  finalPageMetrics <- Puppeteer.pageMetrics page

  -- Stop recording the trace and write it to disk
  trace <- Puppeteer.stopTrace page
  Puppeteer.closePage page
  killFiber (error "time's up!") heapFiber

  -- Use the trace to get the average FPS during the execution
  mbModel <- Puppeteer.getPerformanceModel trace
  let averageFPS = Puppeteer.getAverageFPS $ unsafePartial $ fromJust mbModel

  -- Use the trace to retrieve time spent executing scripts (JS execution)
  scriptTime <- liftEffect (Puppeteer.readScriptingTime tracePath)

  -- Use the initial and final metrics to record the total time spent recording
  -- the trace
  let totalTime = finalPageMetrics.timestamp - initialPageMetrics.timestamp

  -- Use the heap usage captures to record the average heap usage during
  -- execution, minus the heap that existed when the trace began.
  let
    peakHeap = fromMaybe (Kilobytes 0) $ map (_ - initialPageMetrics.heapUsed) $
      maximum captures
    averageHeap = (sum captures / Kilobytes count) - initialPageMetrics.heapUsed

  pure { averageFPS, averageHeap, peakHeap, scriptTime, totalTime }

-- TODO: Replace query selectors
--
-- Currently tests use query selectors to start tests and understand when a test
-- has completed. But it would be better to expose an interface via the window
-- object that can be used to query the Halogen application and run tests. This
-- would allow tests to:
--
--   1. Query the application and await the result; when the result is received
--      then the test is complete and the timer can stop.
--
--   2. Alternately, query the application and subscribe to output messages which
--      will record when a test has completed.
--
-- The Halogen application can register functions onto the window object at app
-- startup (in the `main` function). The `Puppeteer.evaluate` function enables
-- calling functions within Puppeteer, and the `Puppeteer.exposeFunction` function
-- enables a function which evaluates within Puppeteer to be called from outside.
--
-- Until then, though, we'll just rely on query selectors.
runScriptForTest :: Page -> Test -> Aff Unit
runScriptForTest page test = do
  let selector = prependHash (testToString test)
  if test == StateHook || test == StateComponent || test == StateDeku then do
    n <- Puppeteer.waitForSelector page (selector <> startSuffix)
    for_ n Puppeteer.click
    void $ Puppeteer.waitForSelector page (selector <> completedSuffix)

  else if test == TodoHook || test == TodoComponent || test == TodoDeku then do
    addNew <- Puppeteer.waitForSelector page (prependHash addNewId)
    for_ addNew Puppeteer.click

    check0 <- Puppeteer.waitForSelector page (prependHash $ checkId 0)
    for_ check0 Puppeteer.click
    check1 <- Puppeteer.waitForSelector page (prependHash $ checkId 1)
    for_ check1 Puppeteer.click

    Puppeteer.focus page (prependHash $ editId 5)
    oldValue <- Puppeteer.getInputFieldValue page (prependHash $ editId 5)
    Puppeteer.typeWithKeyboard page "is so fun"
    save5 <- Puppeteer.waitForSelector page (prependHash $ saveId 5)
    for_ save5 Puppeteer.click
    newValue <- Puppeteer.getInputFieldValue page (prependHash $ editId 5)
    -- assert that the value has changed
    unless
      ( isJust newValue && newValue ==
          (append <$> oldValue <*> pure "is so fun")
      )
      do
        throwError
          ( error
              ("Value not updated: " <> show oldValue <> " " <> show newValue)
          )

    undo <- Puppeteer.waitForSelector page (prependHash undoId)
    for_ undo Puppeteer.click
    undoValue <- Puppeteer.getInputFieldValue page (prependHash $ editId 5)
    -- assert that the undo operation worked
    unless (oldValue == undoValue) do
      throwError
        (error ("Value not undone: " <> show oldValue <> " " <> show newValue))

    shouldBeChecked <- Puppeteer.getChecked page (prependHash $ checkId 1)

    unless (shouldBeChecked == Just true) do
      throwError (error ("Checkbox not checked"))

    for_ undo Puppeteer.click
    shouldBeUnchecked <- Puppeteer.getChecked page (prependHash $ checkId 1)

    unless (shouldBeUnchecked == Just false) do
      throwError (error ("Checkbox still checked"))

    for_ check0 Puppeteer.click
    for_ check1 Puppeteer.click

  else
    throwError $ error "Impossible!!!"

prependHash :: String -> String
prependHash str = "#" <> str

average :: Array PerformanceSummary -> PerformanceSummary
average summaries = do
  let
    summary = foldl (+) zero summaries
    total = Array.length summaries

  { averageFPS: summary.averageFPS / total
  , averageHeap: summary.averageHeap / Kilobytes total
  , peakHeap: summary.peakHeap / Kilobytes total
  , scriptTime: summary.scriptTime / Milliseconds total
  , totalTime: summary.totalTime / Milliseconds total
  }
