module Deku.DOM.Elt.Samp where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Samp_

class Samp_Ctor i o | i -> o where
  samp
    :: Event (Attribute Samp_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Samp_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  samp a i = elementify "samp" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Samp_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  samp a i = elementify "samp" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Samp_Ctor (Element locki payloadi) (Element locko payloado) where
  samp a i = elementify "samp" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Samp_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  samp a i = elementify "samp" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

samp_
  :: forall i o
   . Samp_Ctor i o
  => i
  -> o
samp_ = samp empty
