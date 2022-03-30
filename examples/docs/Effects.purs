module Deku.Example.Docs.Effects where

import Prelude

import Deku.Core (Element)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page)
import Deku.Pursx (nut, (~~))
import Effect (Effect)
import Type.Proxy (Proxy(..))

px = Proxy :: Proxy """<div>
  <h1>Effects</h1>

  <h2>Let's make a network call</h2>
  <p>
    This example is similar to the previous one in its design: the looping function is called in response to an event. The difference is that the response isn't immediate. Instead, we wait for the result of a network call.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Arbitrary effects</h2>
  <p>Because all event listeners execute in the effect monad, you can do more or less whatever you want. Make a network call, run a monad transformer stack just for fun, play music using purescript-wags. The sky's the limit!</p>

  <p>Another useful pattern when working with effects is to throttle input. For example, if we are making a network call, we may want to show a loading indicator and prevent additional network calls. This can be achieved by setting the callback to a no-op while the network call is executing, as shown in the example above.</p>

  <h2>Next steps</h2>
  <p>It is also possible to handle events (and by extension effectful actions in events, like network calls) in Pursx. Let's see how in the second Pursx section.</p>
</div>"""

effects :: (Page -> Effect Unit) -> Element
effects dpage  = px ~~
  { code: nut (D.div_ [])
  , result: nut (D.div_ [])
  }