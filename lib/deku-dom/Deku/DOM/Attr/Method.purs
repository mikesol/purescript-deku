module Deku.DOM.Attr.Method where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.TextPath (TextPath_)

data Method = Method

instance Deku.Attribute.Attr everything Method Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "method", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Button_ Method String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "method", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Form_ Method String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "method", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ Method String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "method", value: _ } <<< Deku.Attribute.prop'
