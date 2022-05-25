module Deku.Example.Docs.HelloWorld where

import Prelude

import Data.Foldable (oneOfMap)
import Deku.Attribute (cb, (:=))
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page(..), PageOptions)
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Pursx (nut, (~~))
import FRP.Event.Class (bang)
import Type.Proxy (Proxy(..))
import Web.Event.Event (preventDefault)

px =
  Proxy    :: Proxy         """<div>
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

helloWorld
  :: forall r. {|PageOptions r}
  -> Nut
helloWorld options = px ~~
  { code: nut
      ( D.pre_
          [ D.code_
              [ text_
                  """module Main where

import Prelude

import Deku.Control (text_)
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody (text_ "Hello world")
"""
              ]
          ]
      )
  , result: nut (D.div_ [ text_ "Hello world" ])
  , next: oneOfMap bang [D.OnClick := (cb (\e -> preventDefault e *> options.dpage SimpleComponent *> scrollToTop) ), D.Href := (options.slug <> "component/") ]
  }