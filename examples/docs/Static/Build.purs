module Deku.Example.Docs.Static.Build where

import Prelude

import Data.Array ((!!))
import Data.Maybe (maybe)
import Deku.Example.Docs.Scene (scene)
import Deku.Example.Docs.Types (stringToPage)
import Deku.Toplevel (Template(..), runSSR)
import Effect (Effect)
import Effect.Console (log)
import Effect.Exception (error, throwException)
import Node.Process (argv)

main :: Effect Unit
main = do
  args <- argv
  pageString <- maybe (throwException $ error $ "args too short: " <> show args) pure (args !! 2)
  page <- maybe (throwException $ error $ "cannot parse: " <> pageString) pure (stringToPage pageString)
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
      <script type="module">
        import { main } from "./bundle.js";
        main(""" <> "\"" <> pageString <> "\"" <>
                  """)();
      </script>
    </head>"""
            , tail: "</html>"
            }
        )
        (scene page) >>= log