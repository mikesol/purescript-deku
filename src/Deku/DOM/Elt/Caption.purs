module Deku.DOM.Elt.Caption where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Caption_

class Caption_Ctor i o | i -> o where
  caption
    :: Event (Attribute Caption_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Caption_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  caption a i = elementify "caption" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Caption_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  caption a i = elementify "caption" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Caption_Ctor (Element locki payloadi) (Element locko payloado) where
  caption a i = elementify "caption" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Caption_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  caption a i = elementify "caption" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

caption_
  :: forall i o
   . Caption_Ctor i o
  => i
  -> o
caption_ = caption empty
