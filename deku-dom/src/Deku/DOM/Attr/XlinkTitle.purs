module Deku.DOM.Attr.XlinkTitle where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Use (Use_)

data XlinkTitle = XlinkTitle

instance Deku.Attribute.Attr everything XlinkTitle Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "xlink:title", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Image_ XlinkTitle String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "xlink:title", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr LinearGradient_ XlinkTitle String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "xlink:title", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Pattern_ XlinkTitle String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "xlink:title", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr RadialGradient_ XlinkTitle String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "xlink:title", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ XlinkTitle String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "xlink:title", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Use_ XlinkTitle String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "xlink:title", value: _ } <<<
    Deku.Attribute.prop'
