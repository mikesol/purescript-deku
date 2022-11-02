module Performance.Snapshot.Write where

import Prelude hiding (compare)

import Data.Argonaut.Core (stringifyWithIndent)
import Data.Argonaut.Encode (encodeJson)
import Data.Foldable (fold)
import Effect (Effect)
import Effect.Aff (bracket, launchAff_)
import Effect.Class (liftEffect)
import Effect.Class.Console as Console
import Effect.Exception (catchException)
import Node.Encoding (Encoding(..))
import Node.FS.Sync (mkdir, writeTextFile)
import Performance.Setup.Measure (TestType(..), compare)
import Performance.Setup.Puppeteer as Puppeteer
import Performance.Snapshot (Snapshot)

main :: Effect Unit
main = launchAff_ do
  bracket (Puppeteer.launch { headless: true }) Puppeteer.closeBrowser
    \browser -> do
      liftEffect do
        Puppeteer.filterConsole
        catchException mempty (mkdir "test-results")

      Console.log "Running state tests..."
      state <- compare browser 6 StateTest
      liftEffect do
        writeSnapshot StateTest
          { componentAverage: state.componentAverage
          , hookAverage: state.hookAverage
          , dekuAverage: state.dekuAverage
          }

      Console.log "Running todo tests..."
      todo <- compare browser 6 TodoTest
      liftEffect do
        writeSnapshot TodoTest
          { componentAverage: todo.componentAverage
          , hookAverage: todo.hookAverage
          , dekuAverage: todo.dekuAverage
          }

      Console.log "Done with snapshots!"
  where
  writeSnapshot :: TestType -> Snapshot -> Effect Unit
  writeSnapshot test snapshot = do
    writeTextFile UTF8 snapshotPath.js (snapshotTemplate snapshot)
    writeTextFile UTF8 snapshotPath.purs snapshotPursTemplate

    where
    moduleName = testTypeToModule test

    snapshotPath = do
      let path = "test/Performance/Snapshot/" <> moduleName
      { purs: path <> ".purs", js: path <> ".js" }

    snapshotPursTemplate =
      fold
        [ "{- AUTOMATICALLY GENERATED, DO NOT EDIT -}\n"
        , "\n"
        , "module Performance.Snapshot." <> moduleName <> " where\n"
        , "\n"
        , "import Data.Argonaut.Core (Json)\n"
        , "\n"
        , "foreign import result :: Json\n"
        ]

    snapshotTemplate results =
      "export const result = " <> stringifyWithIndent 2 (encodeJson results)

testTypeToModule :: TestType -> String
testTypeToModule = case _ of
  StateTest -> "StateTest"
  TodoTest -> "TodoTest"
