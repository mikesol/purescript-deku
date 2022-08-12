module Deku.Example.Docs.Component where

import Prelude

import Data.Foldable (oneOfMap)
import Deku.Attribute (cb, (:=))
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page(..), PageOptions)
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Pursx (nut, (~~))
import Examples as Examples
import Type.Proxy (Proxy(..))
import Web.Event.Event (preventDefault)

px =
  Proxy    :: Proxy         """<div>
  <h1>A Simple Component</h1>

  <h3>Slightly more bells and whistles</h3>
  <p>
    Let's look at an example with several different DOM tags.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h1>Creating an element</h1>
  <p>To create an element, like for example a <code>span</code> element, the pattern goes like this:</p>

  <pre><code>mySpanWithAttrs = D.span attrs children
mySpanWithNoAttrs = D.span_ children
myDivWithNoChildren = D.div attrs blank
</code></pre>

  <p><code>attrs</code> contains attributes of type <code>Event (Attribute element)</code>, where <code>element</code> is the current element you're assigning attributes to. You never have to specify this type: it is inferred automatically by the attribute creation operator, aka <code>:=</code>. If you use an attribute that's unsupported by an element, the compiler will complain.</p>

  <p>For now, children is an array of children, not unlike Halogen or React sans JSX. We'll see some other types of children later in this guide.</p>

  <h1>Attributes</h1>
  <p>Attributes like an element's style or id are specified as the first argument to an element. Attributes are just <a href="https://github.com/mikesol/purescript-event/blob/master/src/FRP/Event.purs"><code>Event</code>-s</a>, so you can <code>pure</code> them to make them happen <i>now</i>, combine two event streams with <code>alt</code> to compose events, etc.</p>

  <p>As an example, we made the input a range slider using <code>pure (Xtype := "range")</code>. Unlike Halogen, there are no checks to make sure you give a valid string. So if you want your range slider to have the value of true, you can. One day, I may build some validators, but passing strings works decently well here.</p>

  <h2>Next steps</h2>
  <p>In this section, we built a simple component. In the next section, we'll recreate the exact same element using a different input syntax called <a ~next~ style="cursor:pointer;">Pursx</a>.</p>
</div>"""

components :: forall r. {|PageOptions r} -> Nut
components options = px ~~
  { code: nut
      ( D.pre_
          [ D.code_
              [ text_ Examples.component
              ]
          ]
      )
  , result: nut
      ( D.div_
          [ D.button_ [ text_ "I do nothing" ]
          , D.ul_ $ map (D.li_ <<< pure <<< text_) [ "A", "B", "C" ]
          , D.div_
              [ D.a (pure $ D.Href := "https://example.com")
                  [ text_ "foo " ]
              , D.i_ [ text_ " bar " ]
              , D.span (pure $ D.Style := "font-weight: 800;")
                  [ text_ " baz" ]
              ]
          , D.div_
              [ D.div_
                  [ D.div_ [ D.input (pure $ D.Xtype := "range") [] ]
                  ]
              ]
          ]
      )
  , next: oneOfMap pure [D.OnClick := (cb (\e -> preventDefault e *> options.dpage PURSX1 *> scrollToTop) ), D.Href := (options.slug <> "pursx1/") ]
  }