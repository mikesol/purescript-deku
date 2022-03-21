module Deku.Example.Docs.Subgraph where

import Prelude

import Deku.Graph.DOM (ResolvedSubgraphSig)
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
import Deku.Example.Docs.Types
import Deku.Example.Docs.Intro as Intro

subgraph :: (Page -> Effect Unit) -> ResolvedSubgraphSig "head" Unit Unit
subgraph dpage =
  ( \_ _ -> icreate
      { head: D.div []
          { header: D.header []
              { title: D.h1 [] (S.text "Subgraphs")
              , subtitle: D.h3 []
                  ( S.text
                      "Fine-grained inter-component communication"
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
                      /\ D.h2 [] (S.text "Conclusion")
                      /\ D.p [] (S.text "And there you have it! You have all the tools you need to build amazing apps with Deku. Go forth and be brilliant!")
                      /\ unit
              )
          }
      }
  ) @!> freeze
