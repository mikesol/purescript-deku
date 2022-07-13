module Deku.Example.SSRSSR where

import Prelude

import Deku.Example.SSRCore (dku)
import Deku.Toplevel (Template(..), runSSR)
import Effect (Effect)
import Effect.Console (log)

main:: Effect Unit
main = do
  h <- runSSR
        ( Template
            { head:
                """<!DOCTYPE html>
<html>
	<head>
		<title>Deku documentation</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width" />
		<link rel="stylesheet" href="style.css" />
        <script type="module">
			import { main } from "./index.js";
			main();
		</script>
	</head>
</html>"""
            , tail: "</html>"
            }
        )
        dku
  log h
