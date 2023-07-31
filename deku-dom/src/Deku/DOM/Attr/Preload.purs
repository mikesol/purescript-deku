module Deku.DOM.Attr.Preload where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)

data Preload = Preload

instance Deku.Attribute.Attr everything Preload Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "preload", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Audio_ Preload String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "preload", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Video_ Preload String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "preload", value: _ } <<< Deku.Attribute.prop'
