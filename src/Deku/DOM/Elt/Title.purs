module Deku.DOM.Elt.Title where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Title_

class Title_Ctor i o | i -> o where
  title
    :: Event (Attribute Title_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Title_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  title a i = elementify "title" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Title_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  title a i = elementify "title" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Title_Ctor (Element locki payloadi) (Element locko payloado) where
  title a i = elementify "title" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Title_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  title a i = elementify "title" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

title_
  :: forall i o
   . Title_Ctor i o
  => i
  -> o
title_ = title empty
