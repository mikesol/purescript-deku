module Deku.Examples.Docs.Examples.Events3 where

import Prelude

import Control.Alt ((<|>))
import Data.Filterable (compact)
import Data.Foldable (oneOf)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Control (dyn_, text_)
import Deku.Core (Nut, bussed, insert_, remove, sendToTop)
import Deku.DOM as D
import Deku.Listeners (click, keyUp, textInput)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (AnEvent, bus, keepLatest, mapAccum)
import Web.UIEvent.KeyboardEvent (code)

data MainUIAction
  = AddTodo
  | ChangeText String

data TodoAction = Prioritize | Delete

main :: Effect Unit
main = runInBody
  ( bussed \pushAction actionEvent -> do
      let
        accumulateTextAndEmitOnSubmit :: AnEvent _ String
        accumulateTextAndEmitOnSubmit = compact
          ( mapAccum
              ( \a b -> case a of
                  AddTodo -> b /\ Just b
                  ChangeText s -> s /\ Nothing
              )
              actionEvent
              ""
          )

        top :: Nut
        top =
          D.div_
            [ D.input
                ( oneOf
                    [ textInput $ pure (pushAction <<< ChangeText)
                    , keyUp $ pure \evt -> do
                        when (code evt == "Enter") $ do
                          pushAction AddTodo
                    ]
                )
                []
            , D.button
                (click $ pure $ pushAction AddTodo)
                [ text_ "Add" ]
            ]
      D.div_
        [ top
        , dyn_ D.div $
            map
              ( \txt -> keepLatest $ bus \p' e' ->
                  ( pure $ insert_ $ D.div_
                      [ text_ txt
                      , D.button
                          (click $ pure (p' sendToTop))
                          [ text_ "Prioritize" ]
                      , D.button
                          (click $ pure (p' remove))
                          [ text_ "Delete" ]
                      ]
                  ) <|> e'
              )
              accumulateTextAndEmitOnSubmit
        ]
  )
