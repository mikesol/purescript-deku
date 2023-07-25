module Deku.DOM.Attr.Marginheight where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Iframe (Iframe_)

data Marginheight = Marginheight

instance Deku.Attribute.Attr everything Marginheight Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "marginheight", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Body_ Marginheight String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "marginheight", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Iframe_ Marginheight String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "marginheight", value: _ } <<<
    Deku.Attribute.prop'
