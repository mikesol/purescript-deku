module Deku.DOM.Elt.Ruby where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Ruby_

class Ruby_Ctor i o | i -> o where
  ruby
    :: Event (Attribute Ruby_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Ruby_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  ruby a i = elementify "ruby" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Ruby_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  ruby a i = elementify "ruby" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Ruby_Ctor (Element locki payloadi) (Element locko payloado) where
  ruby a i = elementify "ruby" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Ruby_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  ruby a i = elementify "ruby" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

ruby_
  :: forall i o
   . Ruby_Ctor i o
  => i
  -> o
ruby_ = ruby empty
