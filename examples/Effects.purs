module Deku.Example.Docs.Example.Effects where

import Prelude

import Affjax as AX
import Affjax.ResponseFormat as ResponseFormat
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Data.HTTP.Method (Method(..))
import Data.Tuple.Nested ((/\))
import Deku.Change (change)
import Deku.Graph.Attribute (Cb, cb)
import Deku.Graph.DOM ((:=), (@~))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Toplevel (io)
import Deku.Util (p)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)

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

main :: Effect Unit
main = io
  { i: \push ->
      { div1: D.div []
          ( (p :: _ "bttn") @~ D.button
              [ D.OnClick := clickCb push ]
              ( (p :: _ "textToShow") @~
                  (D.text "Click to get some random user data.")
              )
          )
      , div2: D.div [ D.Style := "display: none;" ]
          (S.pre [] (S.code [] (S.text "")))
      } /\ (push /\ false)
  , o: \e (push /\ started) -> case e of
      Left _ ->
        change
          { textToShow: "Loading..."
          , bttn:
              D.button'attr [ D.OnClick := cb (const $ pure unit) ]
          } $> (push /\ started)
      Right str ->
        when (not started)
          ( change
              { "root.div2":
                  D.div'attr [ D.Style := "display: block;" ]
              }
          )
          *> change
            { "root.div2.pre.code.t": str
            , textToShow:
                "Click to get some random user data."
            , bttn:
                D.button'attr [ D.OnClick := clickCb push ]
            }
          $> (push /\ true)
  }