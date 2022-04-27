module Test.Main where

import Prelude

-- import Control.Alt ((<|>))
-- import Data.Tuple (Tuple(..), snd)
-- import Data.Tuple.Nested ((/\))
import Effect (Effect)
-- import Effect.Aff (launchAff_)
-- import Effect.Class (liftEffect)
-- import Effect.Ref (Ref, modify, new, read)
-- import FRP.Behavior (Behavior, behavior)
-- import FRP.Event (Event, create, fix, makeEvent, sampleOn, subscribe)
-- import FRP.Event.Class (bang)
-- import Test.Spec (describe, it)
-- import Test.Spec.Assertions (shouldEqual)
-- import Test.Spec.Reporter (consoleReporter)
-- import Test.Spec.Runner (runSpec)

-- data Color = Red | Green | Blue

-- c2s :: Color -> String
-- c2s Red = "red"
-- c2s Green = "green"
-- c2s Blue = "blue"

-- idTrain :: Ref Int -> Behavior Int
-- idTrain r = behavior \f -> makeEvent \k -> do
--   r' <- modify (add 1) r
--   subscribe f \x -> k (x r')

-- --------
-- counter :: forall a. Event a -> Event (Tuple a Int)
-- counter event = fix
--   ( \i ->
--       let
--         output = sampleOn (i <|> bang 0) (Tuple <$> event)
--       in
--         { input: map (add 1 <<< snd) output, output }
--   )
-- ---------

main :: Effect Unit
main = mempty
-- main = launchAff_ $ runSpec [ consoleReporter ] do
--   describe "Tests" do
--     it "Does nothing" $ do
--       rf /\ push /\ unsub <- liftEffect do
--         rf <- new []
--         { event, push } <- create
--         unsub <- subscribe (counter event) \x -> do
--           void $ modify (\i -> i <> [ x ]) rf
--         pure (rf /\ push /\ unsub)
--       liftEffect $ push true
--       -- why is this?
--       liftEffect (read rf) >>= shouldEqual [ true /\ 1 ]
--       liftEffect unsub
