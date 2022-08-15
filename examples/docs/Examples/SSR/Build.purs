module Deku.Example.Docs.Examples.SSR.Build where

import Prelude

import Control.Monad.ST.Global (toEffect)
import Deku.Examples.Docs.Examples.SSR.App (app)
import Deku.Toplevel (Template(..), runSSR)
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main =
  toEffect (runSSR
    ( Template
        { head:
            """<!DOCTYPE html>
<html>
  <head>
    <title>My static page</title>
		<script src="bundle.js" defer></script>
  </head>"""
        , tail: "</html>"
        }
    )
    app) >>= log