module Test.Main where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Filterable (filter)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Deku.Graph.Attribute (prop')
import Deku.Graph.DOM ((:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM2 (text, (@@), (~~))
import Deku.Graph.DOM2 as D2
import Deku.Interpret (connectXToY, makeElement, makeText, setAttributes)
import Deku.Rando (random)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Effect.Ref (Ref, modify, new, read, write)
import FRP.Behavior (Behavior, behavior)
import FRP.Event (create, fix, fold, makeEvent, subscribe)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)

data Color = Red | Green | Blue

c2s :: Color -> String
c2s Red = "red"
c2s Green = "green"
c2s Blue = "blue"

idTrain :: Ref Int -> Behavior Int
idTrain r = behavior \f -> makeEvent \k -> do
  r' <- modify (add 1) r
  subscribe f \x -> k (x r')

main :: Effect Unit
main = launchAff_ $ runSpec [ consoleReporter ] do
  describe "Tests" do
    it "Does nothing" $ liftEffect do
      { event, push } <- create
      let counter = fold (const $ add 1) event (-1)
      let
        ediv = filter ((_ == 3) <<< (_ `mod` 5)) counter $> Blue <|> pure Red
        ea = filter ((_ == 2) <<< (_ `mod` 7)) counter $> "a" <|> pure "b"
        evt = D2.div
          (ediv @@ \e -> [ D.Style := "color: " <> c2s e <> ";" ])
          [ D2.a
              (ea @@ \e -> [ D.Href := "https://example.com/" <> e ])
              [ text (empty ~~ identity) "hi" ]
          , D2.a
              (empty @@ identity)
              [ text (empty ~~ identity) "there" ]

          ]
      r <- new []
      rf <- new 0
      void $ subscribe (evt (Tuple <$> map show (idTrain rf) <*> pure Nothing))
        \o -> void $ modify (\x -> x <> [ o ]) r
      push unit
      outcome0 <- (map <<< map) ((#) unit) (read r)
      outcome0 `shouldEqual` map ((#) unit)
        [ (makeElement { id: "1", tag: "div" })
        , ( setAttributes
              { attributes: [ { key: "style", value: (prop' "color: red;") } ]
              , id: "1"
              }
          )
        , (makeElement { id: "2", tag: "a" })
        , ( setAttributes
              { attributes:
                  [ { key: "href", value: (prop' "https://example.com/b") } ]
              , id: "2"
              }
          )
        , (makeText { id: "3", text: "hi" })
        , (connectXToY { fromId: "3", toId: "2" })
        , (connectXToY { fromId: "2", toId: "1" })
        , (makeElement { id: "4", tag: "a" })
        , (makeText { id: "5", text: "there" })
        , (connectXToY { fromId: "5", toId: "4" })
        , (connectXToY { fromId: "4", toId: "1" })
        ]
      write [] r
      push unit
      outcome1 <- (map <<< map) ((#) unit) (read r)
      outcome1 `shouldEqual` []
      push unit
      outcome2 <- (map <<< map) ((#) unit) (read r)
      outcome2 `shouldEqual` map ((#) unit)
        [ ( setAttributes
              { attributes:
                  [ { key: "href", value: (prop' "https://example.com/a") } ]
              , id: "2"
              }
          )
        ]
