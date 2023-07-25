module Performance.Setup.Puppeteer
  ( filterConsole
  , Browser
  , launch
  , Page
  , newPage
  , debug
  , click
  , waitForSelector
  , getInputFieldValue
  , getChecked
  , focus
  , typeWithKeyboard
  , goto
  , closePage
  , closeBrowser
  , enableHeapProfiler
  , collectGarbage
  , FilePath(..)
  , startTrace
  , Trace
  , stopTrace
  , PerformanceModel
  , getPerformanceModel
  , getAverageFPS
  , Kilobytes(..)
  , Milliseconds(..)
  , PageMetrics
  , pageMetrics
  , readScriptingTime
  ) where

import Prelude

import Control.Promise (Promise, toAffE)
import Data.Argonaut.Core (Json)
import Data.Argonaut.Decode (class DecodeJson, decodeJson, printJsonDecodeError, (.:), (.:?))
import Data.Argonaut.Encode (class EncodeJson, encodeJson)
import Data.Either (Either(..))
import Data.Int (round)
import Data.Int as Int
import Data.Maybe (Maybe, fromJust, fromMaybe)
import Data.Newtype (class Newtype)
import Data.Nullable (Nullable, toMaybe)
import Data.String.CodeUnits as String
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Effect.Exception (throw)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import Node.Path as Path
import Partial.Unsafe (unsafePartial)
import Web.HTML (HTMLElement)

-- | Turn off noisy messages from the Puppeteer tests
foreign import filterConsoleImpl :: Effect Unit

filterConsole = filterConsoleImpl :: Effect Unit

-- | An instance of a Puppeteer browser, which should be created at
-- | the start of any Puppeteer session and closed at the end.
foreign import data Browser :: Type

-- | The headless :: Boolean argument specifies whether or not to run the browser in headless mode.
-- | To debug/test visually, set headless to false
type LaunchArgs =
  { headless :: Boolean
  }

foreign import launchImpl :: LaunchArgs -> Effect (Promise Browser)

launch :: LaunchArgs -> Aff Browser
launch config = toAffE (launchImpl config)

-- | An instance of a Puppeteer page, which is necessary to run page-level
-- | functions like collecting metrics and starting and stopping traces.
foreign import data Page :: Type

foreign import newPageImpl :: EffectFn1 Browser (Promise Page)

-- | Create a running instance of a `Page`
newPage :: Browser -> Aff Page
newPage = toAffE1 newPageImpl

foreign import debugImpl :: EffectFn1 Page Unit

-- | Enable logs from the Puppeteer instance
debug :: Page -> Aff Unit
debug = liftEffect <<< runEffectFn1 debugImpl

foreign import clickImpl :: EffectFn1 HTMLElement (Promise Unit)

click :: HTMLElement -> Aff Unit
click = toAffE1 clickImpl

foreign import waitForSelectorImpl
  :: EffectFn2 Page String (Promise (Nullable HTMLElement))

waitForSelector :: Page -> String -> Aff (Maybe HTMLElement)
waitForSelector page selector = map toMaybe
  (toAffE2 waitForSelectorImpl page selector)

foreign import getInputFieldValueImpl
  :: EffectFn2 Page String (Promise (Nullable String))

getInputFieldValue :: Page -> String -> Aff (Maybe String)
getInputFieldValue page selector = map toMaybe
  (toAffE2 getInputFieldValueImpl page selector)

foreign import getCheckedImpl
  :: EffectFn2 Page String (Promise (Nullable Boolean))

getChecked :: Page -> String -> Aff (Maybe Boolean)
getChecked page selector = map toMaybe (toAffE2 getCheckedImpl page selector)

foreign import focusImpl :: EffectFn2 Page String (Promise Unit)

focus :: Page -> String -> Aff Unit
focus = toAffE2 focusImpl

foreign import typeWithKeybordImpl :: EffectFn2 Page String (Promise Unit)

typeWithKeyboard :: Page -> String -> Aff Unit
typeWithKeyboard = toAffE2 typeWithKeybordImpl

foreign import gotoImpl :: EffectFn2 Page Path.FilePath (Promise Unit)

goto :: Page -> Path.FilePath -> Aff Unit
goto = toAffE2 gotoImpl

foreign import closePageImpl :: EffectFn1 Page (Promise Unit)

-- | Terminate the running Puppeteer page
closePage :: Page -> Aff Unit
closePage = toAffE1 closePageImpl

foreign import closeBrowserImpl :: EffectFn1 Browser (Promise Unit)

-- | Terminate the running Puppeteer browser, ending the session
closeBrowser :: Browser -> Aff Unit
closeBrowser = toAffE1 closeBrowserImpl

foreign import enableHeapProfilerImpl :: EffectFn1 Page (Promise Unit)

-- | Turn on the heap profiler, enabling JS heap measurements and manual garbage
-- | collection for more reliable benchmarking
enableHeapProfiler :: Page -> Aff Unit
enableHeapProfiler = toAffE1 enableHeapProfilerImpl

