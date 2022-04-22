module Deku.DOM.Elt.Html where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Html_

class Html_Ctor i o | i -> o where
  html
    :: Event (Attribute Html_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Html_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  html a i = elementify "html" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Html_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  html a i = elementify "html" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Html_Ctor (Element locki payloadi) (Element locko payloado) where
  html a i = elementify "html" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Html_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  html a i = elementify "html" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

html_
  :: forall i o
   . Html_Ctor i o
  => i
  -> o
html_ = html empty
