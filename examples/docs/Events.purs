module Deku.Example.Docs.Events where

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
import Deku.Control.Functions as G
import Deku.Control.Functions (freeze, (@!>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Create (icreate)
import Deku.Example.Docs.Intro as Intro
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Graph.Attribute (Cb(..))
import Deku.Graph.DOM (AsSubgraph(..), SubgraphSig, subgraph, (:=))
import Deku.Graph.DOM (ResolvedSubgraphSig)
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

events :: (Page -> Effect Unit) -> ResolvedSubgraphSig "head" Unit Unit
events dpage =
  ( \_ _ -> icreate
      { head: D.div []
          { header: D.header []
              { title: D.h1 [] (S.text "Events")
              , subtitle: D.h3 []
                  ( S.text
                      "Let's click on stuff!"
                  )
              }
          , pars: D.div []
              ( detup
                  $
                    D.p []
                      ( S.text
                          """Here is "hello world" in Deku. In this and all the following sections, we'll start with a full example, and we'll pick it apart afterwards."""
                      )
                      /\ D.code []
                        ( S.text
                            """module HelloWorld where

import Prelude

main :: Effect Unit
main = pure unit
"""
                        )
                      /\ D.h2 [] (S.text "Our top-level component")
                      /\ D.p []
                        ( S.text
                            """Deku works in arbitrary DOM components, so in the first part of our hello world, we grab a component from our page — in this case, the body."""
                        )
                      /\ D.h2 [] (S.text "The run function")
                      /\ D.h2 [] (S.text "Our scene")
                      /\ D.h2 [] (S.text "Next steps")
                      /\ D.p []
                        ( detup $
                            D.span []
                              ( S.text
                                  """Now that you can say hello to the world, let's explore the anatomy of a component by introducing a """
                              )
                              /\ D.a
                                [ D.OnClick := Cb
                                    (const $ dpage Effects *> scrollToTop)
                                , D.Style := "cursor:pointer;"
                                ]
                                (S.text "simple component")
                              /\ D.span []
                                ( S.text "."
                                )
                              /\ unit
                        )
                      /\ unit
              )
          }
      }
  ) @!> freeze
