module Performance.Test.State.Deku where

import Prelude

import Data.Array.NonEmpty (replicate)
import Data.Either (Either(..))
import Data.Foldable (sequence_, traverse_)
import Data.Maybe (Maybe(..))
import Deku.Change (ichange)
import Deku.Control.Functions.Graph (iloop, (@!>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Create (icreate)
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM ((:=))
import Deku.Graph.DOM as DOM
import Deku.Interpret (makeFFIDOMSnapshot)
import Deku.Run (RunDOM, RunEngine, TriggeredScene, defaultOptions, run)
import Effect (Effect)
import Effect.Class (class MonadEffect)
import Effect.Ref as Ref
import FRP.Event (subscribe)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.Subscription as HS
import Performance.Test.State.Shared (Output(..), stateUpdates)
import Performance.Test.Types (Test(..), startSuffix, testToString)
import Type.Proxy (Proxy(..))
import Web.DOM as WEB.DOM
import Web.HTML.HTMLElement (toElement)

stateUpdates' :: Int
stateUpdates' = stateUpdates

_stateDeku = Proxy :: Proxy "stateDeku"

data Action = MarkEnd | Initialize

component :: forall q i m. MonadEffect m => H.Component q i Output m
component =
  H.mkComponent
    { initialState: \_ -> { unsub: pure unit }
    , render
    , eval: H.mkEval $ H.defaultEval
        { initialize = Just Initialize, handleAction = handleAction }
    }
  where
  render _ =
    HH.div [ HP.ref (H.RefLabel "container") ] []

  handleAction MarkEnd = do
    { unsub } <- H.get
    H.liftEffect unsub
    H.raise Done
  handleAction Initialize = do
    H.getHTMLElementRef (H.RefLabel "container") >>= traverse_ \el → do
      { emitter, listener } <- H.liftEffect $ HS.create
      void $ H.subscribe emitter
      unsub <- H.liftEffect do
        ffi <- makeFFIDOMSnapshot
        subscribe
          ( run (pure unit) (pure unit) defaultOptions ffi
              (scene (HS.notify listener MarkEnd) (toElement el))
          )
          (\_ -> pure unit)
      H.modify_ _ { unsub = unsub }
      pure unit

type State = { n :: Int, n1 :: Int, n2 :: Int, n3 :: Int, n4 :: Int }

scene
  :: Effect Unit
  -> WEB.DOM.Element
  -> Scene (TriggeredScene Unit Unit) RunDOM RunEngine Frame0 State
       Unit
scene notifyEnd elt =
  ( \_ push ->
      let
        state = { n: 0, n1: 0, n2: 0, n3: 0, n4: 0 }
      in
        ( icreate $
            DOM.root elt
              { dv: DOM.div []
                  { btn: DOM.button
                      [ DOM.Id := (testToString StateDeku <> startSuffix)
                      , DOM.OnClick := cb
                          ( const $ do
                              ref <- Ref.new state
                              let modify = flip Ref.modify ref
                              sequence_ $ replicate stateUpdates' $ modify
                                (\s -> s { n = s.n + 1 })
                              sequence_ $ replicate stateUpdates' $ modify \s ->
                                s
                                  { n1 = s.n1 + 1 }
                              sequence_ $ replicate stateUpdates' $ modify \s ->
                                s
                                  { n2 = s.n2 + 1 }
                              sequence_ $ replicate stateUpdates' $ modify \s ->
                                s
                                  { n3 = s.n3 + 1 }
                              sequence_ $ replicate stateUpdates' $ modify \s ->
                                s
                                  { n4 = s.n4 + 1 }
                              Ref.read ref >>= push
                              notifyEnd
                          )
                      ]
                      { txt: DOM.text "Start Test" }
                  , msg: DOM.text $ show state
                  }
              }
        ) $> state

  ) @!> iloop \e _ st ->
    case e of
      Left _ -> pure st
      Right newSt -> ichange { "root.dv.msg": show newSt } $> newSt
