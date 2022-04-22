module Deku.DOM.Elt.H5 where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data H5_

class H5_Ctor i o | i -> o where
  h5
    :: Event (Attribute H5_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H5_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  h5 a i = elementify "h5" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H5_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  h5 a i = elementify "h5" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H5_Ctor (Element locki payloadi) (Element locko payloado) where
  h5 a i = elementify "h5" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  H5_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  h5 a i = elementify "h5" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

h5_
  :: forall i o
   . H5_Ctor i o
  => i
  -> o
h5_ = h5 empty
