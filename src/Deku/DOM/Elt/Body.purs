module Deku.DOM.Elt.Body where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Body_

class Body_Ctor i o | i -> o where
  body
    :: Event (Attribute Body_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Body_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  body a i = elementify "body" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Body_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  body a i = elementify "body" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Body_Ctor (Element locki payloadi) (Element locko payloado) where
  body a i = elementify "body" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Body_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  body a i = elementify "body" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

body_
  :: forall i o
   . Body_Ctor i o
  => i
  -> o
body_ = body empty
