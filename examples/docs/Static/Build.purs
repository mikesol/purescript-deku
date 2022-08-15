module Deku.Example.Docs.Static.Build where

import Prelude

import Control.Monad.ST.Global (toEffect)
import Data.Argonaut as Parser
import Data.Array ((!!))
import Data.Codec.Argonaut as CA
import Data.Codec.Argonaut.Record as CAR
import Data.Either (either)
import Data.Maybe (maybe)
import Deku.Example.Docs.Scene (scene)
import Deku.Example.Docs.Types (Page(..), stringToPage)
import Deku.Toplevel (Template(..), runSSR)
import Effect (Effect)
import Effect.Console (log)
import Effect.Exception (error, throwException)
import Node.Encoding (Encoding(..))
import Node.FS.Sync (readTextFile)
import Node.Process (argv)

main :: Effect Unit
main = do
  args <- argv
  options <- maybe
    (pure { pageString: "Intro", startsWith: Intro, slug: "/", top: true })
    ( \f -> do
        s <- readTextFile UTF8 f
        parsed <- either
          ( \e -> throwException $ error $ "cannot convert string to json: "
              <> s
              <> " err: "
              <>
                show e
          )
          pure
          (Parser.jsonParser s)
        decoded <-
          either
            ( \e -> throwException $ error $ "cannot decode json: " <> s
                <> " err: "
                <> show e
            )
            pure $ CA.decode
            ( CA.object "Info"
                ( CAR.record
                    { page: CA.string
                    , slug: CA.string
                    , top: CA.boolean
                    }
                )
            )
            parsed
        page <- maybe
          (throwException $ error $ "cannot parse page: " <> decoded.page)
          pure
          (stringToPage decoded.page)
        pure
          { pageString: decoded.page
          , top: decoded.top
          , startsWith: page
          , slug: decoded.slug
          }
    )
    (args !! 2)
  toEffect (runSSR
    ( Template
        { head:
            """<!DOCTYPE html>
  <html>
    <head>
      <title>Deku documentation</title>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width">
      <link rel="stylesheet" href=""" <>
              if options.top then "\"style.css\""
              else "\"../style.css\""
                <>
                  """>
      <script type="module">
        import { main } from """ <>
              if options.top then "\"bundle.js\""
              else "\"../bundle.js\""
                <>
                  """;
        main({"startsWith":"""
                <> "\""
                <> options.pageString
                <> "\""
                <> ""","slug":"""
                <> "\""
                <> options.slug
                <> "\""
                <>
                  """})();
      </script>
    </head>"""
        , tail: "</html>"
        }
    )
    (scene options)) >>= log