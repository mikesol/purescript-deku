module Performance.Test.Todo.Deku where

import Prelude

import Control.Alt ((<|>))
import Data.Array (cons, drop, head, length, reverse, takeEnd)
import Data.Filterable (filter)
import Data.Foldable (for_, oneOf, oneOfMap, traverse_)
import Data.Maybe (Maybe(..))
import Data.Set as Set
import Data.Tuple (snd)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Control (dyn, text_)
import Deku.Core (class Korok, Domable, bussedUncurried, insert_, remove)
import Deku.DOM as D
import Deku.Do (useMailboxed, useMemoized)
import Deku.Do as Deku
import Deku.Listeners (click)
import Deku.Toplevel (runInElement')
import Effect (Effect)
import Effect.Class (class MonadEffect)
import FRP.Event (AnEvent, fold, keepLatest, mapAccum)
import Halogen (liftEffect)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Performance.Test.Todo.Shared as Shared
import Type.Proxy (Proxy(..))
import Web.HTML.HTMLElement (toElement)

_todoDeku = Proxy :: Proxy "todoDeku"

data ContainerAction = Initialize

data UndoAction
  = UndoRename Int String
  | UndoAdd Int
  | UndoCompleted Int Boolean

data UndoStack = PushUndo UndoAction | PopUndo

container :: forall q i o m. MonadEffect m => H.Component q i o m
container =
  H.mkComponent
    { initialState: \_ -> { unsub: pure unit }
    , render
    , eval: H.mkEval $ H.defaultEval
        { initialize = Just Initialize, handleAction = handleAction }
    }
  where
  render _ =
    HH.div [ HP.ref (H.RefLabel "container") ] []

  handleAction Initialize = do
    H.getHTMLElementRef (H.RefLabel "container") >>= traverse_ \el → do
      unsub <- H.liftEffect do
        filled <- Shared.fillContainerState Shared.initialContainerState
        runInElement' (toElement el) (containerD filled)
      H.modify_ _ { unsub = unsub }
      pure unit

containerD
  :: forall s m lock payload
   . Korok s m
  => Shared.ContainerState
  -> Domable m lock payload
containerD initialState = Deku.do
  setCompleteStatus /\ completeStatus <- useMailboxed
  setRename /\ rename <- useMailboxed
  setDelete /\ delete <- useMailboxed
  setState /\ state <- useMemoized \state' -> do
    let istate = initialState
    (fold ($) state' istate) <|> pure istate
  setUndo /\ undos <- useMemoized \undo' -> do
    let initialUndos = map (_.id >>> UndoAdd) (reverse initialState.todos)
    ( pure initialUndos <|> map snd
        ( fold
            ( case _ of
                PushUndo u -> \(x /\ y) -> (x + 1) /\
                  if x == 0 then [ u ] else cons u y
                PopUndo -> \(_ /\ y) -> 0 /\ drop 1 y
            )
            undo'
            (1 /\ initialUndos)
        )
    )
  let
    toDyn = keepLatest
      ( map
          (\s -> oneOfMap pure (takeEnd s.nAdded s.state.todos))
          ( mapAccum
              ( \s i -> do
                  let l = length s.todos
                  l /\ { state: s, nAdded: max 0 (l - i) }
              )
              state
              0
          )
      )
    updateNameAt id n = setState
      ( \x -> x
          { todos = map
              (\y -> if y.id == id then y { description = n } else y)
              x.todos
          }
      )
  D.div_
    [ D.button
        ( oneOf
            [ pure $ D.Id := Shared.addNewId
            , click $ state <#> \st -> do
                newState <- liftEffect $ Shared.createTodo st
                setUndo (PushUndo (UndoAdd newState.lastIndex))
                setState
                  ( const newState
                  )
            ]
        )
        [ text_ "Add New" ]
    , D.button
        ( oneOf
            [ pure $ D.Id := Shared.undoId
            , click $ undos <#> \uu ->
                for_ (head uu) \u -> do
                  case u of
                    UndoRename id s -> do
                      updateNameAt id s
                      setRename { address: id, payload: s }
                      pure unit
                    UndoAdd id -> do
                      setState
                        ( \x -> x
                            { todos = filter
                                ( \y -> y.id /= id
                                )
                                x.todos
                            }
                        )
                      setDelete { address: id, payload: unit }
                    UndoCompleted id cs -> do
                      setState
                        ( \x -> x
                            { completed =
                                (if cs then Set.insert else Set.delete) id
                                  x.completed
                            }
                        )
                      setCompleteStatus { address: id, payload: cs }
                  setUndo PopUndo
            ]
        )
        [ text_ "Undo" ]
    , dyn D.div (oneOf [ pure $ D.Id := Shared.todosId ])
        ( toDyn # map
            \td -> do
              let
                addCheckedToUndoStack cs = setUndo
                  (PushUndo (UndoCompleted td.id cs))
                addOldNameToUndoStack n = setUndo
                  (PushUndo (UndoRename td.id n))
                renameAction n = do
                  updateNameAt td.id n
                  addOldNameToUndoStack n
                checkedAction cs = do
                  setState
                    ( \x -> x
                        { completed = (if cs then Set.insert else Set.delete)
                            td.id
                            x.completed
                        }
                    )
                  addCheckedToUndoStack (not cs)
              pure
                ( insert_ $ todoD td (completeStatus td.id) (rename td.id)
                    renameAction
                    checkedAction
                ) <|> (delete td.id $> remove)
        )
    ]

todoD
  :: forall s m lock payload
   . Korok s m
  => { id :: Int, description :: String }
  -> AnEvent m Boolean
  -> AnEvent m String
  -> (String -> Effect Unit)
  -> (Boolean -> Effect Unit)
  -> Domable m lock payload
todoD { id, description } completeStatus newName doEditName doChecked = Deku.do
  setName /\ name' <- bussedUncurried
  let name = name' <|> pure description
  D.div_
    [ D.input
        ( oneOf
            [ pure $ D.Id := Shared.editId id
            , (pure description <|> newName) <#> (D.Value := _)
            , name <#> setName >>> (D.OnInput := _)
            ]
        )
        []
    , checkboxD { id } completeStatus doChecked
    , D.button
        (oneOf [ pure $ D.Id := Shared.saveId id, click (name <#> doEditName) ])
        [ text_ "Save Changes" ]
    ]

checkboxD
  :: forall s m lock payload
   . Korok s m
  => { id :: Int }
  -> AnEvent m Boolean
  -> (Boolean -> Effect Unit)
  -> Domable m lock payload
checkboxD { id } completeStatus doChecked = Deku.do
  localSetChecked /\ localChecked <- bussedUncurried
  let checked = pure true <|> completeStatus
  D.input
    ( oneOf
        [ pure $ D.Id := (Shared.checkId id)
        , pure $ D.Xtype := "checkbox"
        , completeStatus <#> show >>> (D.Checked := _)
        , (checked <|> localChecked) <#>
            (\x -> doChecked x *> localSetChecked (not x)) >>> (D.OnInput := _)
        ]
    )
    []
