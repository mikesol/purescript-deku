module Deku.Example.Docs.Pursx1 where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Control.Functions (u, freeze, (%>))
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM (ResolvedSubgraphSig, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Pursx ((~!))
import Deku.Util (detup)
import Effect (Effect)
import Type.Proxy (Proxy(..))

pursx1 :: (Page -> Effect Unit) -> ResolvedSubgraphSig Unit Unit
pursx1 dpage =
  ( \_ _ ->
      u
        { head: D.div []
            { header: D.header []
                { title: D.h1 [] (S.text "PursX 1")
                , subtitle: D.h3 []
                    ( S.text
                        "Like JSX... but better!"
                    )
                }
            , pars: D.div []
                ( detup
                    $
                      D.p []
                        ( S.text
                            """Writing out PureScript code for the DOM only really makes sense if you're doing some sort of interesting manipulations on the JS layer. Otherwise, it's pretty tedious and longer than HTML. Thankfully, there's a solution: PursX."""
                        )
                        /\ D.p []
                        ( S.text
                            """PursX takes its name from JSX and it accomplishes a similar goal: the ability to embed HTML in your document. In the example below, we create the same exact component from the previous article, but in PursX."""
                        )
                        /\
                          ( D.pre []
                              ( S.code []
                                  ( S.text $
                                      """module Deku.Example.Docs.Example.ComponentPursx where

import Prelude

import Data.Foldable (for_)
import Data.Tuple.Nested ((/\))
import Data.Vec ((+>), empty)
import Deku.Control.Functions (freeze, u, (@>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Graph.DOM ((:=), root)
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (class DOMInterpret, makeFFIDOMSnapshot)
import Deku.Pursx ((~!))
import Deku.Run (defaultOptions, run)
import Deku.Util (detup, vex)
import Effect (Effect)
import FRP.Event (subscribe)
import Type.Proxy (Proxy(..))
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
      ( u $ root elt $ (Proxy :: _ """ <> "\"\"\"" <> """
      <div>
        <button>I do nothing</button>
        <ul>
          <li>A</li>
          <li>B</li>
          <li>C</li>
        </ul>
        <div>
          <a href="https://github.com/mikesol/purescript-deku">foo</a>
          <i>bar</i>
          <span style="font-weight:800;">baz</span>
        </div>
        <div><div></div><div><input type="range"/></div></div>
      </div>
      """ <> "\"\"\"" <> """") ~! {}
      )
  ) @> freeze

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \elt -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      ( run (pure unit) (pure unit) defaultOptions ffi(scene elt)      )
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
                          ((Proxy :: _ """
      <div>
        <button>I do nothing</button>
        <ul>
          <li>A</li>
          <li>B</li>
          <li>C</li>
        </ul>
        <div>
          <a href="https://github.com/mikesol/purescript-deku"></a>
          <i>bar</i>
          <span style="font-weight:800;">baz</span>
        </div>
        <div><div></div><div><input type="range"/></div></div>
      </div>
      """) ~! {})
                        /\ D.h2 [] (S.text "Puurrrrrr ...sx")
                        /\ D.p []
                          ( detup $
                              D.text
                                """Pursx can be activated with the operators """
                                /\ D.code [] (S.text "~!")
                                /\ D.text
                                  """, which creates a one-off record, and """
                                /\ D.code [] (S.text "~~")
                                /\ D.text
                                  """for when you already have a record that you're embedding it in. It's also slightly faster than the JS layer, as it just sets the """
                                /\ D.code [] (S.text "innerHTML")
                                /\ D.text
                                  """ property of a node with the HTML. JavaScript parsers are blazingly fast at setting innerHTML these days, and you can achieve substantial performance gains this way, especially with larger documents. In a later section, we'll see how to modify our PursX and embed PureScript within it, just like we do with JSX."""
                                /\ unit
                          )
                        /\ D.h2 [] (S.text "Next steps")
                        /\ D.p []
                          ( S.span []
                                (detup $ D.text
                                    """In this section, we PursX to build the same component as the previous section. In the next section, we'll learn how to respond to """
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
                ) /\ unit)
            }
        }
  ) %> freeze
