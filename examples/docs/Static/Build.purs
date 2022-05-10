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
        { head:
            """<!DOCTYPE html>
<html>
  <head>
    <title>Deku documentation</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="style.css">
		<script src="bundle.js" defer></script>
  </head>"""
        , tail: "</html>"
        }
    )
    scene >>= log