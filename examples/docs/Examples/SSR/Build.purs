module Deku.Example.Docs.Examples.SSR.Build where

import Prelude

import Control.Monad.ST.Global (toEffect)
import Deku.Examples.Docs.Examples.SSR.App (app)
import Deku.Toplevel (runSSR)
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main =
  toEffect
    ( pure
        """<!DOCTYPE html>
<html>
  <head>
    <title>My static page</title>
		<script src="bundle.js" defer></script>
  </head>""" <> runSSR app <> pure "</html>"
    ) >>= log