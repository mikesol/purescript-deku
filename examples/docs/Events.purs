module Deku.Example.Docs.Events where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (for_)
import Data.Map (singleton)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Change (ichange_)
import Deku.Control.Functions (freeze, iloop, (@!>))
import Deku.Create (icreate)
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Graph.Attribute (Cb(..))
import Deku.Graph.DOM (AsSubgraph(..), ResolvedSubgraphSig, SubgraphSig, subgraph, (:=))
import Deku.Graph.DOM (ResolvedSubgraphSig, SubgraphSig, subgraph, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Util (detup)
import Effect (Effect)
import Web.DOM.Element (fromEventTarget)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromElement, valueAsNumber)

events :: (Page -> Effect Unit) -> ResolvedSubgraphSig "head" Unit Unit
events dpage =
  ( \_ _ -> icreate
      { head: D.div []
          { header: D.header []
              { title: D.h1 [] (S.text "Events")
              , subtitle: D.h3 []
                  ( S.text
                      "Listening to the DOM"
                  )
              }
          , pars: D.div []
              ( detup
                  $
                    D.p []
                      ( S.text
                          """We'll spice up the previous example by adding an event listener to our button. When we do, Deku will keep track of how many times we clicked it. The same goes for a range slider, whose current value is displayed underneath it."""
                      )
                      /\
                        ( D.pre []
                            ( S.code []
                                ( S.text
                                    """module Deku.Example.Docs.Example.Events where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (for_)
import Deku.Change (ichange_)
import Deku.Control.Functions.Graph (iloop, (@!>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Create (icreate)
import Deku.Graph.Attribute (Cb(..))
import Deku.Graph.DOM ((:=), root)
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (class DOMInterpret, makeFFIDOMSnapshot)
import Deku.Run (defaultOptions, run)
import Effect (Effect)
import FRP.Event (subscribe)
import Web.DOM (Element)
import Web.DOM.Element (fromEventTarget)
import Web.Event.Event (target)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.HTMLInputElement (fromElement, valueAsNumber)
import Web.HTML.Window (document)

data UIEvents = ButtonClicked | SliderMoved Number

scene
  :: forall env dom engine res
   . Monoid res
  => DOMInterpret dom engine
  => Element
  -> Scene env dom engine Frame0 UIEvents res
scene elt =
  ( \_ push ->
      ( icreate $ root elt
          ( { div1: D.div []
                { button: D.button
                    [ D.OnClick :=
                        Cb (const $ push ButtonClicked)
                    ]
                    (S.text "Click")
                , count: D.div [] (S.text "Val: 0")
                }
            , div2: D.div []
                { slider: D.input
                    [ D.Xtype := "range"
                    , D.OnInput := Cb \e -> for_
                        ( target e
                            >>= fromEventTarget
                            >>= fromElement
                        )
                        ( valueAsNumber
                            >=> push <<< SliderMoved
                        )
                    ]
                    {}
                , val: D.div [] (S.text "Val: 50")
                }
            }
          )
      ) $> 0
  ) @!> iloop \e _ nclicks -> case e of
    Left _ -> pure nclicks
    Right ButtonClicked ->
      let
        c = nclicks + 1
      in
        ichange_
          { "root.div1.count.t": "Val: " <> show c
          , "root.div1.button.t":
              if mod c 2 == 0 then "Click" else "me"
          } $> c
    Right (SliderMoved n) ->
      ichange_
        { "root.div2.val.t": "Val: " <> show n
        } $> nclicks

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
                        { example: subgraph (singleton 0 (Just unit))
                            (AsSubgraph sg)
                        }
                      /\ D.h2 [] (S.text "Event handling")
                      /\ D.p []
                        ( detup $
                            D.text
                              """All DOM event handlers, like """
                              /\ D.code [] (S.text "OnClick")
                              /\ D.text
                                """ and """
                              /\ D.code [] (S.text "OnInput")
                              /\ D.text
                                """, can be set with a value of type """
                              /\ D.code [] (S.text "Cb")
                              /\ D.text
                                """. This type is a newtype around"""
                              /\ D.code [] (S.text "(Event -> Effect Unit)")
                              /\ D.text
                                """. In order to actually trigger the event, you'll use the"""
                              /\ D.code [] (S.text "push")
                              /\ D.text
                                """ function passed both to """
                              /\ D.code [] (S.text "istart")
                              /\ D.text
                                """ and """
                              /\ D.code [] (S.text "iloop")
                              /\ D.text
                                """. This function has a signature of """
                              /\ D.code [] (S.text "(push -> Effect Unit)")
                              /\ D.text
                                """, where """
                              /\ D.code [] (S.text "push")
                              /\ D.text
                                """is defined a per-component basis. Here, the type used is """
                              /\ D.code [] (S.text "UIEvents")
                              /\ D.text
                                """. Whenever a push happens, it goes to the """
                              /\ D.code [] (S.text "Right")
                              /\ D.text
                                """ of the first argument passed to  """
                              /\ D.code [] (S.text "iloop")
                              /\ D.text """. Let's delve into what """
                              /\ D.code [] (S.text "iloop")
                              /\ D.text """ is doing here."""
                              /\ unit
                        )
                      /\ D.h2 [] (S.text "Loop-de-loop")
                      /\ D.p []
                        ( detup $
                            D.text
                              """The """
                              /\ D.code []
                                ( S.text
                                    "iloop"
                                )
                              /\ D.text
                                """ function effectively fixes the nodes of the DOM while allowing their content to vary. This means that we'll no longer be able to add or remove nodes, but we can change them."""

                              /\ unit
                        )
                      /\ D.p []
                        ( detup $
                            D.text
                              """Changing is done with the function """
                              /\ D.code []
                                ( S.text
                                    "ichange_"
                                )
                              /\ D.text
                                """. """
                              /\ D.code []
                                ( S.text
                                    "ichange_"
                                )
                              /\ D.text
                                """ uses Barlow-style lenses to zoom into the DOM with surgical precision, changing only what needs to be changed. This is what keeps Deku so darn fast and why it is ideally suited to performance-critical webpages. Because it tracks the DOM at """
                              /\ D.i []
                                ( S.text
                                    "compile time"
                                )
                              /\ D.text
                                """, you always know what is and isn't present, which allows for one-off changes without re-rendering a bunch of elements. It's even faster than React, having a similar performance profile as Svelte while giving the full power of PureScript's functional language."""
                              /\ unit
                        )
                      /\ D.h2 [] (S.text "Arguments to our loop")
                      /\ D.p []
                        ( detup $
                            D.text
                              """The first argument to our loop is an """
                              /\ D.code [] (S.text "Either env push")
                              /\ D.text
                                """. We've already seen that"""
                              /\ D.code [] (S.text "push")
                              /\ D.text
                                """ in this example is"""
                              /\ D.code [] (S.text "UIEvents")
                              /\ D.text
                                """. We're not using """
                              /\ D.code [] (S.text "env")
                              /\ D.text
                                """ yet, but we will when we talk about subgraphs."""
                              /\ unit
                        )
                      /\ D.p []
                        ( detup $
                            D.text
                              """The second argument to our loop is the same push function that we got in the initial call to our function. The third argument is a custom accumulator. In our case, we use an """
                              /\ D.code [] (S.text "Int")
                              /\ D.text
                                """ to track the number of clicks. The accumulator must be returned as the value contained in the indexed monad if you are using the monadic syntax ("""
                              /\ D.code [] (S.text "icreate")
                              /\ D.text
                                ""","""
                              /\ D.code [] (S.text "ichange")
                              /\ D.text
                                """, etc)."""
                              /\ D.text
                                """ There is also a comonadic syntax, but it's a bit more verbose. Those versions, """
                              /\ D.code [] (S.text "create")
                              /\ D.text
                                """ and """
                              /\ D.code [] (S.text "change")
                              /\ D.text ",live in the files "
                              /\ D.code [] (S.text "Create.purs")
                              /\ D.text
                                """and"""
                              /\ D.code [] (S.text "Change.purs")
                              /\ D.text
                                "respectively if you want to see how their signatures differ."
                              /\ unit
                        )
                      /\ D.h2 [] (S.text "Next steps")
                      /\ D.p []
                        ( detup $
                            D.span []
                              ( S.text
                                  """In this section, saw how to react to events using the """
                              ) /\ D.code [] (S.text "iloop")
                              /\ D.text " function in combination with "
                              /\ D.code [] (S.text "ichange_")
                              /\ D.text
                                ". In the next section, we'll use a similar mechanism to deal with arbitrary "
                              /\ D.a
                                [ D.OnClick := Cb
                                    ( const $ dpage Effects *>
                                        scrollToTop
                                    )
                                , D.Style := "cursor:pointer;"
                                ]
                                (S.text "effects")
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

data UIEvents = ButtonClicked | SliderMoved Number
sg :: SubgraphSig Int "div" Unit UIEvents

sg _ =
  ( \_ push ->
      ( icreate $ S.div []
          ( { div1: D.div []
                { button: D.button
                    [ D.OnClick := Cb (const $ push ButtonClicked)
                    ]
                    (S.text "Click")
                , count: D.div [] (S.text "Val: 0")
                }
            , div2: D.div []
                { slider: D.input
                    [ D.Xtype := "range"
                    , D.OnInput := Cb \e -> for_
                        (target e >>= fromEventTarget >>= fromElement)
                        (valueAsNumber >=> push <<< SliderMoved)
                    ]
                    {}
                , val: D.div [] (S.text "Val: 50")
                }
            }
          )
      ) $> 0
  ) @!> iloop \e _ nclicks -> case e of
    Left _ -> pure nclicks
    Right ButtonClicked ->
      let
        c = nclicks + 1
      in
        ichange_
          { "div.div1.count.t": "Val: " <> show c
          , "div.div1.button.t":
              if mod c 2 == 0 then "Click" else "me"
          } $> c
    Right (SliderMoved n) -> ichange_ { "div.div2.val.t": "Val: " <> show n }
      $> nclicks