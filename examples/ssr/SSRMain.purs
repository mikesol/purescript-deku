module Deku.Example.SSRMain where

import Prelude

import Deku.Example.SSRCore (dku)
import Deku.Interpret (toForeign)
import Deku.Toplevel (runInBody')
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Effect.Console (log)
import Simple.JSON as JSON

main:: Effect Unit
main = do
  ffi /\ _ <- runInBody' dku
  toForeign ffi >>= log <<< JSON.writeJSON