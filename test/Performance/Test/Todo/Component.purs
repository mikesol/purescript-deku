module Performance.Test.Todo.Component where

import Prelude

import Data.Foldable (for_)
import Data.Maybe (Maybe(..))
import Data.Set as Set
import Effect.Aff.Class (class MonadAff)
import Halogen (liftEffect)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Performance.Test.Todo.Shared (CheckboxInput, CheckboxOutput(..), TodoInput, TodoOutput(..))
import Performance.Test.Todo.Shared as Shared
import Type.Proxy (Proxy(..))

_todoComponent = Proxy :: Proxy "todoComponent"

data ContainerAction
  = Initialize
  | HandleTodo TodoOutput
  | AddNew

container :: forall q i o m. MonadAff m => H.Component q i o m
container =
  H.mkComponent
    { initialState: \_ -> Shared.initialContainerState
    , render
    , eval: H.mkEval $ H.defaultEval { handleAction = handleAction, initialize = Just Initialize }
    }
  where
  handleAction = case _ of
    Initialize -> do
      state <- H.get
      filled <- liftEffect $ Shared.fillContainerState state
      H.put filled

    HandleTodo msg -> case msg of
      Save t -> do
        state <- H.get
        for_ (Shared.updateTodo t state.todos) \todos ->
          H.modify_ _ { todos = todos }

      SetCompleted id complete -> do
        if complete then
          H.modify_ \state -> state { completed = Set.insert id state.completed }
        else
          H.modify_ \state -> state { completed = Set.delete id state.completed }

    AddNew -> do
      state <- H.get
      newState <- liftEffect $ Shared.createTodo state
      H.put newState

  render state = do
    let
      todos = state.todos <#> \t ->
        HH.slot Shared._todo t.id todo { todo: t, completed: state.completed } HandleTodo

    HH.div_
      [ HH.button
          [ HP.id Shared.addNewId
          , HE.onClick \_ -> AddNew
          ]
          [ HH.text "Add New" ]
      , HH.div
          [ HP.id Shared.todosId ]
          todos
      ]

data TodoAction
  = ReceiveTodoInput TodoInput
  | UpdateDescription String
  | SaveUpdate
  | HandleCheckbox CheckboxOutput

todo :: forall q m. MonadAff m => H.Component q TodoInput TodoOutput m
todo = H.mkComponent
  { initialState: identity
  , render
  , eval: H.mkEval $ H.defaultEval { handleAction = handleAction, receive = Just <<< ReceiveTodoInput }
  }
  where
  handleAction = case _ of
    ReceiveTodoInput input -> do
      state <- H.get
      unless (state.todo.id == input.todo.id && state.completed == input.completed) do
        H.modify_ \st -> st { todo { id = input.todo.id }, completed = input.completed }

    UpdateDescription str -> do
      H.modify_ \state -> state { todo { description = str } }

    SaveUpdate -> do
      state <- H.get
      H.raise $ Save { id: state.todo.id, description: state.todo.description }

    HandleCheckbox (Check checked) -> do
      state <- H.get
      H.raise $ SetCompleted state.todo.id checked

  render state =
    HH.div_
      [ HH.input
          [ HP.id (Shared.editId state.todo.id)
          , HE.onValueInput UpdateDescription
          , HP.value state.todo.description
          ]
      , HH.slot Shared._checkbox unit checkbox { id: state.todo.id, completed: state.completed } HandleCheckbox
      , HH.button
          [ HP.id (Shared.saveId state.todo.id)
          , HE.onClick \_ -> SaveUpdate
          ]
          [ HH.text "Save Changes" ]
      ]

data CheckboxAction = ReceiveCheckboxInput CheckboxInput | HandleCheck Boolean

checkbox :: forall q m. MonadAff m => H.Component q CheckboxInput CheckboxOutput m
checkbox = H.mkComponent
  { initialState: identity
  , render
  , eval: H.mkEval $ H.defaultEval { handleAction = handleAction }
  }
  where
  handleAction = case _ of
    ReceiveCheckboxInput input ->
      H.put input

    HandleCheck checked ->
      H.raise $ Check checked

  render state =
    HH.input
      [ HP.id (Shared.checkId state.id)
      , HP.checked $ Set.member state.id state.completed
      , HP.type_ HP.InputCheckbox
      , HE.onChecked HandleCheck
      ]
