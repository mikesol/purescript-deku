module Deku.Example.Docs where

import Deku.Example.Docs.Types
import Prelude

import Data.Either (Either(..))
import Data.Foldable (for_)
import Data.Generic.Rep (class Generic)
import Data.Hashable (class Hashable, hash)
import Data.Map (insert, singleton)
import Data.Maybe (Maybe(..))
import Data.Show.Generic (genericShow)
import Data.Tuple.Nested ((/\))
import Deku.Change (ichange_)
import Deku.Control.Functions.Graph as G
import Deku.Control.Functions.Subgraph (freeze, (@!>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Create (icreate)
import Deku.Example.Docs.HelloWorld as HelloWorld
import Deku.Example.Docs.Intro as Intro
import Deku.Example.Docs.SimpleComponent as SimpleComponent
import Deku.Example.Docs.Events as Events
import Deku.Example.Docs.Effects as Effects
import Deku.Example.Docs.Control as Control
import Deku.Example.Docs.Subgraph as Subgraph
import Deku.Graph.Attribute (Cb(..))
import Deku.Graph.DOM (AsSubgraph(..), SubgraphSig, subgraph, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (makeFFIDOMSnapshot)
import Deku.Run (RunDOM, RunEngine, TriggeredScene, defaultOptions, run)
import Deku.Util (detup)
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
  G.istart
    ( \_ push ->
        ( icreate $
            D.root elt
              { main: D.main []
                  { topbar: D.nav []
                      ( S.ul []
                          ( detup $
                              D.li []
                                ( detup $
                                    D.a
                                      [ D.OnClick := Cb (const $ push Intro)
                                      , D.Style := "cursor:pointer;"
                                      ]
                                      (S.text "Home") /\ D.text " | " /\ unit
                                )
                                /\ D.li []
                                  ( detup $
                                      D.a
                                        [ D.OnClick := Cb
                                            (const $ push HelloWorld)
                                        , D.Style := "cursor:pointer;"
                                        ]
                                        (S.text "Hello world") /\ D.text " | "
                                        /\ unit
                                  )
                                /\ D.li []
                                  ( detup $
                                      D.a
                                        [ D.OnClick := Cb
                                            (const $ push SimpleComponent)
                                        , D.Style := "cursor:pointer;"
                                        ]
                                        (S.text "Component") /\ D.text " | " /\
                                        unit
                                  )
                                /\ D.li []
                                  ( detup $
                                      D.a
                                        [ D.OnClick := Cb
                                            (const $ push Events)
                                        , D.Style := "cursor:pointer;"
                                        ]
                                        (S.text "Events") /\ D.text " | " /\
                                        unit
                                  )
                                /\ D.li []
                                  ( detup $
                                      D.a
                                        [ D.OnClick := Cb
                                            (const $ push Effects)
                                        , D.Style := "cursor:pointer;"
                                        ]
                                        (S.text "Effects") /\ D.text " | " /\
                                        unit
                                  )
                                /\ D.li []
                                  ( detup $
                                      D.a
                                        [ D.OnClick := Cb (const $ push Control)
                                        , D.Style := "cursor:pointer;"
                                        ]
                                        (S.text "Control") /\ D.text " | " /\
                                        unit
                                  )
                                /\ D.li []
                                  ( S.a
                                      [ D.OnClick := Cb (const $ push Subgraph)
                                      , D.Style := "cursor:pointer;"

                                      ]
                                      (S.text "Subgraphs")
                                  )
                                /\ unit
                          )
                      )
                  , page: subgraph (singleton Intro (Just unit))
                      (AsSubgraph (page push))
                  }
              }
        ) $> Intro
    )
    ( G.iloop
        ( \e _ oldPg -> case e of
            Left _ -> pure oldPg
            Right newPg -> newPg <$ when (oldPg /= newPg)
              ( do
                  ichange_
                    { "root.main.page": D.xsubgraph
                        ( insert newPg (Just unit)
                            $ singleton
                              oldPg
                              Nothing
                        )
                    }
              )
        )
    )

page :: (Page -> Effect Unit) -> SubgraphSig Page "head" Unit Unit
page dpage Intro = Intro.intro dpage
page dpage HelloWorld = HelloWorld.helloWorld dpage
page dpage SimpleComponent = SimpleComponent.simpleComponent dpage
page dpage Events = Events.events dpage
page dpage Effects = Effects.effects dpage
page dpage Control = Control.control dpage
page dpage Subgraph = Subgraph.subgraph dpage

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      (run (pure unit) (pure unit) defaultOptions ffi (scene b))
      (\_ -> pure unit)
