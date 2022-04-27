module Deku.Example.Docs.Events2 where

import Prelude

import Control.Alt (alt, (<|>))
import Data.Filterable (filterMap)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (blank, plant, text_)
import Deku.Core (Element, Child(..))
import Deku.DOM as D
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Pursx (nut, (~~))
import Effect (Effect)
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

px =
  Proxy    :: Proxy      """<div>
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
    <li><code>Insert</code>, which takes an element.</li>
    <li><code>SendToTop</code>, which sends the current element to the top of its parent.</li>
    <li><code>Remove</code>, which removes the element from its parent.</li>
  </ul>

  <p>The Deku engine listens for these in a specific order. <code>Insert</code> can be followed by 0 or more <code>SendToTop</code>-s. When a <code>Remove</code> is called, the stream is unsubscribed from the parent. Because we're in the land of <code>Event</code>-s, you can emit anything, but this is the how they will be listened to.</p>

  <h2>Next steps</h2>
  <p>In this section, we used nested events to insert and remove elements from a parent. In the next section, we'll see how we can use <a ~next~ style="cursor:pointer;">portals to move an element to a different place of the DOM</a>.</p>
</div>"""

events2 :: forall lock payload. (Page -> Effect Unit) -> Element lock payload
events2 dpage = px ~~
  { code: nut
      ( D.pre_
          [ D.code_
              [ text_
                  """module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Filterable (filterMap)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (blank, text_)
import Deku.Core (Child(..))
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
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
main = runInBody1
  ( bus \push -> lcmap (bang UIShown <|> _) \event -> do
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
              blank
          , D.button
              (bang $ D.OnClick := cb (const $ push AddTodo))
              (text_ "Add")
          ]
      D.div_
        [ D.div_ top
        , D.div_ $
            ( \txt -> keepLatest $ bus \p' e' ->
                ( bang $ Insert $ D.div_
                    [ text_ txt
                    , D.button
                        ( bang
                            $ D.OnClick
                              := cb (const $ p' SendToTop)
                        )
                        [ text_ "Prioritize" ]
                    , D.button
                        ( bang
                            $ D.OnClick
                              := cb (const $ p' Remove)
                        )
                        [ text_ "Delete" ]
                    ]
                ) <|> e'
            ) <$>
              filterMap
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
        ]
  )
"""
              ]
          ]
      )
  , result: nut
      ( bus \push -> lcmap (alt (bang UIShown)) \event -> plant do
          D.div_
            [ D.div_
                [ D.input
                    ( oneOfMap bang
                        [ D.Style := "border-style:solid;border-width: 1px;border-color: black;"
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
                    blank
                , D.button ((bang $ D.Style := "margin: 5px;") <|> (bang $ D.OnClick := cb (const $ push AddTodo)))
                    (text_ "Add")
                ]
            , D.div_
                ( map
                    ( \txt -> keepLatest $ bus \p' e' ->
                        ( bang $ Insert $ D.div_ do
                            [ D.span (bang $ D.Style := "margin: 5px;")
                                (text_ txt)
                            , D.button
                                ( (bang $ D.Style := "margin: 5px;") <|>
                                    ( bang $ D.OnClick := cb
                                        (const $ p' SendToTop)
                                    )
                                )
                                [ text_ "Prioritize" ]
                            , D.button
                                ( (bang $ D.Style := "margin: 5px;") <|>
                                    (bang $ D.OnClick := cb (const $ p' Remove))
                                )
                                [ text_ "Delete" ]
                            ]
                        ) <|> e'
                    )
                    ( filterMap (\(tf /\ s) -> if tf then Just s else Nothing)
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
                )
            ]
      )

  , next: bang (D.OnClick := (cb (const $ dpage Portals *> scrollToTop)))
  }