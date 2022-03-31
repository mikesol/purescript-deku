module Deku.Example.Docs.Effects where

import Prelude

import Affjax as AX
import Affjax.ResponseFormat as ResponseFormat
import Control.Alt ((<|>))
import Control.Plus (class Plus)
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..), hush)
import Data.Filterable (filterMap, compact)
import Data.HTTP.Method (Method(..))
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute (Cb, cb, (:=))
import Deku.Control (flatten, text_, text)
import Deku.Core (Element)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Pursx (nut, (~~))
import Deku.Subgraph (SubgraphAction(..), (@@))
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import FRP.Event (class IsEvent, mapAccum)
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

px = Proxy :: Proxy """<div>
  <h1>Effects</h1>

  <h2>Let's make a network call</h2>
  <p>
    This example is similar to the previous one in its design: the looping function is called in response to an event. The difference is that the response isn't immediate. Instead, we wait for the result of a network call.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Arbitrary effects</h2>
  <p>Because all event listeners execute in the effect monad, you can do more or less whatever you want. Make a network call, run a monad transformer stack just for fun, play music using purescript-wags. The sky's the limit!</p>

  <p>Another useful pattern when working with effects is to throttle input. For example, if we are making a network call, we may want to show a loading indicator and prevent additional network calls. This can be achieved by setting the callback to a no-op while the network call is executing, as shown in the example above.</p>

  <h2>Next steps</h2>
  <p>It is also possible to handle events (and by extension effectful actions in events, like network calls) in Pursx. Let's see how in the <a ~next~ style="cursor:pointer;">second Pursx section</a>.</p>
</div>"""

effects :: forall event payload. IsEvent event => Plus event => (Page -> Effect Unit) -> Element event payload
effects dpage  = px ~~
  { code: nut (D.pre_ [D.code_ [text_ """module Main where

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
"""]])
  , result: nut
      ( pure (unit /\ InsertOrUpdate unit) @@ \_ push event' ->
          let
            event = compact (map hush event')
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
              ])
  , next: pure (D.OnClick := (cb (const $ dpage Effects *> scrollToTop)))
  }