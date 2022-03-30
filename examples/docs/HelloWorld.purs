module Deku.Example.Docs.HelloWorld where

import Prelude

import Deku.Core (Element)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page)
import Deku.Pursx (nut, (~~))
import Effect (Effect)
import Type.Proxy (Proxy(..))

px = Proxy :: Proxy """<div>
  <h1>Hello world</h1>

  <h2>A small example</h2>

  <p>Here is "hello world" in Deku. In this and all the following sections, we'll start with a full example, and we'll pick it apart afterwards.</p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <p>You gotta start somewhere!</p>

  <h2>Our top-level component</h2>

  <p>Deku sets up shop in an arbitrary DOM component. In the main function above, we use 🚀 to automatically insert our Deku tree into the body.</p>
</div>"""


helloWorld :: (Page -> Effect Unit) -> Element
helloWorld dpage  = px ~~
  { code: nut (D.div_ [])
  , result: nut (D.div_ [])
  }