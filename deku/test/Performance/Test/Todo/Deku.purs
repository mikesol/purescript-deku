module Performance.Test.Todo.Deku where

import Prelude

import Control.Alt ((<|>))
import Data.Array (cons, drop, head, length, reverse, takeEnd)
import Data.Filterable (filter)
import Data.Foldable (for_, oneOfMap, traverse_)
import Data.Maybe (Maybe(..))
import Data.Set as Set
import Data.Tuple (snd)
import Data.Tuple.Nested ((/\))
import Deku.Control (text_)
import Deku.Core (Nut, dyn, bussedUncurried, insert_, remove)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (useMailboxed, useMemoized, useMemoized', useState')
import Deku.Toplevel (runInElement')
import Effect (Effect)
import Effect.Class (class MonadEffect)
import FRP.Event (Event, fold, keepLatest, mapAccum)
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
  :: Shared.ContainerState
  -> Nut
containerD initialState = Deku.do
  setCompleteStatus /\ completeStatus <- useMailboxed
  setRename /\ rename <- useMailboxed
  setDelete /\ delete <- useMailboxed
  setState /\ state' <- useState'
  state <- useMemoized do
    let istate = initialState
    (fold (#) istate state') <|> pure istate
  setUndo /\ undos <- useMemoized' \undo' -> do
    let initialUndos = map (_.id >>> UndoAdd) (reverse initialState.todos)
    ( pure initialUndos <|> map snd
        ( fold
            ( \(x /\ y) -> case _ of
                PushUndo u -> (x + 1) /\
                  if x == 0 then [ u ] else cons u y
                PopUndo -> 0 /\ drop 1 y
            )
            (1 /\ initialUndos)
            undo'
        )
    )
  let
    toDyn = keepLatest
      ( map
          (\s -> oneOfMap pure (takeEnd s.nAdded s.state.todos))
          ( mapAccum
              ( \i s -> do
                  let l = length s.todos
                  l /\ { state: s, nAdded: max 0 (l - i) }
              )
              0
              state
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
        [ DA.id_ Shared.addNewId
        , DL.runOn DL.click $ state <#> \st -> do
            newState <- liftEffect $ Shared.createTodo st
            setUndo (PushUndo (UndoAdd newState.lastIndex))
            setState
              ( const newState
              )
        ]
        [ text_ "Add New" ]
    , D.button
        [ DA.id_ Shared.undoId
        , DL.runOn DL.click $ undos <#> \uu ->
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
        [ text_ "Undo" ]
    , D.div [ DA.id_ Shared.todosId ]
        [ dyn
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
                            { completed =
                                (if cs then Set.insert else Set.delete)
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
    ]

todoD
  :: { id :: Int, description :: String }
  -> Event Boolean
  -> Event String
  -> (String -> Effect Unit)
  -> (Boolean -> Effect Unit)
  -> Nut
todoD { id, description } completeStatus newName doEditName doChecked = Deku.do
  setName /\ name' <- bussedUncurried
  let name = name' <|> pure description
  D.div_
    [ D.input
        [ DA.id_ $ Shared.editId id
        , DA.value $ pure description <|> newName
        , DL.runOn DL.input $ name <#> setName        ]
        []

    , checkboxD { id } completeStatus doChecked
    , D.button
        [ DA.id_ $ Shared.saveId id
        , DL.runOn DL.click (name <#> doEditName)
        ]
        [ text_ "Save Changes" ]
    ]

checkboxD
  :: { id :: Int }
  -> Event Boolean
  -> (Boolean -> Effect Unit)
  -> Nut
checkboxD { id } completeStatus doChecked = Deku.do
  localSetChecked /\ localChecked <- bussedUncurried
  let checked = pure true <|> completeStatus
  D.input
    [ DA.id_ (Shared.checkId id)
    , DA.xtype_ "checkbox"
    , DA.checked $ completeStatus <#> show
    , DL.input $ (checked <|> localChecked) <#> (\x _ -> doChecked x *> localSetChecked (not x))
    ]
    []
