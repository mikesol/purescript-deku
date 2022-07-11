module Deku.Example.SSRMain where

import Prelude

import Deku.Example.SSRCore (dku)
import Deku.Toplevel (hydrate)
import Effect (Effect)

main:: Effect Unit
main = hydrate dku
