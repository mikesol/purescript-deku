module Deku.Example.Docs.HelloWorld where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Control.Functions (freeze, (@!>))
import Deku.Create (icreate)
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM (ResolvedSubgraphSig, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Util (detup)
import Effect (Effect)

helloWorld :: (Page -> Effect Unit) -> ResolvedSubgraphSig "head" Unit Unit
helloWorld dpage =
  ( \_ _ -> icreate
      { head: D.div []
          { header: D.header []
              { title: D.h1 [] (S.text "Hello world")
              , subtitle: D.h3 []
                  ( S.text
                      "A small example"
                  )
              }
          , pars: D.div []
              ( detup
                  $
                    D.p []
                      ( S.text
                          """Here is "hello world" in Deku. In this and all the following sections, we'll start with a full example, and we'll pick it apart afterwards."""
                      )
                      /\
                        ( D.pre []
                            ( S.code []
                                ( S.text
                                    """module Deku.Example.Docs.Example.HelloWorld where

import Prelude

import Data.Foldable (for_)
import Deku.Control.Functions.Graph (freeze, (@!>))
import Deku.Create (icreate)
import Deku.Graph.DOM (root)
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (makeFFIDOMSnapshot)
import Deku.Run (defaultOptions, run)
import Effect (Effect)
import FRP.Event (subscribe)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \elt -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      ( run (pure unit) (pure unit) defaultOptions ffi
          $
            ( \_ _ ->
                (icreate $ root elt (S.text "Hello world"))
            ) @!> freeze

      )
      (_.res >>> pure)
"""
                                )
                            )
                        )

                      /\ D.p []
                        ( detup $
                            ( D.text
                                "Yikes, that's a lot of imports! But the actual Deku bit is pretty tame. Let's tackle it starting at the beginning of the "
                            )
                              /\
                                (D.code [] (S.text "main"))
                              /\ (D.text " function.")
                              /\ unit
                        )
                      /\ D.p []
                        ( detup $
                            ( D.text
                                "Oh, and here's what it produces:"
                            )
                              /\ unit
                        )
                      /\ D.blockquote []
                        ( detup $
                            ( D.text
                                "Hello world"
                            )
                              /\ unit
                        )
                      /\ D.p []
                        ( S.text "You gotta start somewhere!"

                        )
                      /\ D.h2 [] (S.text "Our top-level component")
                      /\ D.p []
                        ( detup $
                            D.text
                              """Deku sets up shop in an arbitrary DOM component. In the """
                              /\ D.code [] (S.text "main")
                              /\ D.text
                                """ function above, we grab a component from our page — in this case, the body. We'll use this as the root of our component tree."""
                              /\ unit
                        )
                      /\ D.h2 [] (S.text "The run function")
                      /\ D.p []
                        ( detup $
                            D.span []
                              ( S.text
                                  """Deku relieves heavily on """
                              )
                              /\ D.a
                                [ D.Href :=
                                    "https://wiki.haskell.org/Functional_Reactive_Programming"
                                ]
                                ( S.text "Functional Reactive Programming"
                                )
                              /\ D.span []
                                ( S.text
                                    """, or FRP, patterns. This means that everything runs on """
                                )
                              /\ D.a
                                [ D.Href :=
                                    "https://wiki.haskell.org/Functional_Reactive_Programming"
                                ]
                                ( S.text "Events"
                                )
                              /\ D.span []
                                ( S.text
                                    """ and """
                                )
                              /\ D.a
                                [ D.Href :=
                                    "https://wiki.haskell.org/Functional_Reactive_Programming"
                                ]
                                ( S.text "Behaviors"
                                )
                              /\ D.span []
                                ( S.text
                                    """. The """
                                )
                              /\ D.code []
                                (S.text "run")
                              /\ D.span []
                                ( S.text
                                    """ function creates an event, and you subscribe to that event in order to get an outcome or residual. In this case, we're ignoring the residual (which is just """
                                )
                              /\ D.code []
                                (S.text "unit")
                              /\ D.span []
                                ( S.text """) at the end of the """
                                )
                              /\ D.code []
                                (S.text "main")
                              /\ D.span []
                                ( S.text """ function by calling """
                                )
                              /\ D.code []
                                (S.text "_.res >>> pure")
                              /\ D.span [] (S.text ".")

                              /\ unit
                        )
                      /\ D.p []
                        ( detup $
                            D.text
                              "Events can trigger aribtrary side effects on their way to a subscriber, and the one produced by "
                              /\ D.code []
                                (S.text "run")
                              /\ D.span []
                                ( S.text
                                    """ is no different. Here, the side effect is creating a beautiful webpage like the one you're reading now. Or, if you're following along by typing out the example, it will create \"Hello world\" in the body of your page."""
                                )
                              /\ unit
                        )
                      /\ D.p []
                        ( detup $
                            ( D.text
                                "The first few arguments to "
                            ) /\ (D.code [] (S.text "run"))
                              /\
                                ( D.text
                                    " are not important at this point. Know just that you have to call "
                                )
                              /\ (D.code [] (S.text "run"))
                              /\
                                ( D.text
                                    " to get your webpage displayed on the screen."
                                )
                              /\ unit
                        )
                      /\ D.h2 [] (S.text "Our scene")
                      /\ D.p []
                        ( detup $
                            ( D.text
                                "The last argument to "
                            ) /\ (D.code [] (S.text "run"))
                              /\
                                ( D.text
                                    " is the scene we are going to draw. The scene starts by creating the text \"Hello world\" in the root element and is then frozen, meaning that it can't change."
                                )
                              /\ unit
                        )
                      /\ D.p []
                        ( S.text
                            "The scene-creation pattern above is the same one you'll see in all the examples to follow. In Deku, changes to DOMs (including no-ops) are streamed, which means that every time we request a change-set to a DOM, Deku has to produce one. By calling freeze, we're not saying that we can't demand a change-set anymore, but rather, we're saying that Deku will always produce an empty change-set when asked. As you become more comfortable with Deku, you'll realize that it's just one big generator of streams of DOM diffs."
                        )
                      /\ D.p []
                        ( detup $
                            D.text
                              "That's all you need to know at this point. We'll go over what "
                              /\ D.code [] (S.text "icreate")
                              /\ D.text " and "
                              /\ D.code [] (S.text "@!>")
                              /\ D.text
                                " do later in this guide. For now, the important bit is to get up and running. We'll build off of this in the following sections."
                              /\ unit
                        )
                      /\ D.h2 [] (S.text "Next steps")
                      /\ D.p []
                        ( detup $
                            D.span []
                              ( S.text
                                  """Now that you can say hello to the world, let's explore some classic DOM tags like Anchor and Button by introducing a """
                              )
                              /\ D.a
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
  ) @!> freeze
