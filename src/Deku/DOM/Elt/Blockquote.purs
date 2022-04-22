module Deku.DOM.Elt.Blockquote where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Blockquote_

class Blockquote_Ctor i o | i -> o where
  blockquote
    :: Event (Attribute Blockquote_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Blockquote_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  blockquote a i = elementify "blockquote" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Blockquote_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  blockquote a i = elementify "blockquote" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Blockquote_Ctor (Element locki payloadi) (Element locko payloado) where
  blockquote a i = elementify "blockquote" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Blockquote_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  blockquote a i = elementify "blockquote" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

blockquote_
  :: forall i o
   . Blockquote_Ctor i o
  => i
  -> o
blockquote_ = blockquote empty
