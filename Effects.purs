module Deku.Example.Docs.Effects where

import Prelude

import Affjax as AX
import Affjax.ResponseFormat as ResponseFormat
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Data.HTTP.Method (Method(..))
import Data.Map (singleton)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Change (change)
import Deku.Control.Functions (freeze, u, (%>))
import Deku.Example.Docs.Types (DeviceType, Page(..))
import Deku.Example.Docs.Util (cot, scrollToTop)
import Deku.Graph.Attribute (Cb, cb)
import Deku.Graph.DOM (AsSubgraph(..), ResolvedSubgraphSig, SubgraphSig, myNameIs, subgraph, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Util (detup)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Type.Proxy (Proxy(..))

effects :: DeviceType -> (Page -> Effect Unit) -> ResolvedSubgraphSig Unit Unit
effects dt dpage =
  ( \_ _ -> u
      { head: D.div []
          { header: D.header []
              { title: D.h1 [] (S.text "Effects")
              , subtitle: D.h3 []
                  ( S.text
                      "Let's make a network call"
                  )
              }
          , pars: D.div []
              ( detup
                  $
                    D.p []
                      ( detup $
                          D.text
                            """This example is similar to the previous one in its design: """
                            /\ D.code [] (S.text "iloop")
                            /\ D.text
                              """ is called in response to an event. The difference is that the response isn't immediate. Instead, we wait for the result of a network call."""
                            /\ unit
                      )
                      /\
                        ( D.pre []
                            ( S.code []
                                ( S.text
                                    """module Deku.Example.Docs.Example.Effects where

import Prelude

import Affjax as AX
import Affjax.ResponseFormat as ResponseFormat
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Data.Foldable (for_)
import Data.HTTP.Method (Method(..))
import Data.Tuple.Nested ((/\))
import Deku.Change (change)
import Deku.Control.Functions ((@>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Graph.Attribute (Cb, cb)
import Deku.Graph.DOM (myNameIs', root, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (class DOMInterpret, makeFFIDOMSnapshot)
import Deku.Run (defaultOptions, run)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import FRP.Event (subscribe)
import Type.Proxy (Proxy(..))
import Web.DOM (Element)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

clickCb :: (Either Unit String -> Effect Unit) -> Cb
clickCb push = cb
  ( const do
      push (Left unit)
      launchAff_ $ do
        result <- AX.request
          ( AX.defaultRequest
              { url = "https://randomuser.me/api/"
              , method = Left GET
              , responseFormat = ResponseFormat.json
              }
          )
        case result of
          Left err -> liftEffect $ push
            $ Right
              ( "GET /api response failed to decode: " <>
                  AX.printError err
              )
          Right response -> liftEffect $ push $ Right $
            stringifyWithIndent 2 response.body
  )

scene
  :: forall env dom engine res
   . Monoid res
  => DOMInterpret dom engine
  => Element
  -> Scene env dom engine Frame0 (Either Unit String) res
scene elt =
  ( \_ push ->
      root elt
        ( { div1: D.div []
              { button: D.button
                  [ D.OnClick := clickCb push ]
                  (myNameIs' (Proxy :: _ "textToShow") (D.text "Click to get some random user data."))
              }
          , div2: D.div [ D.Style := "display: none;" ]
              (S.pre [] (S.code [] (S.text "")))
          }
        )
        /\ (push /\ false)
  ) @> \e (push /\ started) -> case e of
    Left _ -> pure (push /\ started)
    Right (Left _) ->
      change
        { "textToShow": "Loading..."
        , "root.div1.button":
            D.button'attr [ D.OnClick := cb (const $ pure unit) ]
        } $> (push /\ started)
    Right (Right str) ->
      when (not started)
        ( change
            { "root.div2": D.div'attr [ D.Style := "display: block;" ]
            }
        )
        *> change
          { "root.div2.pre.code.t": str
          , "textToShow":
              "Click to get some random user data."
          , "root.div1.button":
              D.button'attr [ D.OnClick := clickCb push ]
          }
        $> (push /\ true)

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
                            (AsSubgraph (sg dt))
                        }
                      /\ D.h2 [] (S.text "Arbitrary effects")
                      /\ D.p []
                        ( detup $
                            D.text
                              """Because all event listeners execute in the effect monad, you can do more or less whatever you want. Make a network call, run a monad transformer stack just for fun, play music using """
                              /\ D.code [] (S.text "purescript-wags")
                              /\ D.text
                                """. The sky's the limit!"""
                              /\ unit
                        )
                      /\ D.p []
                        ( detup $
                            D.text
                              """Another useful pattern when working with effects is to throttle input. For example, if we are making a network call, we may want to show a loading indicator and prevent additional network calls. This can be achieved by setting the callback to a no-op while the network call is executing, as shown in the example above."""
                              /\ unit
                        )
                      /\ D.h2 [] (S.text "Next steps")
                      /\ D.p []
                        ( detup $
                            D.span []
                              ( S.text
                                  """In more complicated apps, like this documentation, we'll want to split up our components into sub-components and create a way for them to communicate back and forth. In the next section, we'll see one way to do this via """
                              )
                              /\ D.a
                                [ cot dt $ cb
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
  ) %> freeze

clickCb :: (Either Unit String -> Effect Unit) -> Cb
clickCb push = cb
  ( const do
      push $ Left unit
      launchAff_ $ do
        result <- AX.request
          ( AX.defaultRequest
              { url = "https://randomuser.me/api/"
              , method = Left GET
              , responseFormat = ResponseFormat.json
              }
          )
        case result of
          Left err -> liftEffect $ push $ Right
            ( "GET /api response failed to decode: " <>
                AX.printError err
            )
          Right response -> liftEffect $ push $ Right $
            stringifyWithIndent 2 response.body
  )

sg :: DeviceType -> SubgraphSig Int Unit (Either Unit String)
sg dt _ =
  ( \_ push ->
      S.div []
        ( { div1: D.div []
              { button: myNameIs (Proxy :: Proxy "bttn") $ D.button
                  [ cot dt $ clickCb push ]
                  (D.myNameIs' (Proxy :: _ "textToShow") (D.text "Click to get some random user data."))
              }
          , div2: D.div [ D.Style := "display: none;" ]
              (S.pre [] (S.code [] (S.text "")))
          }
        ) /\ (push /\ false)
  ) %> \e (push /\ started) -> case e of
    Left _ -> pure (push /\ started)
    Right (Left _) ->
      change
        { "textToShow": "Loading..."
        , "bttn":
            D.button'attr [ cot dt $ cb (const $ pure unit) ]
        } $> (push /\ started)
    Right (Right str) ->
      when (not started)
        ( change
            { "div.div2": D.div'attr [ D.Style := "display: block;" ]
            }
        )
        *> change
          { "div.div2.pre.code.t": str
          , "textToShow":
              "Click to get some random user data."
          , "bttn":
              D.button'attr [ cot dt $ clickCb push ]
          }
        $> (push /\ true)