module Deku.Example.ReadmeLegend where

import Prelude

import CSS (bold, color, fontWeight, rgb)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (xdata)
import Deku.CSS (render)
import Deku.Control (text)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Pursx ((~~))
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Type.Proxy (Proxy(..))

main :: Effect Unit
main =
  -- `Deku.Toplevel` contains runInBody
  -- and other functions for hydration and SSR
  runInBody myNut
  where
  -- `Deku.Core` contains the `Nut` type, which is the type
  -- of all Deku applications.
  myNut :: Nut
  myNut = 
    -- `Deku.Do`` is the rebindable do context that allows you
    -- to use hooks in Deku
    Deku.do
      -- `Deku.Hooks` contains hooks like `useState`,
      -- `useDyn`, and `useMemoized`
      setCounter /\ counter <- useState 0
      -- `Deku.DOM`, often imported as `D`, contains all DOM elements,
      -- attributes, and event handlers
      D.div
          [
            -- `Deku.Listeners` contains functions for various common
            -- listeners like `click` and `keyUp`
            DL.runOn DL.click $ counter <#> add 1 >>> setCounter
          -- `Deku.CSS` contains `render`, which allows you to take `CSS` from
          -- `purescript-css` and use it in a Deku application
          , DA.style_ $ render do
              color (rgb 42 142 242)
              fontWeight bold
          -- `Deku.Attribute` contains constructors for
          -- uncommon and ad hoc `x-` attributes
          , pure (xdata "my-attr" "my-val")
          ]
        [
          -- `Deku.Control` contains all non-element buiding blocks
          -- for applications, including `text` and `<#~>`, which
          -- allows you to switch between elements.
          text (show <$> counter)
        -- `Deku.Pursx` contains the `~~` operator, which allows you to
        -- construct typesafe Deku using plain old html.
        , (Proxy :: _ "<p>Now you're a Deku ~adj~</p>") ~~
            { adj: text
                (counter <#> mod 2 >>> eq 0 >>> if _ then "newb" else "master")
            }
        ]