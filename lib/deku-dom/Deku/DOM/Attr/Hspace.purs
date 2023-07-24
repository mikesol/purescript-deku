module Deku.DOM.Attr.Hspace where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)

data Hspace = Hspace

instance Deku.Attribute.Attr everything Hspace Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "hspace", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Embed_ Hspace String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "hspace", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Iframe_ Hspace String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "hspace", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Img_ Hspace String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "hspace", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Hspace String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "hspace", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Object_ Hspace String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "hspace", value: _ } <<< Deku.Attribute.prop'
