module Deku.Example.Docs.Static.Live where

import Prelude

import Data.Foldable (traverse_)
import Deku.Example.Docs.Scene (scene)
import Deku.Example.Docs.Types (stringToPage)
import Deku.Toplevel (hydrate)
import Effect (Effect)

main :: String -> Effect Unit
main page = traverse_ (\p -> hydrate (scene p)) (stringToPage page)