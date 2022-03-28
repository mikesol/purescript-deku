module Deku.Example.Docs where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (for_)
import Data.Map (insert, singleton)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Data.Vec ((+>), empty)
import Deku.Change (change)
import Deku.Control.Functions ((@>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Example.Docs.Effects as Effects
import Deku.Example.Docs.Events as Events
import Deku.Example.Docs.HelloWorld as HelloWorld
import Deku.Example.Docs.Intro as Intro
import Deku.Example.Docs.Pursx1 as Pursx1
import Deku.Example.Docs.Pursx2 as Pursx2
import Deku.Example.Docs.SSR as SSR
import Deku.Example.Docs.SimpleComponent as SimpleComponent
import Deku.Example.Docs.Subgraphs as Subgraph
import Deku.Example.Docs.Types (DeviceType(..), Page(..))
import Deku.Example.Docs.Util (cot)
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM (AsSubgraph(..), SubgraphSig, subgraph, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (makeFFIDOMSnapshot)
import Deku.Run (RunDOM, RunEngine, TriggeredScene, defaultOptions, run)
import Deku.Util (vex, (@@))
import Effect (Effect)
import FRP.Event (subscribe)
import Web.DOM as WEB.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

scene
  :: WEB.DOM.Element
  -> DeviceType
  -> Scene (TriggeredScene Unit Unit) RunDOM RunEngine Frame0 Page Unit
scene elt dt =
  ( \_ push ->
      D.root elt
        { main: D.main []
            { topbar: D.div []
                ( S.div []
                    ( let
                        sections =
                          map
                            ( \(x /\ y /\ z) -> D.span []
                                ( D.a
                                    [ cot dt $ cb (const $ push x)
                                    , D.Style := "cursor:pointer;"
                                    ]
                                    (S.text y)
                                    @@ D.span
                                      [ D.Style :=
                                          if z then ""
                                          else "display:none;"
                                      ]
                                      (S.text " | ")
                                    /\ unit
                                )
                            ) $ Intro
                            /\ "Home"
                            /\ true +> HelloWorld
                            /\ "Hello world"
                            /\ true +> SimpleComponent
                            /\ "Component"
                            /\ true +> PURSX1
                            /\ "Pursx 1"
                            /\ true +> Events
                            /\ "Events"
                            /\ true +> Effects
                            /\ "Effects"
                            /\ true +> PURSX2
                            /\ "Pursx 2"
                            /\ true +> Subgraph
                            /\ "Subgraphs"
                            /\ true +> SSR
                            /\ "SSR"
                            /\ false +> empty
                      in
                        vex sections
                    )
                )
            , page: subgraph (singleton Intro (Just unit))
                (AsSubgraph (page push))
            }
        }
        /\ Intro
  ) @>
    ( \e oldPg -> case e of
        Left _ -> pure oldPg
        Right newPg -> newPg <$ when (oldPg /= newPg)
          ( do
              change
                { "root.main.page": D.xsubgraph
                    ( insert newPg (Just unit)
                        $ singleton
                          oldPg
                          Nothing
                    )
                }
          )
    )
  where
  page :: (Page -> Effect Unit) -> SubgraphSig Page Unit Unit
  page dpage Intro = Intro.intro dpage
  page dpage HelloWorld = HelloWorld.helloWorld dpage
  page dpage SimpleComponent = SimpleComponent.simpleComponent dpage
  page dpage PURSX1 = Pursx1.pursx1 dpage
  page dpage PURSX2 = Pursx2.pursx2 dpage
  page dpage Events = Events.events dt dpage
  page dpage Effects = Effects.effects dt dpage
  page dpage SSR = SSR.serverSide dpage
  page dpage Subgraph = Subgraph.subgraphs dt dpage

foreign import getDeviceType
  :: DeviceType -> DeviceType -> DeviceType -> Effect DeviceType

main :: Effect Unit
main = do
  dt <- getDeviceType Tablet Mobile Desktop
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      (run (pure unit) (pure unit) defaultOptions ffi (scene b dt))
      (\_ -> pure unit)
