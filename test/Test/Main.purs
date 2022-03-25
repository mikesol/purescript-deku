module Test.Main where

import Prelude hiding (compare)

import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Deku.Control.Functions ((@>), u, freeze)
import Deku.Control.Types (oneFrame, uRes)
import Deku.Graph.Attribute (Attribute, prop')
import Deku.Graph.DOM (root)
import Deku.Graph.DOM as D
import Deku.HTML (HTML(..))
import Deku.Pursx (class PXStart)
import Deku.SSR (ssr)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)

testEmbed  :: Proxy (foo :: D.Element D.Span_ ())
testEmbed =
  Proxy    :: forall r. PXStart "~" " " """<div><div>~foo~</div></div>""" r => Proxy r
testCl  :: Proxy ()
testCl =
  Proxy    :: forall r. PXStart "~" " " """<div><input /></div>""" r => Proxy r
testDivDiv  :: Proxy (myH :: Array (Attribute D.H1_), myA :: Array (Attribute D.A_), myP :: Array (Attribute D.P_), newElt :: D.Element D.H2_ ())
testDivDiv =
  Proxy    :: forall r. PXStart "~" " " """<div class="a b">
<h1 ~myH~>Example Domain</h1>
~newElt~
<!-- a comment -->
<p ~myP~>This domain is for use in illustrative examples in documents. You may use this
    domain in literature without prior coordination or asking for permission.</p>
<p><a ~myA~ href="https://www.iana.org/domains/example">More information...</a></p>
</div>""" r => Proxy r

main :: Effect Unit
main = launchAff_ $ runSpec [ consoleReporter ] do
  describe "Tests" do
    it "Does basic SSR" do
      ssr
        ( map ((#) unit)
            ( uRes $ oneFrame
                ( ( \_ _ ->
                      u $ root (unsafeCoerce unit)
                        { button: D.button []
                            { txt: D.text "hi"
                            }
                        }

                  ) @> freeze
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