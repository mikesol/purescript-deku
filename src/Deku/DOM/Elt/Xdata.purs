module Deku.DOM.Elt.Xdata where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Xdata_

class Xdata_Ctor i o | i -> o where
  xdata
    :: Event (Attribute Xdata_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Xdata_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  xdata a i = elementify "data" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Xdata_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  xdata a i = elementify "data" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Xdata_Ctor (Element locki payloadi) (Element locko payloado) where
  xdata a i = elementify "data" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Xdata_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  xdata a i = elementify "data" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

xdata_
  :: forall i o
   . Xdata_Ctor i o
  => i
  -> o
xdata_ = xdata empty
