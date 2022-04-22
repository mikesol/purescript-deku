module Deku.DOM.Elt.Cite where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Cite_

class Cite_Ctor i o | i -> o where
  cite
    :: Event (Attribute Cite_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Cite_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  cite a i = elementify "cite" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Cite_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  cite a i = elementify "cite" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Cite_Ctor (Element locki payloadi) (Element locko payloado) where
  cite a i = elementify "cite" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Cite_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  cite a i = elementify "cite" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

cite_
  :: forall i o
   . Cite_Ctor i o
  => i
  -> o
cite_ = cite empty
