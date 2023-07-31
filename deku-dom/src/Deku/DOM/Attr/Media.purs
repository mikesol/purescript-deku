module Deku.DOM.Attr.Media where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Meta (Meta_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Style (Style_)

data Media = Media

instance Deku.Attribute.Attr everything Media Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "media", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Link_ Media String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "media", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Meta_ Media String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "media", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Source_ Media String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "media", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Style_ Media String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "media", value: _ } <<< Deku.Attribute.prop'
