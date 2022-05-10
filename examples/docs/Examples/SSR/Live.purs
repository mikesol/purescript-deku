module Deku.Example.Docs.Examples.SSR.Live where

import Prelude

import Deku.Examples.Docs.Examples.SSR.App (app)
import Deku.Toplevel (hydrate)
import Effect (Effect)

main :: Effect Unit
main = hydrate app