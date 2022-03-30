module Deku.Examples.Docs.Examples.Effects where

import Prelude

import Affjax as AX
import Affjax.ResponseFormat as ResponseFormat
import Control.Alt ((<|>))
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Data.Filterable (compact, filterMap)
import Data.HTTP.Method (Method(..))
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute (Cb, cb, (:=))
import Deku.Control (flatten, text)
import Deku.DOM as D
import Deku.Toplevel ((🚀))
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import FRP.Event (mapAccum)

data UIAction = Initial | Loading | Result String

clickCb :: (UIAction -> Effect Unit) -> Cb
clickCb push = cb
  ( const do
      push Loading
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
            $ Result
              ( "GET /api response failed to decode: " <>
                  AX.printError err
              )
          Right response -> liftEffect $ push $ Result $
            stringifyWithIndent 2 response.body
  )

clickText = "Click to get some random user data." :: String

main :: Effect Unit
main = Initial 🚀 \push event ->
  let
    loadingOrResult = filterMap
      ( case _ of
          Loading -> Just $ Left unit
          Result s -> Just $ Right s
          _ -> Nothing
      )
      event
    loading = filterMap
      ( case _ of
          Left _ -> Just unit
          _ -> Nothing
      )
      loadingOrResult
    result = filterMap
      ( case _ of
          Right s -> Just s
          _ -> Nothing
      )
      loadingOrResult
  in
    flatten
      [ D.div_
          [ D.button (pure (D.OnClick := clickCb push))
              [ text
                  ( pure clickText
                      <|> (loading $> "Loading...")
                      <|> (result $> clickText)
                  )
              ]
          ]
      , D.div
          ( (pure (D.Style := "display: none;")) <|>
              ( compact
                  ( mapAccum
                      ( \_ b -> (b && false) /\
                          if b then Just unit else Nothing
                      )
                      result
                      true
                  ) $> (D.Style := "display: block;")
              )
          )
          [ D.pre_ [ D.code_ [ text (pure "" <|> result) ] ] ]
      ]
