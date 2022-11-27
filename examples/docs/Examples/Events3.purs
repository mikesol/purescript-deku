module Deku.Examples.Docs.Examples.Events3 where

import Prelude

import Data.Filterable (compact)
import Data.Foldable (oneOf)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Control (text_)
import Deku.Core (Nut, dyn)
import Deku.DOM as D
import Deku.Hooks (useDyn_, useState')
import Deku.Do as Deku
import Deku.Listeners (click, keyUp, textInput)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, mapAccum)
import Web.UIEvent.KeyboardEvent (code)

data MainUIAction
  = AddTodo
  | ChangeText String

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
                { remove, sendTo } <- useDyn_
                D.div_
                  [ text_ txt
                  , D.button
                      (click $ pure (sendTo 0))
                      [ text_ "Prioritize" ]
                  , D.button
                      (click $ pure remove)
                      [ text_ "Delete" ]
                  ]
            )
            accumulateTextAndEmitOnSubmit
    ]

