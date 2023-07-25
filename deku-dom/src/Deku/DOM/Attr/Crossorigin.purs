module Deku.DOM.Attr.Crossorigin where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.DOM.Elt.Video (Video_)

data Crossorigin = Crossorigin

instance Deku.Attribute.Attr everything Crossorigin Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "crossorigin", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Audio_ Crossorigin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "crossorigin", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeImage_ Crossorigin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "crossorigin", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Image_ Crossorigin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "crossorigin", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Img_ Crossorigin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "crossorigin", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Link_ Crossorigin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "crossorigin", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Script_ Crossorigin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "crossorigin", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Video_ Crossorigin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "crossorigin", value: _ } <<<
    Deku.Attribute.prop'
