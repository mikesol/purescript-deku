module Deku.Example.Docs.Events2 where

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
import Deku.Core (Element)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Pursx (nut, (~~))
import Effect (Effect)
import FRP.Event (bang, bus)
import Type.Proxy (Proxy(..))

data XPage = Home | About | Contact
derive instance Generic XPage _
instance Show XPage where
  show = genericShow
data UIEvents = UIShown | PageChanged XPage

px =  Proxy    :: Proxy
      """<div>
  <h1>Events 2</h1>

  <h2>Streaming the DOM</h2>
  <p>
    Up until now, our DOM has been static. This is OK in some cases, but in many cases, we need a dynamic DOM: one whose elements are inserted and removed based on user interaction. In Deku, we achieve this with <code>Event</code>-s.
  </p>

  <p>
    The example below shows a small navigation bar that inserts a new node in the DOM and removes the previous one whenever an element of the bar is clicked.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Eventful children</h2>

  <p>Up until now, children of a DOM element have always been an array of elements. For example, we've written <code>D.div_ [text_ "hello ", text_ "world"]</code>. In this example, we provide the bottom-most <code>D.div_</code> with an <code>Event</code> instead of an <code>Array</code>. Now, whenever the event is fired, the new node will update in the DOM.</p>

  <h2>Next steps</h2>
  <p>In this section, saw how to make our DOM more dynamic by using an <code>Event</code> in the place of an <code>Array of children</code>. In the next section, we'll expand this concept to a situation where an enclosing element needs to hold an indeterminate number of children, as in a TODO MVC for example. We'll see this in the next section on <a ~next~ style="cursor:pointer;">advanced events</a>.</p>
</div>"""

events2 :: forall lock payload. (Page -> Effect Unit) -> Element lock payload
events2 dpage = px ~~
  { code: nut
      ( D.pre_
          [ D.code_
              [ text_
                  """module Main where

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
  ( bus \push -> lcmap (alt (bang UIShown)) \event -> do
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
"""
              ]
          ]
      )
  , result: nut
        ( bus \push -> lcmap (alt (bang UIShown)) \event -> do
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
  , next: bang (D.OnClick := (cb (const $ dpage Effects *> scrollToTop)))
  }