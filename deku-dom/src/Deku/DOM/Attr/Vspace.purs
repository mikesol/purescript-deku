module Deku.DOM.Attr.Vspace where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)

data Vspace = Vspace

instance Deku.Attribute.Attr everything Vspace Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "vspace", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Embed_ Vspace String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "vspace", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Iframe_ Vspace String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "vspace", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Img_ Vspace String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "vspace", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Vspace String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "vspace", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Object_ Vspace String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "vspace", value: _ } <<< Deku.Attribute.prop'
