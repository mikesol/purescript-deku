module Deku.Examples.Docs.Examples.Events2 where

import Prelude

import Control.Alt (alt, (<|>))
import Data.Filterable (filterMap)
import Data.Foldable (oneOfMap)
import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe(..))
import Data.Profunctor (lcmap)
import Data.Show.Generic (genericShow)
import Deku.Attribute (cb, (:=))
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (bus, bang)

data Page = Home | About | Contact
derive instance Generic Page _
instance Show Page where
  show = genericShow
data UIEvents = UIShown | PageChanged Page

main :: Effect Unit
main = runInBody1
  ( bus \push -> lcmap (bang UIShown <|> _) \event -> do
      D.div_
        [ D.div_
            $ map
              ( \page -> D.span_
                  [ D.a
                      ( oneOfMap bang
                          [ D.OnClick :=
                              cb (const $ push (PageChanged page))
                          , D.Style := "cursor:pointer;"
                          ]
                      )
                      [ text_ (show page) ]
                  , text_ " | "
                  ]
              )
              [ Home, About, Contact ]
        , D.div_ $
            ( bang Home <|> filterMap
                ( case _ of
                    PageChanged p -> Just p
                    _ -> Nothing
                )
                event
            ) <#> case _ of
              Home -> text_ "I'm a home page."
              About -> text_ "This page is about me."
              Contact -> text_ "Here's some contact info."
        ]
  )
