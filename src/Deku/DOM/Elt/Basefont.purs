module Deku.DOM.Elt.Basefont where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Basefont_

class Basefont_Ctor i o | i -> o where
  basefont
    :: Event (Attribute Basefont_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Basefont_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  basefont a i = elementify "basefont" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Basefont_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  basefont a i = elementify "basefont" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Basefont_Ctor (Element locki payloadi) (Element locko payloado) where
  basefont a i = elementify "basefont" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Basefont_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  basefont a i = elementify "basefont" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

basefont_
  :: forall i o
   . Basefont_Ctor i o
  => i
  -> o
basefont_ = basefont empty
