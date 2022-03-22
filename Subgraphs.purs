module Deku.Example.Docs.Subgraphs where

import Prelude

import Data.Either (Either(..))
import Data.Map (singleton)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Change (ichange)
import Deku.Control.Functions (freeze, iloop, (@!>))
import Deku.Create (icreate)
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM (AsSubgraph(..), ResolvedSubgraphSig, SubgraphSig, subgraph, xsubgraph, (:=))
import Deku.Graph.DOM (ResolvedSubgraphSig, SubgraphSig, subgraph, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Util (detup)
import Effect (Effect)

import Data.Hashable (class Hashable, hash)
import Data.Map (insert, singleton)
import Data.Tuple (fst, snd)
import Deku.Control.Functions (iloop, (@!>))
import Deku.Graph.DOM (AsSubgraph(..), ResolvedSubgraphSig, SubgraphSig, subgraph, xsubgraph, (:=))

data Sgs = Sg0 | Sg1
derive instance Eq Sgs
derive instance Ord Sgs
instance Show Sgs where
  show Sg0 = "Sg0"
  show Sg1 = "Sg1"
instance Hashable Sgs where
  hash = show >>> hash

sub :: (Sgs -> Effect Unit) -> SubgraphSig Sgs "div" Unit Unit
sub raise Sg0 =
  ( \_ push ->
      ( icreate $ S.div []
          ( { div1: D.div []
                { button0: D.button
                    [ D.OnClick := cb (const $ raise Sg0)
                    ]
                    (S.text "Send to B")
                , count0: D.div [] (S.text ("A: 0"))
                , button1: D.button
                    [ D.OnClick := cb (const $ push unit)
                    ]
                    (S.text "Send to C")
                , count1: D.div [] (S.text ("C: 0"))
                }
            , hr: D.hr [] {}
            }
          )
      ) $> (0 /\ 0)
  ) @!> iloop \e _ (a /\ c) -> case e of
    Left _ ->
      let
        new = (a + 1) /\ c
      in
        ichange
          { "div.div1.count0.t": "A: " <> show (fst new)
          } $> new
    Right _ ->
      let
        new = a /\ (c + 1)
      in
        ichange
          { "div.div1.count1.t": "C: " <> show (snd new)
          } $> new
sub raise Sg1 =
  ( \_ push ->
      ( icreate $ S.div []
          ( { div1: D.div []
                { button0: D.a
                    [ D.OnClick := cb (const $ raise Sg1)
                    , D.Style := "cursor:pointer;"

                    ]
                    (S.text "Send to A")
                , count0: D.div [] (S.text "B: 0")
                , button1: D.a
                    [ D.OnClick := cb (const $ push unit)
                    , D.Style := "cursor:pointer;"

                    ]
                    (S.text "Send to D")
                , count1: D.div [] (S.text "D: 0")
                }
            }
          )
      ) $> (0 /\ 0)
  ) @!> iloop \e _ (b /\ d) -> case e of
    Left _ ->
      let
        new = (b + 1) /\ d
      in
        ichange
          { "div.div1.count0.t": "B: " <> show (fst new)
          } $> new
    Right _ ->
      let
        new = b /\ (d + 1)
      in
        ichange
          { "div.div1.count1.t": "D: " <> show (snd new)
          } $> new

sg :: SubgraphSig Int "div" Unit Sgs
sg _ =
  ( \_ push ->
      ( icreate $ S.div []
          { sub:
              D.subgraph
                ( insert Sg0 (pure unit)
                    $ singleton Sg1 (pure unit)
                )
                (AsSubgraph (sub push))
          }

      )
  ) @!> iloop \e _ _ -> case e of
    Left _ -> pure unit
    Right Sg0 -> ichange
      { "div.sub": xsubgraph (singleton Sg1 (pure unit))
      }
    Right Sg1 -> ichange
      { "div.sub": xsubgraph (singleton Sg0 (pure unit))
      }

subgraphs :: (Page -> Effect Unit) -> ResolvedSubgraphSig "head" Unit Unit
subgraphs dpage =
  ( \_ _ -> icreate
      { head: D.div []
          { header: D.header []
              { title: D.h1 [] (S.text "Subgraphs")
              , subtitle: D.h3 []
                  ( S.text
                      "Inter-component communication"
                  )
              }
          , pars: D.div []
              ( detup
                  $
                    D.p []
                      ( detup $
                          D.text
                            """As your app gets larger, you'll want to split up your code into logical components. Besides making the code easier to work with, in Deku, this allows us to change child components on the fly without changing the type of the parent graph. We call these """
                            /\ D.span [ D.Style := "font-weight: 800;" ]
                              (S.text "subgraphs")
                            /\ D.text "."
                            /\ unit
                      )
                      /\ D.p []
                        ( detup $
                            D.text
                              """In the code below, two subgraphs are divided by a horizontal line. They communicate with each other via message passing, and they also have internal messaging."""
                              /\ unit
                        )
                      /\
                        ( D.pre []
                            ( S.code []
                                ( S.text
                                    """module Deku.Example.Docs.Example.Subgraph where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (for_)
import Data.Hashable (class Hashable, hash)
import Data.Map (insert, singleton)
import Data.Tuple (fst, snd)
import Data.Tuple.Nested ((/\))
import Deku.Change (ichange)
import Deku.Control.Functions (iloop, (@!>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Create (icreate)
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM (AsSubgraph(..), SubgraphSig, root, xsubgraph, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (class DOMInterpret, makeFFIDOMSnapshot)
import Deku.Run (defaultOptions, run)
import Effect (Effect)
import FRP.Event (subscribe)
import Web.DOM (Element)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

data Sgs = Sg0 | Sg1
derive instance Eq Sgs
derive instance Ord Sgs
instance Show Sgs where
  show Sg0 = "Sg0"
  show Sg1 = "Sg1"
instance Hashable Sgs where
  hash = show >>> hash

sub :: (Sgs -> Effect Unit) -> SubgraphSig Sgs "div" Unit Unit
sub raise Sg0 =
  ( \_ push ->
      ( icreate $ S.div []
          ( { div1: D.div []
                { button0: D.button
                    [ D.OnClick := cb (const $ raise Sg0)
                    ]
                    (S.text "Send to B")
                , count0: D.div [] (S.text ("A: 0"))
                , button1: D.button
                    [ D.OnClick := cb (const $ push unit)
                    ]
                    (S.text "Send to C")
                , count1: D.div [] (S.text ("C: 0"))
                }
            , hr: D.hr [] {}
            }
          )
      ) $> (0 /\ 0)
  ) @!> iloop \e _ (a /\ c) -> case e of
    Left _ ->
      let
        new = (a + 1) /\ c
      in
        ichange
          { "div.div1.count0.t": "A: " <> show (fst new)
          } $> new
    Right _ ->
      let
        new = a /\ (c + 1)
      in
        ichange
          { "div.div1.count1.t": "C: " <> show (snd new)
          } $> new
sub raise Sg1 =
  ( \_ push ->
      ( icreate $ S.div []
          ( { div1: D.div []
                { button0: D.a
                    [ D.OnClick := cb (const $ raise Sg1)
                    , D.Style := "cursor:pointer;"

                    ]
                    (S.text "Send to A")
                , count0: D.div [] (S.text "B: 0")
                , button1: D.a
                    [ D.OnClick := cb (const $ push unit)
                    , D.Style := "cursor:pointer;"

                    ]
                    (S.text "Send to D")
                , count1: D.div [] (S.text "D: 0")
                }
            }
          )
      ) $> (0 /\ 0)
  ) @!> iloop \e _ (b /\ d) -> case e of
    Left _ ->
      let
        new = (b + 1) /\ d
      in
        ichange
          { "div.div1.count0.t": "B: " <> show (fst new)
          } $> new
    Right _ ->
      let
        new = b /\ (d + 1)
      in
        ichange
          { "div.div1.count1.t": "D: " <> show (snd new)
          } $> new

scene
  :: forall env dom engine res
   . Monoid res
  => DOMInterpret dom engine
  => Element
  -> Scene env dom engine Frame0 Sgs res
scene elt =
  ( \_ push ->
      ( icreate $ root elt
          { sub:
              D.subgraph
                ( insert Sg0 (pure unit)
                    $ singleton Sg1 (pure unit)
                )
                (AsSubgraph (sub push))
          }

      )
  ) @!> iloop \e _ _ -> case e of
    Left _ -> pure unit
    Right Sg0 -> ichange
      { "root.sub": xsubgraph (singleton Sg1 (pure unit))
      }
    Right Sg1 -> ichange
      { "root.sub": xsubgraph (singleton Sg0 (pure unit))
      }

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
                      /\ D.h2 [] (S.text "Why subgraphs are fast")
                      /\ D.p []
                        ( detup $ D.text "In the "
                            /\ D.a
                              [ D.OnClick := cb
                                  ( const $ dpage Events *>
                                      scrollToTop
                                  )
                              , D.Style := "cursor:pointer;"
                              ]
                              (S.text "events")
                            /\ D.text
                              " section, we saw how Deku stays fast by using the PureScript compiler to keep track of which components needs to be rendered and which components don't. The same is true for subgraphs. Because they use a bi-drectional messaging channel that is decoupled from the rendering process, they can transmit information to each other very fast without ever triggering a render. This is especially helpful if you're working with realtime animation or audio."
                            /\ unit
                        )
                      /\ D.p []
                        ( S.text
                            "In the following sections, we'll look at the anatomy of a subgraph as well as the bi-drectional communication mechanism they use."
                        )
                      /\ D.h2 [] (S.text "Subgraph anatomy")
                      /\ D.p []
                        ( detup $
                            D.text
                              """Subgraphs are not unlike the root components we've been working with all along. There's only one important difference to be aware of: subgraphs receive an extra argument by which they are indexed. In the example above, the subgraphs are indexed by the type """
                              /\ D.code [] (S.text "Sgs")
                              /\ D.text
                                """. This documentation works the same way: the pages are indexed by a type called """
                              /\ D.code [] (S.text "Page")
                              /\ D.text
                                """. Each index can potentially yield a different subgraph. The only other caveat is that, unlike root components, subgraphs may """
                              /\ D.span [ D.Style := "font-weight: 800;" ]
                                (S.text "not")
                              /\ D.text
                                """ use the root component in their graph. Doing this will fail at compile time. Other than that, subgraphs are exactly the same as graphs: each one is its own stream of DOMs that is constructed using primitives like """
                              /\ D.code [] (S.text "@!>")
                              /\ D.text
                                """ and """
                              /\ D.code [] (S.text "iloop")
                              /\ D.text
                                """."""
                              /\ unit
                        )
                      /\ D.h2 [] (S.text "Bubbling information up")
                      /\ D.p []
                        ( detup $
                            D.text
                              """The way that you can bubble information up from a subgraph is the exact same way you work with events: by taking the argument with the signature"""
                              /\ D.code []
                                ( S.text
                                    "(push -> Effect Unit)"
                                )
                              /\ D.text
                                """ and passing it to a subgraph. When a handler in the subgraph calls it, the message is guaranteed to bubble up to the parent. If the parent is unmounted (ie if the subgraph triggers a long-running uncancellable task that terminates after the parent has been destroyed), the push to it will simply be a no-op. A pusher can be passed down through many layers of subgraphs, making communication from a deeply-nested subgraph to the top-level very fast. Plus, this does not trigger a render unless the receiving component asks for one."""

                              /\ unit
                        )
                      /\ D.p []
                        ( detup $
                            D.text
                              """In the example above, this is done via the first argument to the """
                              /\ D.code []
                                ( S.text
                                    "sub"
                                )
                              /\ D.text
                                """ function. The argument's name is """
                              /\ D.code []
                                ( S.text
                                    "raise"
                                )
                              /\ D.text
                                """. The term """
                              /\ D.i []
                                ( S.text
                                    "raise"
                                )
                              /\ D.text
                                """ is borrowed from Halogen and it serves the same purpose, except that unlike in Halogen, the message can jump an arbitrary number of levels in one fell swoop instead of stepping through each level of the heirarchy."""
                              /\ unit
                        )
                      /\ D.h2 [] (S.text "Top-down communication")
                      /\ D.p []
                        ( detup $
                            D.text
                              """The same method of passing the """
                              /\ D.code [] (S.text "push")
                              /\ D.text
                                """ argument can be used for top-down communication. A subgraph can push its own push argument to the pusher it receives, and the top-level can then hold onto it and use it for fast communication with a deeply-nested object. This allows for apps to create ad-hoc event busses, which in some performance-critical situations is often the fastest way for components to communicate with each other"""
                              /\ unit
                        )
                      /\ D.p []
                        ( detup $
                            D.text
                              """There is one major drawback, however, to top-down communication via a pusher. It's fairly rare that a subgraph will launch a task that completes after its parent has unmounted. These tend to be harmless no-ops that, in the worst case, translate into a slight performance degradation. Parents, on the other hand, will often exist much longer than their children. This means that they will have to keep track of what subgraphs are present on the page, which adds complicated internal accounting and is prone to errors."""
                              /\ unit
                        )
                      /\
                        ( D.p []
                            ( detup $
                                D.text
                                  "A better method, though slightly less efficient, is to use the "
                                  /\ D.code []
                                    ( S.text
                                        "env"
                                    )
                                  /\ D.text
                                    """ parameter. The """
                                  /\ D.code []
                                    ( S.text
                                        "env"
                                    )
                                  /\ D.text
                                    """ is contained in the """
                                  /\ D.code []
                                    ( S.text
                                        "Map"
                                    )
                                  /\ D.text
                                    """ passed as the first argument to """
                                  /\ D.code []
                                    ( S.text
                                        "subgraph"
                                    )
                                  /\ D.text
                                    """ and as the first argument to """
                                  /\ D.code []
                                    ( S.text
                                        "xsubgraph"
                                    )
                                  /\ D.text
                                    """ as well. Whenever an """
                                  /\ D.code []
                                    ( S.text
                                        "env"
                                    )
                                  /\ D.text
                                    """ is present and set to """
                                  /\ D.code []
                                    ( S.text
                                        "Just"
                                    )
                                  /\ D.text
                                    """ for a given key for the map, it will request one iteration of the loop from the subgraph. This is the """
                                  /\ D.code []
                                    ( S.text
                                        "Left"
                                    )
                                  /\ D.text
                                    """ argument to """
                                  /\ D.code []
                                    ( S.text
                                        "iloop"
                                    )
                                  /\ D.text
                                    """ that we have thusfar ignored but now use in the example above. If the subgraph does not exist yet, it will be created. Inversely, sending """
                                  /\ D.code []
                                    ( S.text
                                        "Nothing"
                                    )
                                  /\ D.text
                                    """ to a key in the map will destroy that subgraph if it exists and otherwise be a no-op."""
                                  /\ unit
                            )
                        )
                      /\
                        ( D.p []
                            ( detup $ D.text "While the use of "
                                /\ D.code [] (S.text "env")
                                /\ D.text
                                  " is slightly less efficient than the use of "
                                /\ D.code [] (S.text "push")
                                /\ D.text
                                  "because each layer needs to send the message down successively, it does not cause the DOM to update unless explicitly asked in "
                                /\ D.code [] (S.text "iloop")
                                /\ D.text
                                  ". This means that it is still quite fast."
                                /\ unit
                            )
                        )
                      /\
                        ( D.p []
                            ( detup $
                                D.text
                                  "The dynamic allocation mechanism for subgraphs makes them ideal for structures like lists. Furthermore, because HTML5 enforces excellent separation of content and layout via the CSS Grid, it is possible to have a single subgraph occupy entirely different parts of a webpage. Lastly, because each subgraph lives its own life upon creation, they can evolve to contain radically different content. They can even call themselves recursively, making them suitable for markdown parsers and other recursive structures."
                                  /\ unit
                            )
                        )
                      /\ D.h2 [] (S.text "Next steps")
                      /\ D.p []
                        ( S.span []
                            ( detup $
                                D.text
                                  "In addition to webpage rendering, Deku supports basic server-side rendering capabilities. Let's see how in the "
                                  /\ D.a
                                    [ D.OnClick := cb
                                        ( const $ dpage SSR *>
                                            scrollToTop
                                        )
                                    , D.Style := "cursor:pointer;"
                                    ]
                                    (S.text "SSR section")
                                  /\ D.span [] (S.text ".")
                                  /\ unit
                            )
                        )
                      /\ unit
              )
          }
      }
  ) @!> freeze
