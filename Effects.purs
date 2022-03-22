module Deku.Example.Docs.Effects where

import Prelude

import Data.Either (Either(..))
import Affjax as AX
import Affjax.ResponseFormat as ResponseFormat
import Data.Argonaut.Core (stringifyWithIndent)
import Data.HTTP.Method (Method(..))
import Deku.Change (ichange_)
import Deku.Create (icreate)
import Deku.Graph.Attribute (Cb, cb)
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Data.Map (singleton)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Control.Functions (freeze, iloop, (@!>))
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Graph.DOM (AsSubgraph(..), ResolvedSubgraphSig, SubgraphSig, subgraph, (:=), ResolvedSubgraphSig, SubgraphSig, subgraph, (:=))
import Deku.Util (detup)

effects :: (Page -> Effect Unit) -> ResolvedSubgraphSig "head" Unit Unit
effects dpage =
  ( \_ _ -> icreate
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
import Deku.Change (ichange_)
import Deku.Control.Functions.Graph (iloop, (@!>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Create (icreate)
import Deku.Graph.Attribute (Cb, cb)
import Deku.Graph.DOM ((:=), root)
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (class DOMInterpret, makeFFIDOMSnapshot)
import Deku.Run (defaultOptions, run)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import FRP.Event (subscribe)
import Web.DOM (Element)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

clickCb :: (String -> Effect Unit) -> Cb
clickCb push = cb
  ( const do
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
            ( "GET /api response failed to decode: " <>
                AX.printError err
            )
          Right response -> liftEffect $ push $
            stringifyWithIndent 2 response.body
  )

scene
  :: forall env dom engine res
   . Monoid res
  => DOMInterpret dom engine
  => Element
  -> Scene env dom engine Frame0 String res
scene elt =
  ( \_ push ->
      ( icreate $ root elt
          ( { div1: D.div []
                { button: D.button
                    [ D.OnClick := clickCb push ]
                    (S.text "Click to get some random user data.")
                }
            , div2: D.div [D.Style := "display: none;"]
                (S.pre [] (S.code [] (S.text "")))
            }
          )
      ) $> false
  ) @!> iloop \e _ started -> case e of
    Left _ -> pure true
    Right str ->
      when (not started)
        ( ichange_
            { "root.div2": D.div'attr [D.Style := "display: block;"]
            }
        )
        *> ichange_
          { "root.div2.pre.code.t": str
          }
        $> true

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
                      /\ D.h2 [] (S.text "Next steps")
                      /\ D.p []
                        ( detup $
                            D.span []
                              ( S.text
                                  """In more complicated apps, like this documentation, we'll want to split up our components into sub-components and create a way for them to communicate back and forth. In the next section, we'll see one way to do this via """
                              )
                              /\ D.a
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
  ) @!> freeze

clickCb :: (String -> Effect Unit) -> Cb
clickCb push = cb
  ( const do
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
            ( "GET /api response failed to decode: " <>
                AX.printError err
            )
          Right response -> liftEffect $ push $
            stringifyWithIndent 2 response.body
  )

sg :: SubgraphSig Int "div" Unit String
sg _ =
  ( \_ push ->
      ( icreate
          ( S.div []
              ( { div1: D.div []
                    { button: D.button
                        [ D.OnClick := clickCb push ]
                        (S.text "Click to get some random user data.")
                    }
                , div2: D.div [ D.Style := "display: none;" ]
                    (S.pre [] (S.code [] (S.text "")))
                }
              )
          )
      ) $> false
  ) @!> iloop \e _ started -> case e of
    Left _ -> pure true
    Right str ->
      when (not started)
        ( ichange_
            { "div.div2": D.div'attr [ D.Style := "display: block;" ]
            }
        )
        *> ichange_
          { "div.div2.pre.code.t": str
          }
        $> true