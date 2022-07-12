module Deku.Example.SSRMain where

import Prelude

import Deku.Example.SSRCore (dku)
import Deku.Toplevel (runInBody)
import Effect (Effect)

main:: Effect Unit
main = runInBody dku
