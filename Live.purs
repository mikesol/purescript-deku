module Deku.Example.Docs.Static.Live where

import Prelude

import Data.Maybe (maybe)
import Deku.Example.Docs.Scene (scene)
import Deku.Example.Docs.Types (OptionsForeign, stringToPage)
import Deku.Toplevel (hydrate)
import Effect (Effect)
import Effect.Exception (error, throwException)

main :: { | OptionsForeign } -> Effect Unit
main options = do
  page <- maybe
    (throwException $ error ("could not ingest options: " <> show options))
    (pure)
    (stringToPage options.startsWith)
  hydrate (scene { slug: options.slug, startsWith: page })