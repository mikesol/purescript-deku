module Deku.Example.Docs.HelloWorld where

import Prelude

import Control.Plus (class Plus)
import Deku.Attribute (cb, (:=))
import Deku.Control (text_)
import Deku.Core (Element)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Pursx (nut, (~~))
import Effect (Effect)
import FRP.Event.Class (bang, class IsEvent)
import Type.Proxy (Proxy(..))

px = Proxy :: Proxy """<div>
  <h1>Hello world</h1>

  <h3>A small example</h3>

  <p>Here is "hello world" in Deku. In this and all the following sections, we'll start with a full example, and we'll pick it apart afterwards.</p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <p>You gotta start somewhere!</p>

  <h2>Our top-level component</h2>

  <p>Deku sets up shop in an arbitrary DOM component. In the main function above, we use 🚀 to automatically insert our Deku tree into the body.</p>

  <h2>Next steps</h2>
  <p>Now that we have our setup running, let's make a more interesting <a ~next~ style="cursor:pointer;">component</a>.</p>
</div>"""


helloWorld :: forall event payload.
  Plus event =>
  IsEvent event =>
  (Page -> Effect Unit) -> Element event payload
helloWorld dpage  = px ~~
  { code: nut (D.pre_ [D.code_ [text_ """module Main where

import Prelude

import Deku.Control (text_)
import Deku.Toplevel ((🚀))
import Effect (Effect)

main :: Effect Unit
main = unit 🚀 \_ _ -> text_ "Hello world""""]])
  , result: nut (D.div_ [text_ "Hello world"])
  , next: bang (D.OnClick := (cb (const $ dpage SimpleComponent *> scrollToTop)))
  }