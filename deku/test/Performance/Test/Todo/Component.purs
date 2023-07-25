module Performance.Test.Todo.Component where

import Prelude

import Data.Array (cons, drop, filter, head, zip)
import Data.Foldable (for_)
import Data.Maybe (Maybe(..))
import Data.Set as Set
import Data.Tuple.Nested ((/\))
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
  | HandleUndo
  | AddNew

data UndoAction
  = UndoRename Int String
  | UndoAdd Int
  | UndoCompleted Int Boolean

container :: forall q i o m. MonadAff m => H.Component q i o m
container =
  H.mkComponent
    { initialState: \_ ->
        { state: Shared.initialContainerState
        , undos: []
        , clearUndo: false
        }
    , render
    , eval: H.mkEval $ H.defaultEval
        { handleAction = handleAction, initialize = Just Initialize }
    }
  where
  handleAction = case _ of
    Initialize -> do
      state <- H.gets _.state
      filled <- liftEffect $ Shared.fillContainerState state
      H.modify_ (_ { state = filled })

    HandleUndo -> do
      undos <- H.gets _.undos
      H.modify_ (_ { clearUndo = true, undos = drop 1 undos })
      case head undos of
        Just (UndoRename i t) -> H.modify_
          ( \s -> s
              { state
                  { todos = map
                      (\x -> if x.id == i then x { description = t } else x)
                      s.state.todos
                  }
              }
          )
        Just (UndoAdd i) -> H.modify_
          (\s -> s { state { todos = filter (\x -> x.id /= i) s.state.todos } })
        Just (UndoCompleted i c) -> H.modify_
          ( \s -> s
              { state
                  { completed = (if c then Set.insert else Set.delete) i
                      s.state.completed
                  }
              }
          )
        Nothing -> pure unit

    HandleTodo msg -> do
      clearUndo <- H.gets _.clearUndo
      when clearUndo $ H.modify_ (_ { undos = [] })
      H.modify_ (_ { clearUndo = false })
      case msg of
        Save t -> do
          state <- H.gets _.state
          for_ (Shared.updateTodo t state.todos) \todos -> do
            -- zip and update
            for_ (zip state.todos todos) \(a /\ b) -> do
              when (a.description /= b.description) do
                H.modify_
                  ( \x -> x
                      { undos = cons (UndoRename a.id a.description) x.undos }
                  )
            H.modify_ _ { state { todos = todos } }

        SetCompleted id complete -> do
          H.modify_ \s -> s
            { state
                { completed = (if complete then Set.insert else Set.delete) id
                    s.state.completed
                }
            , undos = cons (UndoCompleted id (not complete)) s.undos
            }

    AddNew -> do
      state <- H.gets _.state
      newState <- liftEffect $ Shared.createTodo state
      H.modify_ (_ { state = newState })

  render { state } = do
    let
      todos = state.todos <#> \t ->
        HH.slot Shared._todo t.id todo { todo: t, completed: state.completed }
          HandleTodo

    HH.div_
      [ HH.button
          [ HP.id Shared.addNewId
          , HE.onClick \_ -> AddNew
          ]
          [ HH.text "Add New" ]
      , HH.button
          [ HP.id Shared.undoId
          , HE.onClick \_ -> HandleUndo
          ]
          [ HH.text "Undo" ]
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
  { initialState: \x -> { todo: x.todo, completed: x.completed, dirty: false }
  , render
  , eval: H.mkEval $ H.defaultEval
      { handleAction = handleAction, receive = Just <<< ReceiveTodoInput }
  }
  where
  handleAction = case _ of
    ReceiveTodoInput input -> do
      state <- H.get
      unless
        ( state.todo.id == input.todo.id && state.completed == input.completed
            && state.todo.description == input.todo.description
        )
        do
          when
            ( state.todo.description /= input.todo.description && not
                state.dirty
            )
            do
              H.modify_ \st -> st
                { todo
                    { id = input.todo.id
                    , description = input.todo.description
                    }
                }
          H.modify_ \st -> st
            { todo
                { id = input.todo.id
                }
            , completed = input.completed
            }

    UpdateDescription str -> do
      H.modify_ _ { todo { description = str }, dirty = true }

    SaveUpdate -> do
      state <- H.get
      H.modify_ _ { dirty = false }
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
      , HH.slot Shared._checkbox unit checkbox
          { id: state.todo.id, completed: state.completed }
          HandleCheckbox
      , HH.button
          [ HP.id (Shared.saveId state.todo.id)
          , HE.onClick \_ -> SaveUpdate
          ]
          [ HH.text "Save Changes" ]
      ]

data CheckboxAction = ReceiveCheckboxInput CheckboxInput | HandleCheck Boolean

checkbox
  :: forall q m. MonadAff m => H.Component q CheckboxInput CheckboxOutput m
checkbox = H.mkComponent
  { initialState: identity
  , render
  , eval: H.mkEval $ H.defaultEval
      { handleAction = handleAction, receive = Just <<< ReceiveCheckboxInput }
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
