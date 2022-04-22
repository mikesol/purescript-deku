module Deku.DOM.Elt.Source where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Source_

class Source_Ctor i o | i -> o where
  source
    :: Event (Attribute Source_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Source_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  source a i = elementify "source" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Source_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  source a i = elementify "source" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Source_Ctor (Element locki payloadi) (Element locko payloado) where
  source a i = elementify "source" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Source_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  source a i = elementify "source" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

source_
  :: forall i o
   . Source_Ctor i o
  => i
  -> o
source_ = source empty
