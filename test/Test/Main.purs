module Test.Main (main) where

import Prelude hiding (compare)

import Control.Monad.Indexed ((:*>))
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Deku.Control.Functions (imodifyRes)
import Deku.Control.Functions.Graph (freeze, (@!>))
import Deku.Control.Types (oneFrame)
import Deku.Create (icreate)
import Deku.Graph.Attribute (prop')
import Deku.Graph.DOM (root)
import Deku.Graph.DOM as DOM
import Deku.SSR (ssr)
import Deku.Tumult.Make (Indecent(..))
import Effect (Effect)
import Effect.Aff (launchAff_)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)
import Unsafe.Coerce (unsafeCoerce)

main :: Effect Unit
main = launchAff_ $ runSpec [ consoleReporter ] do
  describe "Tests" do
    it "Does basic SSR" do
      ssr
        ( map ((#) unit)
            ( oneFrame
                ( ( \_ _ -> imodifyRes (const unit) :*> icreate
                      ( root (unsafeCoerce unit)
                          { button: DOM.button []
                              { txt: DOM.text "hi"
                              }
                          }
                      )
                  ) @!> freeze
                )
                (Left unit)
                (const $ pure unit)
            ).instructions
        )
        `shouldEqual` Just
          ( E "div"
              [ { key: "style"
                , value: (prop' "display:content;")
                }
              ]
              [ (E "button" [] [ (T "hi") ]) ]
          )
