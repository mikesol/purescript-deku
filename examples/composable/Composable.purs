module Deku.Example.Composable where

import Prelude

import Control.Alt ((<|>))
import Data.Filterable (filterMap)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (text_, dyn)
import Deku.Core (bussed, fixed, insert, remove, sendToTop)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (bang, bus, keepLatest, mapAccum)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromEventTarget, value)
import Web.UIEvent.KeyboardEvent (code, fromEvent)

data MainUIAction
  = UIShown
  | AddTodo
  | ChangeText String

data TodoAction = Prioritize | Delete

main :: Effect Unit
main = runInBody
  ( fixed
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
                  ( \txt -> keepLatest $ bus \p' e' ->
                      ( bang $ insert $ D.div_
                          [ text_ txt
                          , D.button
                              ( bang
                                  $ D.OnClick := p' sendToTop
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
        [ mvc, mvc, mvc, mvc, mvc ]
  )