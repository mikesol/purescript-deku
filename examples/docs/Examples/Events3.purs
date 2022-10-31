module Deku.Examples.Docs.Examples.Events3 where

import Prelude

import Control.Alt ((<|>))
import Data.Filterable (compact)
import Data.Foldable (oneOf)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Control (text_)
import Deku.Core (Nut, busUncurried, dyn, insert_, remove, sendToTop)
import Deku.DOM as D
import Deku.Do (useState')
import Deku.Do as Deku
import Deku.Listeners (click, keyUp, textInput)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, keepLatest, mapAccum)
import Web.UIEvent.KeyboardEvent (code)

data MainUIAction
  = AddTodo
  | ChangeText String

data TodoAction = Prioritize | Delete

main :: Effect Unit
main = runInBody Deku.do
  pushAction /\ actionEvent <- useState'
  let
    accumulateTextAndEmitOnSubmit :: Event String
    accumulateTextAndEmitOnSubmit = compact
      ( mapAccum
          ( \a b -> case b of
              AddTodo -> a /\ Just a
              ChangeText s -> s /\ Nothing
          )
          ""
          actionEvent
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
    , dyn
        $ map
            ( \txt -> Deku.do
                p' /\ e' <- keepLatest <<< busUncurried
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

