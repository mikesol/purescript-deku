module Deku.Example.Docs.Intro where

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

intro :: (Page -> Effect Unit) -> ResolvedSubgraphSig Unit Unit
intro dpage =
  ( \_ _ ->
      u
        { head: D.div []
            { header: D.header []
                { title: D.h1 [] (S.text "Deku")
                , subtitle: D.h3 []
                    ( S.text
                        "A web micro-framework written in PureScript"
                    )
                }
            , pars: D.div []
                ( D.p [] (S.text "Hi! You've found Deku.")
                      @@ D.p []
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
                        ( D.span []
                              ( S.text
                                  """The main goal of Deku is """
                              )
                              @@ D.span
                                [ D.Style := "font-weight: 800;" ]
                                { t: D.text "speed" }
                              /\ D.span []
                                { t: D.text
                                    ". I made it for the purpose of creating interactive web-based musical instruments, but it's equally useful as a general-purpose web framework. Its standard event-handling patterns tend to outperform those of React and Vue by a factor of 1.5-2x."
                                }
                              /\ unit
                        )
                      /\ D.p []
                        ( D.span []
                              ( S.text
                                  """This is the Deku documentation. Like most documentation, it's radically incomplete, hopelessly biased, and full of unfounded assumptions. That said, I hope it gets you started off on the right foot. If you have any questions, feel free ping me on the """
                              )
                              @@ D.a
                                [ D.Href := "https://purescript.org/chat" ]
                                { t: D.text "PureScript Discord" }
                              /\ D.span []
                                { t: D.text "." }
                              /\ unit
                        )
                      /\ D.p []
                        (  D.span []
                              ( S.text
                                  """This documentation is written in Deku and can be found """
                              )
                              @@ D.a
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
                        (  D.span []
                              ( S.text
                                  """And now, without further ado, check out the """
                              )
                              @@ D.a
                                [ D.OnClick := cb
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
  ) %> freeze