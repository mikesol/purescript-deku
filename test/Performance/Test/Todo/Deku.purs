module Performance.Test.Todo.Deku where

import Prelude

import Control.Monad.Indexed ((:*>))
import Data.Array (length)
import Data.Either (Either(..))
import Data.Foldable (traverse_)
import Data.FunctorWithIndex (mapWithIndex)
import Web.HTML.HTMLElement (toElement)
import Data.Map (fromFoldable, singleton)
import Data.Maybe (Maybe(..))
import Data.Set as Set
import Data.Tuple.Nested ((/\))
import Deku.Change (ichange_)
import Deku.Control.Functions.Graph as G
import Deku.Control.Functions.Subgraph (freeze, iloop, (@!>))
import Deku.Create (icreate)
import Deku.Graph.Attribute (Cb(..))
import Deku.Graph.DOM (XSubgraph(..), (:=))
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
                        ) :*> ichange_
                        { "root.sg": XSubgraph
                            { envs: singleton 0 (Just unit)
                            }
                        }
                  )
                  G.freeze
              )
          )
          (\(_ :: TriggeredRun Unit) -> pure unit)
      H.modify_ _ { unsub = unsub }
      pure unit

containerD
  :: Shared.ContainerState
  -> DOM.Element (DOM.Subgraph (DOM.AsSubgraph "ctr" Unit Shared.Todo)) ()
containerD cstate = DOM.subgraph $ DOM.AsSubgraph \_ ->
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
                  { sg: todoD }
              }
          } :*> ichange_
          { "ctr.dv.sg": XSubgraph
              { envs: fromFoldable
                  ( cstate.todos # mapWithIndex \ix t -> ix /\ Just
                      { todo: t, completed: cstate.completed }
                  )
              }
          } $> ln
  ) @!> iloop \e push ln -> case e of
    Left _ -> pure ln
    Right td -> ln + 1 <$ ichange_
      { "ctr.dv.sg": XSubgraph
          { envs: singleton ln $ Just { todo: td, completed: cstate.completed }
          }
      , "ctr.btn": DOM.button'attr
          [ DOM.OnClick := Cb (const $ Shared.mkTodo (ln + 1) >>= push)
          ]
      }

todoD :: DOM.Element (DOM.Subgraph (DOM.AsSubgraph "top" TodoInput Unit)) ()
todoD = DOM.subgraph $ DOM.AsSubgraph \i ->
  ( \itl _ ->
      icreate
        { top: DOM.div []
            { ipt: DOM.input
                [ DOM.Id := Shared.editId itl.todo.id
                , DOM.Value := itl.todo.description
                ]
                {}
            , chk: checkboxD
            , btn: DOM.button
                [ DOM.Id := (Shared.saveId itl.todo.id)
                ]
                { txt: DOM.text "Save Changes" }
            }
        } :*> ichange_
        { "top.chk": XSubgraph
            { envs: singleton i $ Just
                { id: itl.todo.id, completed: itl.completed }

            }
        }
  ) @!> freeze

data CheckboxAction = ReceiveCheckboxInput CheckboxInput | HandleCheck Boolean

checkboxD
  :: DOM.Element (DOM.Subgraph (DOM.AsSubgraph "input" CheckboxInput Unit)) ()
checkboxD = DOM.subgraph $ DOM.AsSubgraph \i ->
  ( \itl _ -> icreate
      { input: DOM.input
          [ DOM.Xtype := "checkbox"
          , DOM.Id := Shared.checkId i
          , DOM.Checked := (show $ Set.member itl.id itl.completed)
          ]
          {}
      }
  ) @!> freeze
