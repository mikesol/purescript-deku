module Deku.DOM.Attr.Src where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Script (Script_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Track (Track_)
import Deku.DOM.Elt.Video (Video_)

data Src = Src

instance Deku.Attribute.Attr everything Src Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "src", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Audio_ Src String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "src", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Embed_ Src String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "src", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Iframe_ Src String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "src", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Img_ Src String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "src", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Src String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "src", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Script_ Src String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "src", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Source_ Src String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "src", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Track_ Src String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "src", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Video_ Src String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "src", value: _ } <<< Deku.Attribute.prop'
