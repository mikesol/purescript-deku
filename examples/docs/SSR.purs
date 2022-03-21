module Deku.Example.Docs.SSR where

import Prelude

import Data.Either (Either(..))
import Data.Maybe (maybe)
import Data.Tuple.Nested ((/\))
import Deku.Control.Functions (freeze, (@!>))
import Deku.Control.Types (Frame0, Scene, oneFrame)
import Deku.Create (icreate)
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Graph.Attribute (Cb(..))
import Deku.Graph.DOM (ResolvedSubgraphSig, root, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (class DOMInterpret)
import Deku.SSR (ssr, toXML)
import Deku.Util (detup)
import Effect (Effect)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM (Element)

scene
  :: forall env dom engine push
   . DOMInterpret dom engine
  => Int -> Element
  -> Scene env dom engine Frame0 push Unit
scene i elt =
  ( \_ _ ->
      ( icreate $ root elt
          ( detup $ D.p [] (S.text "Here is some XML!")
              /\ D.pre []
                ( S.code []
                    ( S.text  if i > 3 then "<stack-overflow />" else
                        ( maybe "" toXML
                            ( ssr
                                ( map ((#) unit)
                                    ( oneFrame
                                        (scene (i + 1) elt)
                                        (Left unit)
                                        (const $ pure unit)
                                    ).instructions
                                )
                            )
                        )
                    )
                )
              /\ unit
          )
      )
  ) @!> freeze
serverSide :: (Page -> Effect Unit) -> ResolvedSubgraphSig "head" Unit Unit
serverSide dpage =
  ( \_ _ -> icreate
      { head: D.div []
          { header: D.header []
              { title: D.h1 [] (S.text "SSR")
              , subtitle: D.h3 []
                  ( S.text
                      "For faster loads"
                  )
              }
          , pars: D.div []
              ( detup
                  $
                    D.p []
                      ( S.text
                          """Server side rendering is a technique where you ship your initial render to the client as HTML. This speeds up page loading."""
                      )
                      /\ D.p []
                        ( S.text
                            """Deku supports rendering arbitrary graphs as XML, which can be used to construct an HTML-only page to send to the client. Then, once the JavaScript is finished loading and executed, it can replace the pre-rendered page."""
                        )
                      /\ D.p []
                        ( S.text
                            """The example below is quite Inception-y: it does SSR on... itself!"""
                        )
                      /\
                        ( D.pre []
                            ( S.code []
                                ( S.text
                                    """module Deku.Example.Docs.Example.SSR where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (for_)
import Data.Maybe (maybe)
import Data.Tuple.Nested ((/\))
import Deku.Control.Functions.Graph (freeze, (@!>))
import Deku.Control.Types (Frame0, Scene, oneFrame)
import Deku.Create (icreate)
import Deku.Graph.DOM (root)
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (class DOMInterpret, makeFFIDOMSnapshot)
import Deku.Run (defaultOptions, run)
import Deku.SSR (ssr, toXML)
import Deku.Util (detup)
import Effect (Effect)
import FRP.Event (subscribe)
import Web.DOM (Element)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

scene
  :: forall env dom engine push
   . DOMInterpret dom engine
  => Int
  -> Element
  -> Scene env dom engine Frame0 push Unit
scene i elt =
  ( \_ _ ->
      ( icreate $ root elt
          ( detup $ D.p [] (S.text "Here is some XML!") /\ D.pre []
              ( S.code []
                  ( S.text $ if i > 3 then "<stack-overflow />" else
                      ( maybe "" toXML
                          ( ssr
                              ( map ((#) unit)
                                  ( oneFrame
                                      (scene (i+1) elt)
                                      (Left unit)
                                      (const $ pure unit)
                                  ).instructions
                              )
                          )
                      )
                  )
              ) /\ unit
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
          (scene 0 elt)

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
                        ( detup $ D.p [] (S.text "Here is some XML!")
                            /\ D.pre []
                              ( S.code []
                                  ( S.text
                                      ( maybe "" toXML
                                          ( ssr
                                              ( map ((#) unit)
                                                  ( oneFrame
                                                      ( scene 0
                                                          (unsafeCoerce  unit)
                                                      )
                                                      (Left unit)
                                                      (const $ pure unit)
                                                  ).instructions
                                              )
                                          )
                                      )
                                  )
                              )
                            /\ unit
                        )
                      /\ D.h2 [] (S.text "Parting shot")
                      /\ D.p []
                        ( S.text
                            """Thanks for checking out Deku. I wrote most of it during a coding binge in March 2022, so it's still a bit rough around the edges, but it gest the job done for me in a couple performance-critical where I need the DOM rendering to be faaasssstttt. I've grown quite fond of it, and I hope you get the chance to work your way through this documentation while building your first of many Deku webapps!"""
                        )
                      /\ unit
              )
          }
      }
  ) @!> freeze
