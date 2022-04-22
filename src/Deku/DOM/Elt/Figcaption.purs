module Deku.DOM.Elt.Figcaption where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Figcaption_

class Figcaption_Ctor i o | i -> o where
  figcaption
    :: Event (Attribute Figcaption_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Figcaption_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  figcaption a i = elementify "figcaption" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Figcaption_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  figcaption a i = elementify "figcaption" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Figcaption_Ctor (Element locki payloadi) (Element locko payloado) where
  figcaption a i = elementify "figcaption" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Figcaption_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  figcaption a i = elementify "figcaption" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

figcaption_
  :: forall i o
   . Figcaption_Ctor i o
  => i
  -> o
figcaption_ = figcaption empty
