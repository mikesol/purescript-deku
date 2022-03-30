module Deku.Example.Docs.Component where

import Prelude

import Deku.Core (Element)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page)
import Deku.Pursx (nut, (~~))
import Effect (Effect)
import Type.Proxy (Proxy(..))

px = Proxy :: Proxy """<div>
  <h1>A Simple Component</h1>

  <h2>Slightly more bells and whistles</h2>
  <p>
    Let's look at an example with several different DOM tags. There are also a few different syntax options depending on what tune your fingers wish to type.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h1>Elements all the way down</h1>
  <p>Deku encodes the DOM using functions that represent elements. To create an element with a custom tag called <code>foo</code>, you can call <code>elementify "foo"</code> and that will creat a custom <code>foo</code> tag in your DOM.</p>
  <p>The encoding of elements in Deku is not unlike that in React or Halogen. It's a tree (like the Deku tree)! So go nuts!</p>

  <h1>Attributes</h1>
  <p>Elements postfixed with an underscore do not take attributes. That is un-fun, so in this example, you see attributes as well! Attributes like an element's style or id are specified as the first argument to an underscore-less element. Note that, if you have multiple attributes, you have to separate them with <code>alt</code>, aka "the tie fighter."</p>

  <p>As an example, we made the input a range slider using <code>pure (Xtype := "range")</code>. Unlike Halogen, there are no checks to make sure you give a valid string. So if you want your range slider to have the value of true, you can. One day, I may build some validators, but passing strings works decently well here.</p>

  <h2>Next steps</h2>
  <p>In this section, we built a simple component. In the next section, we'll recreate the exact same element using a different input syntax called Pursx.</p>
</div>"""

components :: (Page -> Effect Unit) -> Element
components dpage = px ~~
  { code: nut (D.div_ [])
  , result: nut (D.div_ [])
  }