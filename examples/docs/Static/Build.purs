module Deku.Example.Docs.Static.Build where

import Prelude

import Deku.Example.Docs.Scene (scene)
import Deku.Toplevel (Template(..), runSSR)
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main =
  runSSR
    ( Template
        { head: """<html>
  <head>
    <title>Deku documentation</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="style.css">
		<script type="module">
			import { main } from "./bundle.js";
			main();
		</script>
  </head>"""
        , tail: "</html>"
        }
    )
    scene >>= log