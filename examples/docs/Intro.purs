module Deku.Example.Docs.Intro where

import Prelude

import Data.Foldable (oneOfMap)
import Deku.Attribute (cb, (:=))
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page(..), PageOptions)
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Pursx ((~~))
import Type.Proxy (Proxy(..))
import Web.Event.Event (preventDefault)

px =
  Proxy    :: Proxy         """<div>
  <h1>Deku</h1>

  <h3>A web micro-framework written in PureScript</h3>

  <p>Hi! You've found <a href="https://github.com/mikesol/purescript-deku">Deku</a>.</p>

  <p>Deku is the coolest web micro-framework that no one knows about yet. Except you, of course, as you're here. So welcome!</p>

  <p>The main goal of Deku is speed. I made it for the purpose of creating interactive web-based musical instruments, but it's equally useful as a general-purpose web framework. Its standard event-handling patterns tend to outperform those of React and Vue by a factor of 1.5-2x.</p>

  <p>This documentation is written in Deku and can be found <a href="https://github.com/mikesol/purescript-deku/tree/main/examples/docs">here</a>. One good way to follow along is by using the Deku starter repo, which you can clone <a href="https://github.com/mikesol/purescript-deku-starter">here</a>.</p>

  <p>And now, without further ado, check out the <a ~next~ style="cursor:pointer;">hello world section</a>!</p>
</div>"""

intro :: forall r. {|PageOptions r} -> Nut
intro options = px ~~
  {   next: oneOfMap pure [D.OnClick := (cb (\e -> preventDefault e *> options.dpage HelloWorld *> scrollToTop) ), D.Href := (options.slug <> "hello/") ]
 }