foreign import collectGarbageImpl :: EffectFn1 Page (Promise Unit)

-- | Manually trigger garbage collection, which can be used to ensure more
-- | accurate heap usage
collectGarbage :: Page -> Aff Unit
collectGarbage = toAffE1 collectGarbageImpl

newtype FilePath = FilePath String

derive instance Newtype FilePath _

foreign import startTraceImpl :: EffectFn2 Page FilePath (Promise Unit)

-- | Begin measuring a performance trace. Use `stopTrace` to complete the
-- | measurement and write it to the specified file path. This trace can then
-- | be loaded up in the Chrome Dev Tools.
startTrace :: Page -> FilePath -> Aff Unit
startTrace = toAffE2 startTraceImpl

-- | The opaque blob returned by a performance trace, which can be analyzed to
-- | retrieve performance measurements like FPS.
foreign import data Trace :: Type

foreign import stopTraceImpl :: EffectFn1 Page (Promise Trace)

-- | Begin measuring a performance trace. Use `stopTrace` to complete the
-- | measurement.
stopTrace :: Page -> Aff Trace
stopTrace = toAffE1 stopTraceImpl

-- | The opaque blob returned by the `getPerformanceModel` function, which can
-- | be used to retrieve the average frames per second over the measured duration
foreign import data PerformanceModel :: Type

foreign import getPerformanceModelImpl
  :: EffectFn1 Trace (Promise (Nullable PerformanceModel))

getPerformanceModel :: Trace -> Aff (Maybe PerformanceModel)
getPerformanceModel = map toMaybe <<< toAffE1 getPerformanceModelImpl

-- | Retrieve the average frames per second over the course of the performance trace
foreign import getAverageFPS :: PerformanceModel -> Int

type JSPageMetrics =
  { "JSHeapUsedSize" :: Number -- megabytes
  , "Timestamp" :: Number -- microseconds
  }

foreign import pageMetricsImpl :: EffectFn1 Page (Promise JSPageMetrics)

newtype Kilobytes = Kilobytes Int

derive instance Newtype Kilobytes _
derive newtype instance Eq Kilobytes
derive newtype instance Ord Kilobytes
derive newtype instance Semiring Kilobytes
derive newtype instance Ring Kilobytes
derive newtype instance CommutativeRing Kilobytes
derive newtype instance EuclideanRing Kilobytes

instance EncodeJson Kilobytes where
  encodeJson = encodeJson <<< show

instance DecodeJson Kilobytes where
  decodeJson json = decodeJson json >>= \str -> do
    pure
      ( Kilobytes
          (unsafePartial (fromJust (Int.fromString (String.dropRight 2 str))))
      )

instance Show Kilobytes where
  show (Kilobytes kb) = show kb <> "kb"

newtype Milliseconds = Milliseconds Int

derive instance Newtype Milliseconds _
derive newtype instance Eq Milliseconds
derive newtype instance Ord Milliseconds
derive newtype instance Semiring Milliseconds
derive newtype instance Ring Milliseconds
derive newtype instance CommutativeRing Milliseconds
derive newtype instance EuclideanRing Milliseconds

instance EncodeJson Milliseconds where
  encodeJson = encodeJson <<< show

instance Show Milliseconds where
  show (Milliseconds ms) = show ms <> "ms"

instance DecodeJson Milliseconds where
  decodeJson json = decodeJson json >>= \str -> do
    pure
      ( Milliseconds
          (unsafePartial (fromJust (Int.fromString (String.dropRight 2 str))))
      )

-- | A snapshot of current page data
type PageMetrics =
  { heapUsed :: Kilobytes
  , timestamp :: Milliseconds
  }

-- | Retrieve a snapshot of the current page metrics, which can be used to see
-- | current heap usage and execution times
pageMetrics :: Page -> Aff PageMetrics
pageMetrics = toAffE1 pageMetricsImpl >>> map
  \{ "JSHeapUsedSize": heap, "Timestamp": ts } ->
    { heapUsed: Kilobytes (round (heap / 1000.0))
    , timestamp: Milliseconds (round (ts * 1000.0))
    }

-- | Retrieve the time spent in scripting during the execution
readScriptingTime :: FilePath -> Effect Milliseconds
readScriptingTime fp = do
  json <- tracealyzer fp

  let
    decoded = do
      obj <- decodeJson json
      (_ .:? "scripting") =<< (_ .: "categories") =<< obj .: "profiling"

  case decoded of
    Left err -> throw $ printJsonDecodeError err
    Right val -> pure $ Milliseconds $ round $ fromMaybe 0.0 val

foreign import tracealyzerImpl :: FilePath -> Effect Json

tracealyzer :: FilePath -> Effect Json
tracealyzer = tracealyzerImpl

toAffE1 :: forall a b. EffectFn1 a (Promise b) -> a -> Aff b
toAffE1 fn = toAffE <<< runEffectFn1 fn

toAffE2 :: forall a b c. EffectFn2 a b (Promise c) -> a -> b -> Aff c
toAffE2 fn a b = toAffE (runEffectFn2 fn a b)
