module Deku.Example.Docs.HelloWorld where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Control.Functions (freeze, u, (%>))
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM (ResolvedSubgraphSig, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Util ((@@))
import Effect (Effect)

helloWorld :: (Page -> Effect Unit) -> ResolvedSubgraphSig Unit Unit
helloWorld dpage =
  ( \_ _ -> u
      { head: D.div []
          { header: D.header []
              { title: D.h1 [] (S.text "Hello world")
              , subtitle: D.h3 []
                  (S.text "A small example")
              }
          , pars: D.div []
              ( D.p []
                  ( S.text
                      """Here is "hello world" in Deku. In this and all the following sections, we'll start with a full example, and we'll pick it apart afterwards."""
                  )
                  @@
                    ( D.pre []
                        ( S.code []
                            ( S.text
                                """module Main where

import Prelude

import Deku.Control.Functions (freeze, u)
import Deku.Graph.DOM.Shorthand as S
import Deku.Toplevel ((🚀))
import Effect (Effect)

main :: Effect Unit
main = (const $ u $ (S.text "Hello world")) 🚀 freeze
"""
                            )
                        )
                    )

                  /\ D.p []
                    (S.text "And here's what it produces:")
                  /\ D.blockquote []
                    (S.text "Hello world")
                  /\ D.p []
                    (S.text "You gotta start somewhere!")
                  /\ D.h2 [] (S.text "Our top-level component")
                  /\ D.p []
                    ( D.text
                        """Deku sets up shop in an arbitrary DOM component. In the """
                        @@ D.code [] (S.text "main")
                        /\ D.text
                          """ function above, we use 🚀 to automatically insert our Deku tree into the body."""
                        /\ unit
                    )
                  /\ D.h2 [] (S.text "Our scene")
                  /\ D.p []
                    ( D.text
                        "Our scene is comprised of two components - a bit of text, created by "
                        @@ (D.code [] (S.text "const $ u $ (S.text \"Hello world\")"))
                        /\
                          ( D.text
                              ", and a directive "
                          ) /\ (D.code [] (S.text "freeze")) /\ D.text "to, well, freeze the DOM, meaning that there will be no subsequent changes."
                        /\ unit
                    )
                  /\ D.p []
                    ( D.text
                        "That's all you need to know at this point. We'll see lots of examples that use "
                        @@ D.code [] (S.text "🚀")
                        /\ D.text " to create scenes, and they'll get progressively more complex as the guide goes on."
                        /\ unit
                    )
                  /\ D.h2 [] (S.text "Next steps")
                  /\ D.p []
                    ( D.span []
                        ( S.text
                            """Now that you can say hello to the world, let's explore some classic DOM tags like Anchor and Button by introducing a """
                        )
                        @@ D.a
                          [ D.OnClick := cb
                              ( const $ dpage SimpleComponent *>
                                  scrollToTop
                              )
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
  ) %> freeze
