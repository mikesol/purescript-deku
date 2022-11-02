module Deku.Example.Docs.Events2 where

import Prelude

import Control.Alt ((<|>))
import Data.Filterable (filterMap)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (text_)
import Deku.Core (Nut, bussed, dyn)
import Deku.DOM as D
import Deku.Do (useDyn_)
import Deku.Do as Deku
import Deku.Example.Docs.Types (Page(..), PageOptions)
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Listeners (click)
import Deku.Pursx ((~~))
import Examples as Examples
import FRP.Event (mapAccum)
import Type.Proxy (Proxy(..))
import Web.Event.Event (preventDefault, target)
import Web.HTML.HTMLInputElement (fromEventTarget, value)
import Web.UIEvent.KeyboardEvent (code, fromEvent)

data MainUIAction
  = UIShown
  | AddTodo
  | ChangeText String

data TodoAction = Prioritize | Delete

px =
  Proxy
    :: Proxy
         """<div>
  <h1>Events 2</h1>

  <h2>Dynamic children</h2>
  <p>
    Up until now, our DOM has been static. This is OK in some cases, but in many cases, we need a dynamic DOM: one whose elements are inserted and removed based on user interaction. In Deku, we achieve this with <code>Event</code>-s.
  </p>

  <p>
    The code below creates a todo list that allows a user to add, prioritize, and remove elements.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Events of events</h2>

  <p>In the previous sections, DOM element constructors like <code>div_</code> could only accept an <code>Array</code>. They <i>also</i> can accept an event of events. In this case, the outer event represents a dynamic element, and the inner event represents the <i>stage</i> of dynamism with a data type called <code>Child</code>. <code>Child</code> has three constructors:</p>

  <ul>
    <li><code>insert</code>, which takes an element.</li>
    <li><code>sendToTop</code>, which sends the current element to the top of its parent.</li>
    <li><code>remove</code>, which removes the element from its parent.</li>
  </ul>

  <p>The Deku engine listens for these in a specific order. <code>Insert</code> can be followed by 0 or more <code>SendToTop</code>-s. When a <code>Remove</code> is called, the stream is unsubscribed from the parent. Because we're in the land of <code>Event</code>-s, you can emit anything, but this is the how they will be listened to.</p>

  <h2>Next steps</h2>
  <p>In this section, we used nested events to insert and remove elements from a parent. In the next section, we'll see how we can use <a ~next~ style="cursor:pointer;">portals to move an element to a different place of the DOM</a>.</p>
</div>"""

events2
  :: forall r
   . { | PageOptions r }
  -> Nut
events2 options = px ~~
  { code:
      ( D.pre_
          [ D.code_
              [ text_ Examples.events3
              ]
          ]
      )
  , result:
      ( bussed \push -> lcmap (pure UIShown <|> _)
          \event -> do
            D.div_
              [ D.div_
                  [ D.input
                      ( oneOfMap pure
                          [ D.Style :=
                              "border-style:solid;border-width: 1px;border-color: black;"
                          , D.OnInput := cb \e -> for_
                              ( target e
                                  >>= fromEventTarget
                              )
                              ( value
                                  >=> push <<< ChangeText
                              )
                          , D.OnKeyup := cb \e -> for_ (fromEvent e) \evt -> do
                              when (code evt == "Enter") $ do
                                push AddTodo
                          ]
                      )
                      []
                  , D.button
                      ( (pure $ D.Style := "margin: 5px;") <|>
                          (pure $ D.OnClick := cb (const $ push AddTodo))
                      )
                      [ text_ "Add" ]
                  ]
              , dyn $ map
                  ( \txt -> Deku.do
                      { remove, sendTo } <- useDyn_
                      D.div_
                        [ D.span (pure $ D.Style := "margin: 5px;")
                            [ text_ txt ]
                        , D.button
                            ( (pure $ D.Style := "margin: 5px;") <|>
                                (click $ pure (sendTo 0))
                            )
                            [ text_ "Prioritize" ]
                        , D.button
                            ( (pure $ D.Style := "margin: 5px;") <|>
                                (click $ pure remove)
                            )
                            [ text_ "Delete" ]
                        ]
                  )
                  ( filterMap (\(tf /\ s) -> if tf then Just s else Nothing)
                      ( mapAccum
                          ( \a b -> case b of
                              ChangeText s -> s /\ (false /\ s)
                              AddTodo -> a /\ (true /\ a)
                              _ -> "" /\ (false /\ "")
                          )
                          ""
                          event
                      )
                  )
              ]
      )
  , next: oneOfMap pure
      [ D.OnClick :=
          (cb (\e -> preventDefault e *> options.dpage Portals *> scrollToTop))
      , D.Href := (options.slug <> "portals/")
      ]
  }