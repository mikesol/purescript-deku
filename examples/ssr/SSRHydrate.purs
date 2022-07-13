module Deku.Example.SSRHydrate where

import Prelude

import Deku.Example.SSRCore (dku)
import Deku.Interpret (toForeign)
import Deku.Toplevel (hydrate')
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Effect.Console (log)
import Simple.JSON as JSON

main:: Effect Unit
main = do
  ffi /\ _ <- hydrate' dku
  toForeign ffi >>= log <<< JSON.writeJSON