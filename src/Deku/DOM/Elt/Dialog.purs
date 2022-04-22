module Deku.DOM.Elt.Dialog where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Dialog_

class Dialog_Ctor i o | i -> o where
  dialog
    :: Event (Attribute Dialog_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dialog_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  dialog a i = elementify "dialog" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dialog_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  dialog a i = elementify "dialog" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dialog_Ctor (Element locki payloadi) (Element locko payloado) where
  dialog a i = elementify "dialog" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Dialog_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  dialog a i = elementify "dialog" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

dialog_
  :: forall i o
   . Dialog_Ctor i o
  => i
  -> o
dialog_ = dialog empty
