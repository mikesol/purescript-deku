module Deku.Example.Docs.Intro where

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
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Graph.Attribute (Cb(..))
import Deku.Graph.DOM (AsSubgraph(..), ResolvedSubgraphSig, subgraph, (:=))
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

intro :: (Page -> Effect Unit) -> ResolvedSubgraphSig "head" Unit Unit
intro dpage =
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
                          { t: D.text "Deku" }
                      , s: D.span []
                          ( S.text
                              """ is the coolest web micro-framework that no one knows about yet. Except you, of course, as you're here. So welcome!"""
                          )
                      }
                    /\ D.p []
                      ( detup $
                          D.span []
                            ( S.text
                                """This is the Deku documentation. Like most documentation, it's radically incomplete, hopelessly biased, and full of unfounded assumptions. That said, I hope it gets you started off on the right foot. If you have any questions, feel free ping me on the """
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
                            /\ D.span []
                              ( S.text
                                  """ One good way to follow along is by using the Deku starter repo, which you can clone """
                              )
                            /\ D.a
                              [ D.Href :=
                                  "https://github.com/mikesol/purescript-deku-starter"
                              ]
                              (S.text "here.")
                            /\ unit
                      )
                    /\ D.p []
                      ( detup $
                          D.span []
                            ( S.text
                                """And now, without further ado, check out the """
                            )
                            /\ D.a
                              [ D.OnClick := Cb
                                  (const $ dpage HelloWorld *> scrollToTop)
                              , D.Style := "cursor:pointer;"
                              ]
                              (S.text "hello world section")
                            /\ D.span []
                              ( S.text "!"
                              )
                            /\ unit
                      )
                    /\ unit
              )
          }
      }
  ) @!> freeze