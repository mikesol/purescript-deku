module Deku.Example.Docs.Pursx2 where

import Prelude

import Data.Either (Either(..))
import Data.Tuple.Nested ((/\))
import Deku.Change (change)
import Deku.Control.Functions (u, (%>))
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM (ResolvedSubgraphSig, myNameIs, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Pursx ((~!))
import Deku.Util ((@@))
import Effect (Effect)
import Type.Proxy (Proxy(..))

pursx2 :: (Page -> Effect Unit) -> ResolvedSubgraphSig Unit Unit
pursx2 dpage =
  ( \_ push ->
      u
        { head: D.div []
            { header: D.header []
                { title: D.h1 [] (S.text "PursX 2")
                , subtitle: D.h3 []
                    ( S.text
                        "Working with events and effects"
                    )
                }
            , pars: D.div []
                ( D.p []
                    ( S.text
                        """PursX would be of only limited utility if it could only render static content. In this section, we'll see how to make it dynamic, both by modifying existing elements and inserting entirely new ones."""
                    )
                    @@ D.p []
                      ( S.text
                          """The example below is the same one from the Pursx 1 section with two differences. The first is that the background color of the second list item is set dynamically. The second is that there is a new button that is dynamically inserted."""
                      )
                    /\
                      ( D.pre []
                          ( S.code []
                              ( S.text $
                                  """module Main where

import Prelude

import Deku.Change (change)
import Deku.Control.Functions (u)
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM ((:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Pursx ((~!))
import Deku.Toplevel ((🚀))
import Deku.Util (p)
import Effect (Effect)

mydom = p :: _ """ <> "\"\"\"" <> """
      <div>
        <button>I do nothing</button>
        <ul>
          <li>A</li>
          <li ~myli~>B</li>
          <li>C</li>
        </ul>
        <div>
          <a href="https://github.com/mikesol/purescript-deku"></a>
          <i>bar</i>
          ~somethingNew~
          <span style="font-weight:800;">baz</span>
        </div>
        <div><div></div><div><input type="range"/></div></div>
      </div>
      """ <> "\"\"\"" <> """

main :: Effect Unit
main =
  ( \push ->
      ( u $
          mydom ~!
            { myli: D.li'attr
                [ D.Style := "background-color:rgb(200,240,210);" ]
            , somethingNew:
                D.button [ D.OnClick := cb (const $ push unit) ]
                  (S.text "I was dynamically inserted")
            }
      )
  ) 🚀 \_ _ ->
    change
      { "root.psx.somethingNew.t": "Thanks for clicking me!" }
"""
                              )
                          )
                      )

                    /\ D.p []
                      (S.text "Here's what it produces:")
                    /\
                      ( myNameIs (Proxy :: _ "blocky") $ D.blockquote []
                          ( ( Proxy
                                :: _
                                  """
      <div>
        <button>I do nothing</button>
        <ul>
          <li>A</li>
          <li ~myli~>B</li>
          <li>C</li>
        </ul>
        <div>
          <a href="https://github.com/mikesol/purescript-deku"></a>
          <i>bar</i>
          ~somethingNew~
          <span style="font-weight:800;">baz</span>
        </div>
        <div><div></div><div><input type="range"/></div></div>
      </div>
      """
                            ) ~!
                              { myli: D.li'attr
                                  [ D.Style :=
                                      "background-color:rgb(200,240,210);"
                                  ]
                              , somethingNew: D.button
                                  [ D.OnClick := cb (const $ push unit) ]
                                  (S.text "I was dynamically inserted")
                              }
                          )
                      )
                    /\ D.h2 [] (S.text "Dynamism in static content")
                    /\ D.p []
                      ( D.text
                          """Dynamic content is added to pursx with the separator """
                          @@ D.code [] (S.text "~")
                          /\ D.text
                            """. This separator can be set programatically as well (see the """
                          /\ D.code [] (S.text "Deku/Pursx.purs")
                          /\ D.text
                            """ module for an example of how that is done)."""
                          /\ D.code [] (S.text "innerHTML")
                          /\ D.text
                            """Once it is added, the record after """
                          /\ D.code [] (S.text "~!")
                          /\ D.text
                            """ or """
                          /\ D.code [] (S.text "~~")
                          /\ D.span [ D.Style := "font-weight:800;" ]
                            (S.text " must ")
                          /\ D.text
                            """ include a field with the name between the squgglies. In the case of a pre-existing element (like our list item), this field will contain attributes. In the case of our entirely new item, it will contain a Deku tree (ha!). These elements are addressable in the usual fashion, and you can see that you can interact with them. This provides a great way to mix static and dynamic content in a single document."""
                          /\ unit
                      )
                    /\ D.h2 [] (S.text "Next steps")
                    /\ D.p []
                      ( D.span []
                          ( S.text
                              """In more complicated apps, like this documentation, we'll want to split up our components into sub-components and create a way for them to communicate back and forth. In the next section, we'll see one way to do this via """
                          )
                          @@ D.a
                            [ D.OnClick := cb
                                ( const $ dpage Subgraph *>
                                    scrollToTop
                                )
                            , D.Style := "cursor:pointer;"
                            ]
                            (S.text "subgraphs")
                          /\ D.span []
                            ( S.text "."
                            )
                          /\ unit

                      )
                    /\ unit
                )
            }
        }
  ) %> \e _ -> case e of
    Left _ -> pure unit
    Right _ -> change { "blocky.psx.somethingNew.t": "Thanks for clicking me!" }
