module Performance.Test.Todo.Shared where

import Prelude

import Data.Array as Array
import Data.Maybe (Maybe)
import Data.Set (Set)
import Data.Set as Set
import Effect (Effect)
import Effect.Random (randomInt)
import Halogen as H
import Partial.Unsafe (unsafePartial)
import Type.Proxy (Proxy(..))

data Query a = Run (Unit -> a)

data TodoOutput = Save Todo | SetCompleted Int Boolean

_todo = Proxy :: Proxy "todo"

data CheckboxOutput = Check Boolean

_checkbox = Proxy :: Proxy "checkbox"

type Slot = H.Slot Query Void

type ContainerState =
  { todos :: Array Todo
  , lastIndex :: Int
  , completed :: Set Int
  }

initialContainerState :: ContainerState
initialContainerState =
  { todos: []
  , lastIndex: 0
  , completed: Set.empty
  }

fillContainerState :: ContainerState -> Effect ContainerState
fillContainerState state = do
  let lastIndex' = state.lastIndex + 100
  todos <- go state.lastIndex lastIndex' state.todos
  pure $ state { todos = todos, lastIndex = lastIndex' }
  where
  go :: Int -> Int -> Array Todo -> Effect (Array Todo)
  go n limit arr
    | n == limit = pure arr
    | otherwise = do
        todo <- mkTodo n
        go (n + 1) limit (Array.snoc arr todo)

createTodo :: ContainerState -> Effect ContainerState
createTodo state = do
  todo <- mkTodo (state.lastIndex + 1)
  pure $ state { todos = Array.snoc state.todos todo, lastIndex = todo.id }

type TodoInput =
  { todo :: Todo
  , completed :: Set Int
  }

type Todo =
  { description :: String
  , id :: Int
  }

mkTodo :: Int -> Effect Todo
mkTodo id = do
  ix <- randomInt 0 9
  let description = unsafePartial (Array.unsafeIndex descriptions ix)
  pure { description, id }

updateTodo :: Todo -> Array Todo -> Maybe (Array Todo)
updateTodo todo todos = do
  ix <- Array.findIndex (_.id >>> eq todo.id) todos
  Array.updateAt ix todo todos

descriptions :: Array String
descriptions =
  [ "eat"
  , "drink"
  , "sleep"
  , "party"
  , "walk"
  , "run"
  , "hike"
  , "play the drums"
  , "cook"
  , "chill"
  ]

addNewId :: String
addNewId = "add-new"

undoId :: String
undoId = "undo"

todosId :: String
todosId = "todos"

editId :: Int -> String
editId id = "edit-" <> show id

saveId :: Int -> String
saveId id = "save-" <> show id

checkId :: Int -> String
checkId id = "check-" <> show id

type CheckboxInput =
  { id :: Int
  , completed :: Set Int
  }
