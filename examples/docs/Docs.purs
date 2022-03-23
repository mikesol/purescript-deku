module Deku.Example.Docs where

import Deku.Example.Docs.Types (Page(..))
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
import Deku.Example.Docs.SSR as SSR
import Deku.Example.Docs.SimpleComponent as SimpleComponent
import Deku.Example.Docs.Subgraphs as Subgraph
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM (AsSubgraph(..), SubgraphSig, subgraph, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (makeFFIDOMSnapshot)
import Deku.Run (RunDOM, RunEngine, TriggeredScene, defaultOptions, run)
import Deku.Util (detup, vex)
import Effect (Effect)
import FRP.Event (subscribe)
import Web.DOM as WEB.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

scene
  :: WEB.DOM.Element
  -> Scene (TriggeredScene Unit Unit) RunDOM RunEngine Frame0 Page Unit
scene elt =
  ( \_ push ->
      D.root elt
        { main: D.main []
            { topbar: D.div []
                ( S.div []
                    ( let
                        sections =
                          map
                            ( \(x /\ y /\ z) -> D.span []
                                ( detup $
                                    D.a
                                      [ D.OnClick := cb (const $ push x)
                                      , D.Style := "cursor:pointer;"
                                      ]
                                      (S.text y)
                                      /\ D.span
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
                            /\ true +> Events
                            /\ "Events"
                            /\ true +> Effects
                            /\ "Effects"
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

page :: (Page -> Effect Unit) -> SubgraphSig Page Unit Unit
page dpage Intro = Intro.intro dpage
page dpage HelloWorld = HelloWorld.helloWorld dpage
page dpage SimpleComponent = SimpleComponent.simpleComponent dpage
page dpage Events = Events.events dpage
page dpage Effects = Effects.effects dpage
page dpage SSR = SSR.serverSide dpage
page dpage Subgraph = Subgraph.subgraphs dpage

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      (run (pure unit) (pure unit) defaultOptions ffi (scene b))
      (\_ -> pure unit)
