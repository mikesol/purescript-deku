module Deku.DOM.Elt.Header where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Header_

class Header_Ctor i o | i -> o where
  header
    :: Event (Attribute Header_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Header_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  header a i = elementify "header" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Header_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  header a i = elementify "header" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Header_Ctor (Element locki payloadi) (Element locko payloado) where
  header a i = elementify "header" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Header_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  header a i = elementify "header" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

header_
  :: forall i o
   . Header_Ctor i o
  => i
  -> o
header_ = header empty
