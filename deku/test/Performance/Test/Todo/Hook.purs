module Performance.Test.Todo.Hook where

import Prelude

import Data.Array (cons, drop, head, zip)
import Data.Filterable (filter)
import Data.Foldable (for_)
import Data.Function (on)
import Data.Maybe (Maybe(..), maybe)
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

data UndoAction
  = UndoRename Int String
  | UndoAdd Int
  | UndoCompleted Int Boolean

container :: forall q i o m. MonadAff m => H.Component q i o m
container = Hooks.component \_ _ -> Hooks.do
  state /\ stateId <- Hooks.useState Shared.initialContainerState
  undos /\ undosId <- Hooks.useState []
  clearUndo /\ clearUndoId <- Hooks.useState false

  let
    handleTodo i = do
      when clearUndo $ Hooks.put undosId []
      case i of
        Save t -> do
          for_ (Shared.updateTodo t state.todos) \todos -> do
            for_ (zip state.todos todos) \(a /\ b) -> do
              when (a.description /= b.description) do
                Hooks.modify_ undosId (cons (UndoRename a.id a.description))

            Hooks.modify_ stateId _ { todos = todos }

        SetCompleted id complete -> do
          if complete then
            Hooks.modify_ stateId _
              { completed = Set.insert id state.completed }
          else
            Hooks.modify_ stateId _
              { completed = Set.delete id state.completed }
          Hooks.modify_ undosId (cons (UndoCompleted id (not complete)))

  Hooks.useLifecycleEffect do
    filled <- liftEffect $ Shared.fillContainerState state
    Hooks.put stateId filled
    pure Nothing

  Hooks.pure do
    let
      todos = state.todos <#> \t ->
        HH.slot Shared._todo t.id todo { todo: t, completed: state.completed }
          handleTodo

    HH.div_
      [ HH.button
          [ HP.id Shared.addNewId
          , HE.onClick \_ -> do
              newState <- liftEffect $ Shared.createTodo state
              Hooks.put stateId newState
          ]
          [ HH.text "Add New" ]
      , HH.button
          [ HP.id Shared.undoId
          , HE.onClick \_ -> do
              Hooks.put clearUndoId true
              Hooks.modify_ undosId (drop 1)
              case head undos of
                Just (UndoRename i t) -> Hooks.modify_ stateId
                  ( \s -> s
                      { todos = map
                          (\x -> if x.id == i then x { description = t } else x)
                          s.todos
                      }

                  )
                Just (UndoAdd i) -> Hooks.modify_ stateId
                  (\s -> s { todos = filter (\x -> x.id /= i) s.todos })
                Just (UndoCompleted i c) -> Hooks.modify_ stateId
                  ( \s -> s
                      { completed = (if c then Set.insert else Set.delete) i
                          s.completed
                      }
                  )
                Nothing -> pure unit
          ]
          [ HH.text "Undo" ]
      , HH.div
          [ HP.id Shared.todosId ]
          todos
      ]

todo :: forall q m. MonadAff m => H.Component q TodoInput TodoOutput m
todo = Hooks.memoComponent
  (eq `on` _.todo.id && eq `on` _.completed && eq `on` _.todo.description)
  \{ outputToken } input -> Hooks.do
    dirty /\ dirtyId <- Hooks.useState false
    description' /\ descriptionId <- Hooks.useState Nothing

    let
      description = maybe input.todo.description
        (if dirty then _ else input.todo.description)
        description'
      handleCheckbox (Check bool) = do
        Hooks.raise outputToken $ SetCompleted input.todo.id bool

    Hooks.pure do
      HH.div_
        [ HH.input
            [ HP.id (Shared.editId input.todo.id)
            , HE.onValueInput \i -> do
                Hooks.put descriptionId (Just i)
                Hooks.put dirtyId true
            , HP.value description
            ]
        , HH.slot Shared._checkbox unit checkbox
            { id: input.todo.id, completed: input.completed }
            handleCheckbox
        , HH.button
            [ HP.id (Shared.saveId input.todo.id)
            , HE.onClick \_ -> do
                Hooks.put dirtyId false
                Hooks.raise outputToken $ Save
                  { id: input.todo.id, description }
            ]
            [ HH.text "Save Changes" ]
        ]

checkbox
  :: forall q m. MonadAff m => H.Component q CheckboxInput CheckboxOutput m
checkbox = Hooks.component \{ outputToken } input -> Hooks.do
  Hooks.pure do
    HH.input
      [ HP.id (Shared.checkId input.id)
      , HP.checked $ Set.member input.id input.completed
      , HP.type_ HP.InputCheckbox
      , HE.onChecked \checked -> do
          Hooks.raise outputToken $ Check checked
      ]
