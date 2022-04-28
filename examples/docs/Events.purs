module Deku.Example.Docs.Events where

import Prelude

import Control.Alt ((<|>))
import Data.Foldable (for_, oneOfMap)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (blank, plant, text, text_)
import Deku.Core (Element)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Pursx (nut, (~~))
import Effect (Effect)
import FRP.Event (bang, mapAccum)
import FRP.Event.VBus (V, vbus)
import Type.Proxy (Proxy(..))
import Web.DOM.Element (fromEventTarget)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromElement, valueAsNumber)


type UIEvents = V
  ( uiShow :: Unit
  , buttonClicked :: Unit
  , sliderMoved :: Number
  )

px =
  Proxy    :: Proxy      """<div>
  <h1>Events</h1>

  <h2>Listening to the DOM</h2>
  <p>
    We'll spice up the previous example by adding an event listener to our button. When we do, Deku will keep track of how many times we clicked it. The same goes for a range slider, whose current value is displayed underneath it.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Event handling</h2>
  <p>All DOM event handlers, like <code>OnClick</code> and <code>OnInput</code>, can be set with a value of type <code>Cb</code>. This type is a <code>newtype</code> around <code>(Event -> Effect Boolean)</code>. To hook the event up to the Deku event bus, you can use the <code>push</code> function within the event handler. The push function has a signature of <code>(push -> Effect Unit)</code>. Here, the type one can push in to <code>push</code> is UIEvents. Whenever a push happens, our <code>Event</code> receives it and all attributes are updated accordingly.</p>

  <h2>Next steps</h2>
  <p>In this section, saw how to react to events. In the next section, we'll use a similar mechanism to deal with arbitrary <a ~next~ style="cursor:pointer;">effects</a>.</p>
</div>"""

events :: forall lock payload. (Page -> Effect Unit) -> Element lock payload
events dpage = px ~~
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
import FRP.Event (bang, bus, mapAccum)

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
  ( plant $ bus \push -> lcmap (bang Initial <|> _)
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
  , result: nut( vbus (Proxy :: _ UIEvents) \push event -> plant do
      D.div_
        [ D.button
            (bang (D.OnClick := cb (const $ push.buttonClicked unit)))
            [ text_ "Click" ]
        , D.div_
            [ text
                ( (bang "Val: 0") <|>
                    ( mapAccum (const $ \x -> (x + 1) /\ x)
                        (bang unit <|> event.buttonClicked)
                        0
                        # map (append "Val: " <<< show)
                    )
                )
            ]
        , D.div_
            [ D.input
                ( oneOfMap bang
                    [ D.Xtype := "range"
                    , D.OnInput := cb \e -> for_
                        ( target e
                            >>= fromEventTarget
                            >>= fromElement
                        )
                        ( valueAsNumber
                            >=> push.sliderMoved
                        )
                    ]
                )
                blank
            , D.div_
                [ text
                    ( (bang "Val: 50") <|>
                        ( (append "Val: " <<< show) <$> event.sliderMoved
                        )
                    )
                ]
            ]
        ]
  )
  , next: bang (D.OnClick := (cb (const $ dpage Effects *> scrollToTop)))
  }