module Deku.Example.Docs.SimpleComponent where

import Deku.Example.Docs.Types (Page(..))
import Prelude

import Data.Vec ((+>), empty)
import Data.Tuple.Nested ((/\))
import Deku.Control.Functions (freeze, (@!>))
import Deku.Create (icreate)
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM (ResolvedSubgraphSig, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Util (detup, vex)
import Effect (Effect)

simpleComponent :: (Page -> Effect Unit) -> ResolvedSubgraphSig "head" Unit Unit
simpleComponent dpage =
  ( \_ _ -> icreate
      { head: D.div []
          { header: D.header []
              { title: D.h1 [] (S.text "A Simple Component")
              , subtitle: D.h3 []
                  ( S.text
                      "Slightly more bells and whistles"
                  )
              }
          , pars: D.div []
              ( detup
                  $
                    D.p []
                      ( S.text
                          """Let's look at an example with several different DOM tags. There are also a few different syntax options depending on what tune your fingers wish to type."""
                      )
                      /\
                        ( D.pre []
                            ( S.code []
                                ( S.text
                                    """module Deku.Example.Docs.Example.Component where

import Prelude

import Data.Foldable (for_)
import Data.Vec ((+>), empty)
import Deku.Graph.DOM ((:=), root)
import Data.Tuple.Nested ((/\))
import Deku.Control.Functions.Graph (freeze, (@!>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Create (icreate)
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (class DOMInterpret, makeFFIDOMSnapshot)
import Deku.Run (defaultOptions, run)
import Deku.Util (detup, vex)
import Effect (Effect)
import FRP.Event (subscribe)
import Web.DOM (Element)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

scene
  :: forall env dom engine push res
   . Monoid res
  => DOMInterpret dom engine
  => Element
  -> Scene env dom engine Frame0 push res
scene elt =
  ( \_ _ ->
      ( icreate $ root elt
          ( { button: D.button [] { t: D.text "I do nothing" }
            , list: D.ul []
                $ vex
                $ map (D.li [] <<< S.text)
                  ("A" +> "B" +> "C" +> empty)
            , rando: D.div []
                $ detup
                $ D.a [D.Href := "https://github.com/mikesol/purescript-deku"] (S.text "foo ")
                  /\ D.i [] (S.text " bar ")
                  /\ D.span [ D.Style := "font-weight: 800;" ] (S.text " baz")
                  /\
                    unit
            , lotsOfDivs: D.div []
                $ S.div []
                $ S.div []
                $ S.input [ D.Xtype := "range" ] {}
            }
          )
      )
  ) @!> freeze

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \elt -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      ( run (pure unit) (pure unit) defaultOptions ffi
          (scene elt)

      )
      (_.res >>> pure)
"""
                                )
                            )
                        )

                      /\ D.p []
                        ( detup $
                            ( D.text
                                "Here's what it produces:"
                            )
                              /\ unit
                        )
                      /\ D.blockquote []
                        { button: D.button [] { t: D.text "I do nothing" }
                        , list: D.ul []
                            $ vex
                            $ map (D.li [] <<< S.text)
                              ("A" +> "B" +> "C" +> empty)
                        , rando: D.div []
                            $ detup
                            $
                              D.a
                                [ D.Href :=
                                    "https://github.com/mikesol/purescript-deku"
                                ]
                                (S.text "foo ")
                                /\ D.i [] (S.text " bar ")
                                /\ D.span [ D.Style := "font-weight: 800;" ]
                                  (S.text " baz")
                                /\
                                  unit
                        , lotsOfDivs: D.div []
                            $ S.div []
                            $ S.div []
                            $ S.input [ D.Xtype := "range" ] {}
                        }
                      /\ D.h2 [] (S.text "It's all about records")
                      /\ D.p []
                        ( detup $
                            D.text
                              """Deku encodes the DOM using records. The functions """
                              /\ D.code [] (S.text "detup")
                              /\ D.text
                                ""","""
                              /\ D.code [] (S.text "vex")
                              /\ D.text
                                """, and all of the """
                              /\ D.code [] (S.text "S")
                              /\ D.text
                                """-prefixed functions produce records."""
                              /\ unit
                        )
                      /\ D.h2 [] (S.text "Straight-up records")
                      /\ D.p []
                        ( detup $
                            D.text
                              """All DOM elements accept a record of child nodes. In the example above, we give """
                              /\ D.code [] (S.text "root")
                              /\ D.text
                                """a record with four keys: """
                              /\ D.code [] (S.text "button")
                              /\ D.text
                                """, """
                              /\ D.code [] (S.text "list")
                              /\ D.text
                                """, """
                              /\ D.code [] (S.text "rando")
                              /\ D.text
                                """ and """
                              /\ D.code [] (S.text "lotsOfDivs")
                              /\ D.text
                                """."""
                              /\ unit
                        )
                      /\ D.p []
                        ( detup $
                            D.text
                              "Records are cool, but they get tedious. For example, the button needs a record just to add a bit of text. For one-off records, you can use the "
                              /\ D.code [] (S.text "S")
                              /\ D.text " family of functions. For example, "
                              /\ D.code [] (S.text "S.text \"hi\"")
                              /\ D.text "is equivalent to"
                              /\ D.code [] (S.text "{ t: D.text \"hi\" }")
                              /\ D.text "."
                              /\ unit
                        )
                      /\ D.h2 [] (S.text "De-tupling")
                      /\ D.p []
                        ( detup $
                            D.text
                              "Next up is " /\ D.code [] (S.text "detup")
                              /\ D.text ". "
                              /\ D.code [] (S.text "detup")
                              /\ D.text
                                " takes a \"list\" of tuples terminated by "
                              /\ D.code [] (S.text "unit")
                              /\ D.text
                                " and turns them into a record with keys that go from 0 to however many elements are in the tuple. This feels a lot more like working with arrays in Halogen and is fast to type. As I'm writing this, I'm using "
                              /\ D.code [] (S.text "detup")
                              /\ D.text "(check the source code)."
                              /\ unit
                        )
                      /\ D.h2 [] (S.text "Vectors")
                      /\ D.p []
                        ( detup $
                            D.text
                              "If all of your elements have the same type, you can use "
                              /\ D.code [] (S.text "vex")
                              /\ D.text ". "
                              /\ D.code [] (S.text "vex")
                              /\ D.text
                                " is nice because we can map over the elements, whereas tuples are heterogeneous and require more type-level machinery. In the example above, all of the list items are the same and are stashed in a vector that is processed by"
                              /\ D.code [] (S.text "vex")
                              /\ D.text "."
                              /\ unit
                        )
                      /\ D.h2 [] (S.text "Attributes")
                      /\ D.p []
                        ( detup $
                            D.text
                              "The last thing to address here are attributes. Attributes like an element's "
                              /\ D.code [] (S.text "style")
                              /\ D.text
                                """ or """
                              /\ D.code [] (S.text "id")
                              /\ D.text
                                " are added in the array after element creation. In the example above, we make the input a range slider, for example, using"
                              /\ D.code [] (S.text "Xtype := \"range\"")
                              /\ D.text
                                ". Unlike Halogen, there are no checks to make sure you give a valid string. So if you want your range slider to have the value of "
                              /\ D.code [] (S.text "true")
                              /\ D.text
                                ", you can. One day, I may build some validators, but passing strings works decently well here."
                              /\ unit
                        )
                      /\ D.h2 [] (S.text "Next steps")
                      /\ D.p []
                        ( detup $
                            D.span []
                              ( S.text
                                  """In this section, we built a simple component out of records. We used several record-shorthand functions, including the """
                              ) /\ D.code [] (S.text "detup") /\ D.text ", the"
                              /\ D.code [] (S.text "vex")
                              /\ D.text ", and the "
                              /\ D.code [] (S.text "S")
                              /\ D.text
                                " family of functions. We also saw how to add attributes to elements. In the next section, we'll learn how to respond to "
                              /\ D.a
                                [ D.OnClick := cb
                                    ( const $ dpage Events *>
                                        scrollToTop
                                    )
                                , D.Style := "cursor:pointer;"
                                ]
                                (S.text "events")
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
