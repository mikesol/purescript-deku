module Deku.Example.Docs.Effects where

import Prelude

import Affjax.ResponseFormat as ResponseFormat
import Affjax.Web as AX
import Control.Alt ((<|>))
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Data.Filterable (filterMap, compact)
import Data.HTTP.Method (Method(..))
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute (Cb, cb, (:=))
import Deku.Control (text, text_)
import Deku.Core (Domable, Element, bussed)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Pursx (nut, (~~))
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import FRP.Event (mapAccum, bang, bus)
import Type.Proxy (Proxy(..))

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

px =
  Proxy    :: Proxy      """<div>
  <h1>Effects</h1>

  <h2>Let's make a network call</h2>
  <p>
    This example is similar to the previous one in its design: the looping function is called in response to an event. The difference is that the response isn't immediate. Instead, we wait for the result of a network call.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Arbitrary effects</h2>
  <p>Because all event listeners execute in the <code>Effect</code> monad, you can do more or less whatever you want. Make a network call, run a monad transformer stack just for fun, play music using <a href="https://github.com/mikesol/purescript-wags">purescript-wags</a>. The sky's the limit!</p>

  <p>Another useful pattern when working with effects is to throttle input. For example, if we are making a network call, we may want to show a loading indicator and prevent additional network calls. This can be achieved by setting the callback to a no-op while the network call is executing, as shown in the example above.</p>

  <h2>Next steps</h2>
  <p>It is also possible to handle events (and by extension effectful actions in events, like network calls) in Pursx. Let's see how in the <a ~next~ style="cursor:pointer;">second Pursx section</a>.</p>
</div>"""

effects :: forall lock payload. (Page -> Effect Unit) -> Domable Effect lock payload
effects dpage = px ~~
  { code: nut
      ( D.pre_
          [ D.code_
              [ text_
                  """module Main where

import Prelude

import Affjax as AX
import Affjax.ResponseFormat as ResponseFormat
import Control.Alt ((<|>))
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Data.Filterable (compact, filterMap)
import Data.HTTP.Method (Method(..))
import Data.Maybe (Maybe(..))
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (Cb, cb, (:=))
import Deku.Control (plant, text)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import FRP.Event (keepLatest, mapAccum, bus, bang)

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
main = runInBody
  ( keepLatest $ bus \push -> lcmap (bang Initial <|> _)
      \event ->
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
          plant
            [ D.div_
                [ D.button (bang (D.OnClick := clickCb push))
                    [ text
                        ( bang clickText
                            <|> (loading $> "Loading...")
                            <|> (result $> clickText)
                        )
                    ]
                ]
            , D.div
                ( (bang (D.Style := "display: none;")) <|>
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
                [ D.pre_ [ D.code_ [ text (bang "" <|> result) ] ] ]
            ]
  )
"""
              ]
          ]
      )
  , result: nut
      ( bussed \push event -> do
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
          D.div_
              [ D.div_
                  [ D.button (bang (D.OnClick := clickCb push))
                      [ text
                          ( bang clickText
                              <|> (loading $> "Loading...")
                              <|> (result $> clickText)
                          )
                      ]
                  ]
              , D.div
                  ( (bang (D.Style := "display: none;")) <|>
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
                  [ D.pre_ [ D.code_ [ text (bang "" <|> result) ] ] ]
              ]
      )
  , next: bang (D.OnClick := (cb (const $ dpage PURSX2 *> scrollToTop)))
  }