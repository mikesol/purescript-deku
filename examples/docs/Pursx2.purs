module Deku.Example.Docs.Pursx2 where

import Prelude

import Control.Alt ((<|>))
import Data.Compactable (compact)
import Data.Either (hush)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (text, text_)
import Deku.Core (Element)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page)
import Deku.Pursx (makePursx', nut, (~~))
import Deku.Subgraph (SubgraphAction(..), (@@))
import Effect (Effect)
import Type.Proxy (Proxy(..))

px = Proxy :: Proxy """<div>
  <h1>Pursx 2</h1>

  <h2>Working with events and effects</h2>
  <p>
    PursX would be of limited utility if it could only render static content. In this section, we'll see how to make it dynamic, both by modifying existing elements and inserting entirely new ones.
  </p>

  <p>The example below is the same one from the Pursx 1 section with two differences. The first is that the background color of the second list item is set dynamically. The second is that there is a new button that is dynamically inserted.
  </p>

  ?code?

  <p>And here's what it produces:</p>

  <blockquote> ?result? </blockquote>

  <h2>Dynamism in static content</h2>
  <p>Named slots for dynamic content are added to PursX with between two tildes, like <code>~foo~</code>. This separator doesn't have to be a tilde - it can be set programatically as well (see the Deku/Pursx.purs module for an example of how that is done). Also, we no longer use the <code>psx</code> command. Instead, we use the infix operator <code>~~</code> followed by arguments to our template. In the case of dynamic attributes, the argument is a stream of attributes. In the case of a dynamic section, the arguments are of type <code>Element</code>.</p>

  <h2>Next steps</h2>
  <p>In more complicated apps, like this documentation, we'll want to split up our components into sub-components and create a way for them to communicate back and forth. In the next section, we'll see one way to do this via subgraphs.</p>
</div>"""

myDom = Proxy :: Proxy """<div>
        <button>I do nothing</button>
        <ul>
          <li>A</li>
          <li ~myli~>B</li>
          <li>C</li>
        </ul>
        <div>
          <a href="https://github.com/mikesol/purescript-deku"></a>
          <i>bar</i>
          ~somethingNew~
          <span style="font-weight:800;">baz</span>
        </div>
        <div><div></div><div><input type="range"/></div></div>
      </div>
"""

pursx2 :: (Page -> Effect Unit) -> Element
pursx2 dpage = makePursx' (Proxy :: _ "?") px
  { code: nut (D.pre_ [D.code_ [text_ $ """module Deku.Examples.Docs.Examples.Pursx2 where

import Prelude

import Control.Alt ((<|>))
import Data.Compactable (compact)
import Data.Maybe (Maybe(..))
import Deku.Attribute (cb, (:=))
import Deku.Control (text)
import Deku.DOM as D
import Deku.Pursx (nut, (~~))
import Deku.Toplevel ((🚀))
import Effect (Effect)
import Type.Proxy (Proxy(..))

myDom = Proxy :: Proxy """ <> "\"\"\"" <> """<div>
        <button>I do nothing</button>
        <ul>
          <li>A</li>
          <li ~myli~>B</li>
          <li>C</li>
        </ul>
        <div>
          <a href="https://github.com/mikesol/purescript-deku"></a>
          <i>bar</i>
          ~somethingNew~
          <span style="font-weight:800;">baz</span>
        </div>
        <div><div></div><div><input type="range"/></div></div>
      </div>
""" <> "\"\"\"" <> """

main :: Effect Unit
main = Nothing 🚀 \push event -> myDom ~~
  { myli: pure (D.Style := "background-color:rgb(200,240,210);")
  , somethingNew: nut
      ( D.button (pure (D.OnClick := cb (const $ push (Just unit))))
          [ text
              $ (compact event $> "Thanks for clicking me!") <|>
                  pure "I was dynamically inserted"
          ]
      )
  }"""]])
  , result: nut
      ( pure (unit /\ InsertOrUpdate unit) @@ \_ push event' ->
          let
            event = compact (map hush event')
          in
            myDom ~~ { myli: pure (D.Style := "background-color:rgb(200,240,210);")
  , somethingNew: nut
      ( D.button (pure (D.OnClick := cb (const $ push (Just unit))))
          [ text
              $ (compact event $> "Thanks for clicking me!") <|>
                  pure "I was dynamically inserted"
          ]
      )
  }
      )
  }