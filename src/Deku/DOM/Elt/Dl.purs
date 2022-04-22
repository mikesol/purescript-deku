module Deku.DOM.Elt.Dl where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Dl_

class Dl_Ctor i o | i -> o where
  dl
    :: Event (Attribute Dl_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dl_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  dl a i = elementify "dl" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dl_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  dl a i = elementify "dl" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dl_Ctor (Element locki payloadi) (Element locko payloado) where
  dl a i = elementify "dl" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dl_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  dl a i = elementify "dl" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

dl_
  :: forall i o
   . Dl_Ctor i o
  => i
  -> o
dl_ = dl empty
