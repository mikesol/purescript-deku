module Deku.DOM.Elt.Hr where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Hr_

class Hr_Ctor i o | i -> o where
  hr
    :: Event (Attribute Hr_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Hr_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  hr a i = elementify "hr" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Hr_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  hr a i = elementify "hr" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Hr_Ctor (Element locki payloadi) (Element locko payloado) where
  hr a i = elementify "hr" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Hr_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  hr a i = elementify "hr" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

hr_
  :: forall i o
   . Hr_Ctor i o
  => i
  -> o
hr_ = hr empty
