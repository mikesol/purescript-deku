module Performance.Test.State.Hook where

import Prelude

import Data.Array (replicate)
import Data.Foldable (sequence_)
import Data.Tuple.Nested ((/\))
import Effect.Aff.Class (class MonadAff)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import Performance.Test.State.Shared (Output(..), stateUpdates)
import Performance.Test.Types (Test(..), startSuffix, testToString)
import Type.Proxy (Proxy(..))

_stateHook = Proxy :: Proxy "stateHook"

component :: forall q i m. MonadAff m => H.Component q i Output m
component = Hooks.memoComponent (\_ _ -> false) \{ outputToken } _ -> Hooks.do
  n /\ nId <- Hooks.useState { n: 0, n1: 0, n2: 0, n3: 0, n4: 0 }

  let
    runState = do
      sequence_ $ replicate stateUpdates $ Hooks.modify_ nId \s -> s { n = s.n + 1 }
      sequence_ $ replicate stateUpdates $ Hooks.modify_ nId \s -> s { n1 = s.n1 + 1 }
      sequence_ $ replicate stateUpdates $ Hooks.modify_ nId \s -> s { n2 = s.n2 + 1 }
      sequence_ $ replicate stateUpdates $ Hooks.modify_ nId \s -> s { n3 = s.n3 + 1 }
      sequence_ $ replicate stateUpdates $ Hooks.modify_ nId \s -> s { n4 = s.n4 + 1 }
      Hooks.raise outputToken Done

  Hooks.pure do
    HH.div_
      [ HH.button
          [ HP.id (testToString StateHook <> startSuffix)
          , HE.onClick \_ -> runState
          ]
          [ HH.text "Start Test" ]
      , HH.text $ show n
      ]
