module Deku.Example.Docs.Example.Effects where

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
        { "root.div1.button.t": "Loading..."
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
          , "root.div1.button.t":
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
