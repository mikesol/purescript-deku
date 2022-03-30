module Deku.Example.Docs.Pursx1 where

import Prelude

import Deku.Core (Element)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page)
import Deku.Pursx (nut, (~~))
import Effect (Effect)
import Type.Proxy (Proxy(..))

px = Proxy :: Proxy """<div>
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
  <p>In this section, we PursX to build the same component as the previous section. In the next section, we'll learn how to respond to events.</p>
</div>"""


pursx1 :: (Page -> Effect Unit) -> Element
pursx1 dpage  = px ~~
  { code: nut (D.div_ [])
  , result: nut (D.div_ [])
  }