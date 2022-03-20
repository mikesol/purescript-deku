module Performance.Test.Todo.Hook where

import Prelude

import Data.Foldable (for_)
import Data.Function (on)
import Data.Maybe (Maybe(..))
import Data.Set as Set
import Data.Tuple.Nested ((/\))
import Effect.Aff.Class (class MonadAff)
import Halogen (liftEffect)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import Performance.Test.Todo.Shared (CheckboxInput, CheckboxOutput(..), TodoInput, TodoOutput(..))
import Performance.Test.Todo.Shared as Shared
import Type.Proxy (Proxy(..))

_todoHook = Proxy :: Proxy "todoHook"

container :: forall q i o m. MonadAff m => H.Component q i o m
container = Hooks.component \_ _ -> Hooks.do
  state /\ stateId <- Hooks.useState Shared.initialContainerState

  let
    handleTodo = case _ of
      Save t -> do
        for_ (Shared.updateTodo t state.todos) \todos ->
          Hooks.modify_ stateId _ { todos = todos }

      SetCompleted id complete -> do
        if complete then
          Hooks.modify_ stateId _ { completed = Set.insert id state.completed }
        else
          Hooks.modify_ stateId _ { completed = Set.delete id state.completed }

  Hooks.useLifecycleEffect do
    filled <- liftEffect $ Shared.fillContainerState state
    Hooks.put stateId filled
    pure Nothing

  Hooks.pure do
    let
      todos = state.todos <#> \t ->
        HH.slot Shared._todo t.id todo { todo: t, completed: state.completed } handleTodo

    HH.div_
      [ HH.button
          [ HP.id Shared.addNewId
          , HE.onClick \_ -> do
              newState <- liftEffect $ Shared.createTodo state
              Hooks.put stateId newState
          ]
          [ HH.text "Add New" ]
      , HH.div
          [ HP.id Shared.todosId ]
          todos
      ]

todo :: forall q m. MonadAff m => H.Component q TodoInput TodoOutput m
todo = Hooks.memoComponent (eq `on` _.todo.id && eq `on` _.completed) \{ outputToken } input -> Hooks.do
  description /\ descriptionId <- Hooks.useState input.todo.description

  let
    handleCheckbox (Check bool) = do
      Hooks.raise outputToken $ SetCompleted input.todo.id bool

  Hooks.pure do
    HH.div_
      [ HH.input
          [ HP.id (Shared.editId input.todo.id)
          , HE.onValueInput (Hooks.put descriptionId)
          , HP.value description
          ]
      , HH.slot Shared._checkbox unit checkbox { id: input.todo.id, completed: input.completed } handleCheckbox
      , HH.button
          [ HP.id (Shared.saveId input.todo.id)
          , HE.onClick \_ -> do
              Hooks.raise outputToken $ Save { id: input.todo.id, description }
          ]
          [ HH.text "Save Changes" ]
      ]

checkbox :: forall q m. MonadAff m => H.Component q CheckboxInput CheckboxOutput m
checkbox = Hooks.component \{ outputToken } input -> Hooks.do
  Hooks.pure do
    HH.input
      [ HP.id (Shared.checkId input.id)
      , HP.checked $ Set.member input.id input.completed
      , HP.type_ HP.InputCheckbox
      , HE.onChecked \checked -> do
          Hooks.raise outputToken $ Check checked
      ]
