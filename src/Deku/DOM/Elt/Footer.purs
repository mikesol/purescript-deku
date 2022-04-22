module Deku.DOM.Elt.Footer where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Footer_

class Footer_Ctor i o | i -> o where
  footer
    :: Event (Attribute Footer_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Footer_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  footer a i = elementify "footer" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Footer_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  footer a i = elementify "footer" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Footer_Ctor (Element locki payloadi) (Element locko payloado) where
  footer a i = elementify "footer" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Footer_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  footer a i = elementify "footer" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

footer_
  :: forall i o
   . Footer_Ctor i o
  => i
  -> o
footer_ = footer empty
