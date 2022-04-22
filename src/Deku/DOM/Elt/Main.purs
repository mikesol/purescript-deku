module Deku.DOM.Elt.Main where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Main_

class Main_Ctor i o | i -> o where
  main
    :: Event (Attribute Main_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Main_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  main a i = elementify "main" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Main_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  main a i = elementify "main" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Main_Ctor (Element locki payloadi) (Element locko payloado) where
  main a i = elementify "main" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Main_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  main a i = elementify "main" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

main_
  :: forall i o
   . Main_Ctor i o
  => i
  -> o
main_ = main empty
