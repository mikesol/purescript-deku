module Performance.Test.Todo.Deku where

import Prelude

import Data.Array (length)
import Data.Either (Either(..))
import Data.Foldable (traverse_)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Map (Map, fromFoldable, singleton)
import Data.Maybe (Maybe(..))
import Data.Set as Set
import Data.Tuple.Nested ((/\))
import Deku.Change (ichange_)
import Deku.Control.Functions.Graph as G
import Deku.Control.Functions.Subgraph (freeze, iloop, (@!>))
import Deku.Create (icreate)
import Deku.Graph.Attribute (Cb(..))
import Deku.Graph.DOM (xsubgraph, (:=))
import Deku.Graph.DOM as DOM
import Deku.Interpret (makeFFIDOMSnapshot)
import Deku.Run (TriggeredRun, defaultOptions, run)
import Effect.Class (class MonadEffect)
import FRP.Event (subscribe)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Performance.Test.Todo.Shared (CheckboxInput, TodoInput)
import Performance.Test.Todo.Shared as Shared
import Type.Proxy (Proxy(..))
import Web.HTML.HTMLElement (toElement)

_todoDeku = Proxy :: Proxy "todoDeku"

data ContainerAction
  = Initialize

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
        ffi <- makeFFIDOMSnapshot
        filled <- Shared.fillContainerState Shared.initialContainerState
        subscribe
          ( run (pure unit) (pure unit) defaultOptions ffi
              ( G.istart
                  ( \_ _ ->
                      icreate
                        ( DOM.root (toElement el)
                            { sg: (containerD filled)
                            }
                        )
                  )
                  G.freeze
              )
          )
          (\(_ :: TriggeredRun Unit) -> pure unit)
      H.modify_ _ { unsub = unsub }
      pure unit

containerD
  :: Shared.ContainerState
  -> DOM.Element (DOM.Subgraph Int "ctr" Unit Shared.Todo) ()
containerD cstate = DOM.subgraph (singleton 0 (Just unit)) $ DOM.AsSubgraph
  \_ ->
    ( \_ push ->
        let
          ln = length cstate.todos
        in
          icreate
            { ctr: DOM.div []
                { btn: DOM.button
                    [ DOM.Id := Shared.addNewId
                    , DOM.OnClick := Cb
                        (const $ Shared.mkTodo ln >>= push)
                    ]
                    { txt: DOM.text "Add New" }
                , dv: DOM.div
                    [ DOM.Id := Shared.todosId ]
                    { sg: todoD $ fromFoldable
                        ( cstate.todos # mapWithIndex \ix t ->
                            ix /\ Just
                              { todo: t, completed: cstate.completed }
                        )
                    }
                }
            } $> ln
    ) @!> iloop \e push ln -> case e of
      Left _ -> pure ln
      Right td -> ln + 1 <$ ichange_
        { "ctr.dv.sg": xsubgraph
            ( singleton ln $ Just
                { todo: td, completed: cstate.completed }
            )

        , "ctr.btn": DOM.button'attr
            [ DOM.OnClick := Cb (const $ Shared.mkTodo (ln + 1) >>= push)
            ]
        }

todoD
  :: Map Int (Maybe TodoInput)
  -> DOM.Element (DOM.Subgraph Int "top" TodoInput Unit) ()
todoD mp = DOM.subgraph mp $ DOM.AsSubgraph \i ->
  ( \itl _ ->
      icreate
        { top: DOM.div []
            { ipt: DOM.input
                [ DOM.Id := Shared.editId itl.todo.id
                , DOM.Value := itl.todo.description
                ]
                {}
            , chk: checkboxD $ singleton i $ Just
                { id: itl.todo.id, completed: itl.completed }
            , btn: DOM.button
                [ DOM.Id := (Shared.saveId itl.todo.id)
                ]
                { txt: DOM.text "Save Changes" }
            }
        }
  ) @!> freeze

data CheckboxAction = ReceiveCheckboxInput CheckboxInput | HandleCheck Boolean

checkboxD
  :: Map Int (Maybe CheckboxInput)
  -> DOM.Element (DOM.Subgraph Int "input" CheckboxInput Unit) ()
checkboxD envs = DOM.subgraph envs $ DOM.AsSubgraph \i ->
  ( \itl _ -> icreate
      { input: DOM.input
          [ DOM.Xtype := "checkbox"
          , DOM.Id := Shared.checkId i
          , DOM.Checked := (show $ Set.member itl.id itl.completed)
          ]
          {}
      }
  ) @!> freeze
