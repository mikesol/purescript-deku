module Deku.DOM.Attr.Src where

import Prelude

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Script (Script_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Track (Track_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Src = Src

instance Attr Audio_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Embed_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Iframe_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Img_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Input_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Script_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Source_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Track_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr Video_ Src String where
  attr Src value = unsafeAttribute { key: "src", value: prop' value }

instance Attr everything Src Unit where
  attr Src _ = unsafeAttribute
    { key: "src", value: unset' }
