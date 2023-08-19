module Performance.Test.App where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Aff.Class (class MonadAff)
import Halogen as H
import Halogen.Aff.Util as HA
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Halogen.VDom.Driver (runUI)
import Performance.Test.State.Deku as State.Deku
import Performance.Test.State.Component as State.Component
import Performance.Test.State.Hook as State.Hook
import Performance.Test.Types (Test(..), completedSuffix, testToString)
import Performance.Test.Todo.Component as Todo.Component
import Performance.Test.Todo.Hook as Todo.Hook
import Performance.Test.Todo.Deku as Todo.Deku

main :: Effect Unit
main = launchAff_ do
  body <- HA.awaitBody
  void $ runUI container unit body

data TestState
  = NotStarted
  | Running Test
  | Completed Test

derive instance Eq TestState

data Action = HandleStartTest Test | HandleTestComplete Test

container :: forall q i o m. MonadAff m => H.Component q i o m
container = H.mkComponent
  { initialState: \_ -> NotStarted
  , render
  , eval: H.mkEval $ H.defaultEval { handleAction = handleAction }
  }
  where
  -- Used by Puppeteer to mount a test into the page so that it can be started
  testAction test = do
    let test' = testToString test
    HH.button [ HP.id test', HE.onClick \_ -> HandleStartTest test ]
      [ HH.text test' ]

  handleComplete test =
    const (HandleTestComplete test)

  render state = do
    HH.div_
      [ HH.div_
          [ -- Used by Puppeteer to trigger a test to be mounted into the page
            testAction StateHook
          , testAction StateComponent
          , testAction StateDeku
          , testAction TodoHook
          , testAction TodoComponent
          , testAction TodoDeku

          , case state of
              NotStarted ->
                HH.text ""

              Running StateHook ->
                HH.slot State.Hook._stateHook unit State.Hook.component unit
                  (handleComplete StateHook)

              Running StateComponent ->
                HH.slot State.Component._stateComponent unit
                  State.Component.component
                  unit
                  (handleComplete StateComponent)

              Running StateDeku ->
                HH.slot State.Deku._stateDeku unit State.Deku.component unit
                  (handleComplete StateDeku)

              Running TodoHook ->
                HH.slot Todo.Hook._todoHook unit Todo.Hook.container unit
                  (handleComplete TodoHook)

              Running TodoComponent ->
                HH.slot Todo.Component._todoComponent unit
                  Todo.Component.container
                  unit
                  (handleComplete TodoComponent)

              Running TodoDeku ->
                HH.slot Todo.Deku._todoDeku unit Todo.Deku.container unit
                  (handleComplete TodoDeku)

              Completed test ->
                HH.div [ HP.id (testToString test <> completedSuffix) ] []
          ]
      ]

  handleAction = case _ of
    HandleStartTest test ->
      H.put (Running test)

    HandleTestComplete test ->
      H.put (Completed test)
