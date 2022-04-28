module Main where

import Prelude

import Data.DateTime.Instant (Instant, instant, unInstant)
import Data.Int (toNumber)
import Data.Maybe (Maybe, fromMaybe, maybe)
import Data.Newtype (wrap)
import Data.Time.Duration (Milliseconds(..))
import Deku.Control (plant, text, text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (Event, bus, fix, fold, gateBy, memoize)
import FRP.Event.Time (interval, withTime)

-- | Provided an input event and transformation, block the input event for the
-- | duration of the specified period on each output.
debounce
  :: forall a b
   . (Event a -> Event { period :: Milliseconds, value :: b })
  -> Event a
  -> Event b
debounce process event = fix \allowed ->
  let
    processed :: Event { period :: Milliseconds, value :: b }
    processed = process allowed

    expiries :: Event Instant
    expiries =
      map
        (\{ time, value } -> fromMaybe time (instant (unInstant time <> value)))
        (withTime (map _.period processed))

    comparison :: forall r. Maybe Instant -> { time :: Instant | r } -> Boolean
    comparison a b = maybe true (_ < b.time) a

    unblocked :: Event { time :: Instant, value :: a }
    unblocked = gateBy comparison expiries stamped
  in
    { input: map _.value unblocked
    , output: map _.value processed
    }
  where
  stamped :: Event { time :: Instant, value :: a }
  stamped = withTime event

example counter = do
  let
    myCounter = debounce
      (map (\x -> { period: wrap (toNumber x), value: unit }))
      (fold (const (add 300)) counter 0)
  D.div_
    [ D.div_ (text_ "I get slowwwwwerrr")
    , text (show <$> fold (const (add 1)) myCounter 0)
    ]

main :: Effect Unit
main = runInBody1
  ( memoize
      (interval 100)
      (plant <<< example)

  )