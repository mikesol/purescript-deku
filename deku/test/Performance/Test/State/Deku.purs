module Performance.Test.State.Deku where

import Prelude

import Control.Alt ((<|>))
import Data.Array.NonEmpty (replicate)
import Data.Foldable (sequence_, traverse_)
import Data.Maybe (Maybe(..))
import Deku.Attribute ((:=))
import Deku.Control (text, text_)
import Deku.Core (Nut, bussed)
import Deku.DOM as D
import Deku.Toplevel (runInElement')
import Effect (Effect)
import Effect.Class (class MonadEffect)
import Effect.Ref as Ref
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.Subscription as HS
import Performance.Test.State.Shared (Output(..), stateUpdates)
import Performance.Test.Types (Test(..), startSuffix, testToString)
import Type.Proxy (Proxy(..))
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
        (runInElement' (toElement el) (scene (HS.notify listener MarkEnd)))
      H.modify_ _ { unsub = unsub }
      pure unit

type State = { n :: Int, n1 :: Int, n2 :: Int, n3 :: Int, n4 :: Int }

scene
  :: Effect Unit
  -> Nut
scene notifyEnd =
  ( bussed \setState state' ->
      let
        stateE = state' <|> pure { n: 0, n1: 0, n2: 0, n3: 0, n4: 0 }
      in
        ( D.div_
            [ D.button
                [ pure $ D.Id := (testToString StateDeku <> startSuffix)
                , stateE <#> \state -> D.OnClick := do
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
                    Ref.read ref >>= setState
                    notifyEnd
                ]
                [ text_ "Start Test" ]
            , text (show <$> stateE)
            ]
        )
  )