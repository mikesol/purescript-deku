module Deku.DOM.Attr.Controls where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)

data Controls = Controls

instance Deku.Attribute.Attr everything Controls Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "controls", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Audio_ Controls String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "controls", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Video_ Controls String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "controls", value: _ } <<< Deku.Attribute.prop'
