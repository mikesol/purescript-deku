module Deku.DOM.Elt.Article where

import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (Event)
import Safe.Coerce (coerce)
import FRP.Event.Class (bang)
import Type.Equality (class TypeEquals, proof)

data Article_

class Article_Ctor i o | i -> o where
  article
    :: Event (Attribute Article_)
    -> i
    -> o

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Article_Ctor (Event (Event (Element locki payloadi))) (Element locko payloado) where
  article a i = elementify "article" a (proof (coerce i))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Article_Ctor (Event (Element locki payloadi)) (Element locko payloado) where
  article a i = elementify "article" a (bang (proof (coerce i)))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Article_Ctor (Element locki payloadi) (Element locko payloado) where
  article a i = elementify "article" a (bang (bang (proof (coerce i))))

instance
  (TypeEquals locki locko, TypeEquals payloadi payloado) =>
  Article_Ctor (Array (Element locki payloadi)) (Element locko payloado) where
  article a i = elementify "article" a (oneOfMap (\i' -> bang (bang (proof (coerce i')))) i)

article_
  :: forall i o
   . Article_Ctor i o
  => i
  -> o
article_ = article empty
