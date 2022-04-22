module Deku.DOM.Elt.Ul where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Ul_

class Ul_Ctor i o | i -> o where
  ul
    :: Event (Attribute Ul_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Ul_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  ul a i = elementify "ul" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Ul_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  ul a i = elementify "ul" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Ul_Ctor (Element locki payloadi) (Element locko payloado) where
  ul a i = elementify "ul" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Ul_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  ul a i = elementify "ul" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

ul_
  :: forall i o
   . Ul_Ctor i o
  => i
  -> o
ul_ = ul empty
