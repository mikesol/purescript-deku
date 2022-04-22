module Deku.DOM.Elt.Script where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Script_

class Script_Ctor i o | i -> o where
  script
    :: Event (Attribute Script_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Script_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  script a i = elementify "script" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Script_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  script a i = elementify "script" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Script_Ctor (Element locki payloadi) (Element locko payloado) where
  script a i = elementify "script" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Script_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  script a i = elementify "script" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

script_
  :: forall i o
   . Script_Ctor i o
  => i
  -> o
script_ = script empty
