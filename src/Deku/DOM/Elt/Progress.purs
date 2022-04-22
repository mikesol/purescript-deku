module Deku.DOM.Elt.Progress where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Progress_

class Progress_Ctor i o | i -> o where
  progress
    :: Event (Attribute Progress_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Progress_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  progress a i = elementify "progress" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Progress_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  progress a i = elementify "progress" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Progress_Ctor (Element locki payloadi) (Element locko payloado) where
  progress a i = elementify "progress" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Progress_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  progress a i = elementify "progress" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

progress_
  :: forall i o
   . Progress_Ctor i o
  => i
  -> o
progress_ = progress empty
