module Deku.Example.Docs where

import Prelude

import Data.Foldable (for_)
import Data.Map (singleton)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Control.Functions.Graph as G
import Deku.Control.Functions.Subgraph (freeze, (@!>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Create (icreate)
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
  -> Scene (TriggeredScene Unit Unit) RunDOM RunEngine Frame0 Boolean Unit
scene elt =
  G.istart
    ( \_ _ ->
        ( icreate $
            D.root elt
              { main: D.main []
                  { nav: D.nav []
                      { ul: D.ul []
                          ( detup $ D.li [] (S.a [] (S.text "Home"))
                              /\ D.li [] (S.a [] (S.text "Hello world"))
                              /\ D.li [] (S.text "Events and effects")
                              /\ D.li [] (S.text "Control")
                              /\ D.li [] (S.text "Subgraphs")
                              /\ unit
                          )
                      }
                  , page: subgraph (singleton 0 (Just unit)) (AsSubgraph page)
                  }
              }
        )
    )
    G.freeze

page :: SubgraphSig "head" Unit Unit
page 0 =
  ( \_ _ -> icreate
      { head: D.div []
          { header: D.header []
              { title: D.h1 [] (S.text "Deku")
              , subtitle: D.h3 []
                  ( S.text
                      "A web micro-framework written in PureScript"
                  )
              }
          , pars: D.div []
              ( detup
                  $ D.p [] (S.text "Hi! You've found Deku.")
                    /\ D.p []
                      { a: D.a
                          [ D.Href :=
                              "https://github.com/mikesol/purescript-deku"
                          ]
                          { t: D.text "Deku " }
                      , s: D.span []
                          ( S.text
                              """ is the coolest web micro-framework that no one knows about yet. Except you, of course, as you're here. So welcome!"""
                          )
                      }
                    /\ D.p []
                      ( detup $
                          D.span []
                            ( S.text
                                """This is the Deku documentation. Like most documentation, it's radically incomplete, hopelessly biased, full of assumptions, etc. That said, I hope it gets you started using Deku. If you have any questions, feel free ping me on the """
                            )
                            /\ D.a
                              [ D.Href := "https://purescript.org/chat" ]
                              { t: D.text "PureScript Discord" }
                            /\ D.span []
                              { t: D.text "." }
                            /\ unit
                      )
                    /\ D.p []
                      ( detup $
                          D.span []
                            ( S.text
                                """This documentation is written in Deku and can be found """
                            )
                            /\ D.a
                              [ D.Href :=
                                  "https://github.com/mikesol/purescript-deku/tree/main/examples/docs"
                              ]
                              (S.text "here.")
                            /\ unit
                      )
                    /\ unit
              )
          }
      }
  ) @!> freeze
page _ =
  ( \_ _ -> icreate
      { head: D.div []
          { header: D.header []
              { title: D.h1 [] (S.text "Hello world")
              , subtitle: D.h3 []
                  ( S.text
                      "Cuz we all gotta start somewhere!"
                  )
              }
          , pars: D.div []
              ( detup
                  $ D.p [] (S.text "Hello world.")
                    /\ unit
              )
          }
      }
  ) @!> freeze

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      (run (pure unit) (pure unit) defaultOptions ffi (scene b))
      (\_ -> pure unit)
