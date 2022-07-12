module Deku.Example.SSRCore where

import Prelude

import Control.Alt ((<|>))
import Data.Filterable (filterMap)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Monoid.Always (always)
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (bussed, dyn, fixed, portal1, text_)
import Deku.Core (class Korok, Domable, insert, remove, sendToTop)
import Deku.DOM as D
import Deku.Pursx (nut, (~~))
import Deku.Toplevel (Template(..), runInBody, runSSR)
import Effect (Effect)
import Effect.Console (log)
import FRP.Event (bang, bus, keepLatest, mapAccum)
import Type.Proxy (Proxy(..))
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromEventTarget, value)
import Web.UIEvent.KeyboardEvent (code, fromEvent)

data MainUIAction
  = UIShown
  | AddTodo
  | ChangeText String

data TodoAction = Prioritize | Delete

dku :: forall s e m lock payload. Korok s m => Domable e m lock payload
dku = fixed
  let
    mvc = bussed \push -> lcmap (bang UIShown <|> _) \event -> do
      let
        top =
          [ D.input
              ( oneOfMap bang
                  [ D.OnInput := cb \e -> for_
                      ( target e
                          >>= fromEventTarget
                      )
                      ( value
                          >=> push <<< ChangeText
                      )
                  , D.OnKeyup := cb
                      \e -> for_ (fromEvent e) \evt -> do
                        when (code evt == "Enter") $ do
                          push AddTodo
                  ]
              )
              []
          , D.button
              (bang $ D.OnClick := push AddTodo)
              [ text_ "Add" ]
          ]
      fixed
        [ D.div_ top
        , dyn $
            map
              ( \txt -> keepLatest $ bus
                  ( lcmap (map (always :: m Unit -> Effect Unit)) \p' e' ->
                      ( insert $ D.div_
                          [ text_ txt
                          , D.button
                              ( bang $ D.OnClick := p' sendToTop
                              )
                              [ text_ "Prioritize" ]
                          , D.button
                              ( bang
                                  $ D.OnClick := p' remove
                              )
                              [ text_ "Delete" ]
                          ]
                      ) <|> e'
                  )
              )
              ( filterMap
                  ( \(tf /\ s) ->
                      if tf then Just s else Nothing
                  )
                  ( mapAccum
                      ( \a b -> case a of
                          ChangeText s -> s /\ (false /\ s)
                          AddTodo -> b /\ (true /\ b)
                          _ -> "" /\ (false /\ "")
                      )
                      event
                      ""
                  )
              )
        ]
  in
    [ mvc
    , portal1 (D.div_ [ text_ "This portal is intentionally unused" ]) \_ f -> D.div_ [ f mvc ]
    , mvc
    , portal1 (D.div_ [ text_ "Hello from a portal" ]) \h f -> D.div_ [ f mvc, h ]
    , mvc
    , (Proxy :: _ "<div>~a~ ~b~ ~c~ ~d~</div>") ~~
        { a: nut (D.div_ [ text_ "hello" ])
        , b: nut (D.div_ [ text_ "world" ])
        , c: nut
            ( D.div_
                [ (Proxy :: _ "<div>~a~ ~b~ ~c~ ~d~</div>") ~~
                    { a: nut (D.div_ [ text_ "testing1" ])
                    , b: nut (D.div_ [ text_ "testing12", mvc ])
                    , c: nut (D.div_ [ D.button_ [ text_ "I'm a button" ] ])
                    , d: nut (D.div_ [ text_ "testing3" ])
                    }
                ]
            )
        , d: nut (D.div_ [ text_ "hello" ])
        }
    ]

ssr'd :: Effect Unit
ssr'd = do
  h <- runSSR
    ( Template
        { head:
            "<!DOCTYPE html><html><head><script src=\"bundle.js\" defer></script></head>"
        , tail: "</html>"
        }
    )
    dku
  log h

main :: Effect Unit
main = runInBody dku