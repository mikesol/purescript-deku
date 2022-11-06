module Deku.Example.Docs.Pursx1 where

import Prelude

import Data.Foldable (oneOfMap)
import Deku.Attribute (cb, (:=))
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page(..), PageOptions)
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Pursx (psx, (~~))
import Examples as Examples
import Type.Proxy (Proxy(..))
import Web.Event.Event (preventDefault)

myDom =
  Proxy
    :: Proxy
         """<div>
    <button>I do nothing</button>
    <ul>
        <li>A</li>
        <li>B</li>
        <li>C</li>
    </ul>
    <div>
        <a href="https://example.com">foo</a>
        <i>bar</i>
        <span style="font-weight:800;">baz</span>
    </div>
    <svg height="100" width="100">
      <circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red" />
    </svg> 
    </div>
"""

px =
  Proxy
    :: Proxy
         """<div>
  <h1>PursX 1</h1>

  <h2>Like JSX... but better!</h2>

  <p>Writing out PureScript code for the DOM only really makes sense if you're doing some sort of interesting manipulations on the JS layer. Otherwise, it's pretty tedious and longer than HTML. Thankfully, there's a solution: PursX.</p>

  <p>PursX takes its name from JSX and it accomplishes a similar goal: the ability to embed HTML in your document. In the example below, we create the same exact component from the previous article, but in PursX.</p>

  ~code~

  <p>Here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Puurrrrrr ...sx</h2>

  <p>Static Pursx (meaning Pursx without any dynamic content) can be activated with the function <code>psx</code>.</p>

  <h2>Next steps</h2>
  <p>In this section, we used PursX to build the same component as the previous section. In the next section, we'll learn how to respond to <a ~next~ style="cursor:pointer;">events</a>.</p>
</div>"""

pursx1 :: forall r. { | PageOptions r } -> Nut
pursx1 options = px ~~
  { code:
      ( D.pre_
          [ D.code_
              [ text_ Examples.pursx1
              ]
          ]
      )
  , result: (psx myDom)
  , next: oneOfMap pure
      [ D.OnClick :=
          (cb (\e -> preventDefault e *> options.dpage Events *> scrollToTop))
      , D.Href := (options.slug <> "events1/")
      ]
  }