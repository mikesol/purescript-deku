module Performance.Test.Todo.Deku where

import Prelude

import Bolson.Core (dyn, envy)
import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Array (length, takeEnd)
import Data.Foldable (oneOf, oneOfMap, traverse_)
import Data.Maybe (Maybe(..))
import Deku.Attribute ((:=))
import Deku.Control (text_)
import Deku.Core (class Korok, Domable, bussed, insert)
import Deku.DOM as D
import Deku.Listeners (click)
import Deku.Toplevel (runInElement')
import Effect.Class (class MonadEffect)
import FRP.Event (keepLatest, memoize)
import FRP.Event.Class (bang)
import Halogen (liftEffect)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Performance.Test.Todo.Shared as Shared
import Type.Proxy (Proxy(..))
import Web.HTML.HTMLElement (toElement)

_todoDeku = Proxy :: Proxy "todoDeku"

data ContainerAction = Initialize

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
containerD initialState = bussed \setState state' -> envy $ memoize
  (state' <|> bang { state: initialState, nAdded: length initialState.todos })
  \state -> do
    let
      toDyn = keepLatest
        (map (\s -> oneOfMap bang (takeEnd s.nAdded s.state.todos)) state)
    D.div_
      [ D.button
          ( oneOf
              [ bang $ D.Id := Shared.addNewId
              , click $ state <#> \st -> do
                  newState <- liftEffect $ Shared.createTodo st.state
                  setState
                    { state: newState
                    , nAdded: length newState.todos - length st.state.todos
                    }
              ]
          )
          [ text_ "Add New" ]
      , D.div (oneOf [ bang $ D.Id := Shared.todosId ])
          [ dyn $ map (bang <<< insert <<< todoD) toDyn ]
      ]

todoD
  :: forall s m lock payload
   . Korok s m
  => { id :: Int, description :: String }
  -> Domable m lock payload
todoD { id, description } =
  D.div_
    [ D.input
        ( oneOf
            [ bang $ D.Id := Shared.editId id
            , bang $ D.Value := description
            ]
        )
        []
    , checkboxD { id }
    , D.button
        (oneOf [ bang $ D.Id := Shared.saveId id ])
        [ text_ "Save Changes" ]
    ]

checkboxD
  :: forall s m lock payload
   . Korok s m
  => { id :: Int }
  -> Domable m lock payload
checkboxD { id } = D.input
  ( oneOf
      [ bang $ D.Id := (Shared.checkId id)
      , bang $ D.Xtype := "checkbox"
      ]
  )
  []
