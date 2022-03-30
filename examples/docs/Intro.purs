module Deku.Example.Docs.Intro where

import Prelude

import Deku.Attribute (cb, (:=))
import Deku.Core (Element)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Pursx ((~~))
import Effect (Effect)
import Type.Proxy (Proxy(..))

px = Proxy :: Proxy """<div>
  <h1>Deku</h1>

  <h3>A web micro-framework written in PureScript</h3>

  <p>Hi! You've found Deku.</p>

  <p>Deku is the coolest web micro-framework that no one knows about yet. Except you, of course, as you're here. So welcome!</p>

  <p>The main goal of Deku is speed. I made it for the purpose of creating interactive web-based musical instruments, but it's equally useful as a general-purpose web framework. Its standard event-handling patterns tend to outperform those of React and Vue by a factor of 1.5-2x.</p>

  <p>This is the Deku documentation. Like most documentation, it's radically incomplete, hopelessly biased, and full of unfounded assumptions. That said, I hope it gets you started off on the right foot. If you have any questions, feel free ping me on the PureScript Discord.</p>

  <p>This documentation is written in Deku and can be found here. One good way to follow along is by using the Deku starter repo, which you can clone here.</p>

  <p>And now, without further ado, check out the <a ~next~ style="cursor:pointer;">hello world section</a>!</p>
</div>"""

intro :: (Page -> Effect Unit) -> Element
intro dpage  = px ~~
  { next: pure (D.OnClick := (cb (const $ dpage HelloWorld *> scrollToTop))) }